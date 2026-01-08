package com.pl.wemovbackend.security;

import com.pl.wemovbackend.services.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {

    // Handles unauthorized access (401 errors)
    @Autowired
    private JWTEntryPoint jwtEntryPoint;

    // Loads user details from database
    @Autowired
    private CustomUserDetailsService userDetailsService;

    // JWT filter that validates token on every request
    @Autowired
    private JwtAuthFilter jwtAuthFilter;

    /**
     * Main Spring Security configuration
     */
    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

        http
                // Disable CSRF because JWT is stateless
                .csrf(AbstractHttpConfigurer::disable)

                // Configure authorization rules
                .authorizeHttpRequests(auth -> auth

                        // Allow all GET requests (public read access)
                        .requestMatchers(HttpMethod.GET).permitAll()

                        // Public authentication endpoints
                        .requestMatchers("/api/auth/**").permitAll()

                        // Only authenticated users can add buses, routes, schedules
                        .requestMatchers(HttpMethod.POST,
                                "/api/bus/add",
                                "/api/schedule/add",
                                "/api/route/add"
                        ).authenticated()

                        // Reservation endpoint is public
                        .requestMatchers(HttpMethod.POST, "/api/reservation/add")
                        .permitAll()
                        .requestMatchers("/api/reservation/**").permitAll()
                        // Any other request must be authenticated
                        .anyRequest().authenticated()
                )

                // Handle authentication errors (401 Unauthorized)
                .exceptionHandling(exception ->
                        exception.authenticationEntryPoint(jwtEntryPoint)
                )

                // Disable session creation (JWT = stateless)
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                );

        // Add JWT filter before Spring Security's authentication filter
        http.addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    /**
     * Password encoder used for hashing user passwords
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * Authentication manager used during login
     */
    @Bean
    public AuthenticationManager authenticationManager(
            AuthenticationConfiguration configuration
    ) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers("/api/reservation/add");
    }
}
