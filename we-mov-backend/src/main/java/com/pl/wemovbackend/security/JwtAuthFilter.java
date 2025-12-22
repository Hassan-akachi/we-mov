package com.pl.wemovbackend.security;

import com.pl.wemovbackend.services.CustomUserDetailsService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * JwtAuthFilter
 *
 * This filter:
 * 1. Runs once per HTTP request
 * 2. Extracts JWT token from Authorization header
 * 3. Validates JWT token
 * 4. Loads user details
 * 5. Sets authentication in Spring Security context
 */
@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    /**
     * This method is automatically called for every incoming HTTP request
     */
    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {

        // Extract JWT token from request header
        String token = getTokenFromRequest(request);

        // If token exists and is valid
        if (StringUtils.hasText(token) && jwtTokenProvider.validateToken(token)) {

            // Extract username from token
            String userName = jwtTokenProvider.getUserName(token);

            // Load user details from database
            UserDetails userDetails =
                    customUserDetailsService.loadUserByUsername(userName);

            // Create authentication object
            UsernamePasswordAuthenticationToken authenticationToken =
                    new UsernamePasswordAuthenticationToken(
                            userDetails,                 // Authenticated user
                            null,                        // No credentials needed
                            userDetails.getAuthorities() // User roles/permissions
                    );

            // Attach request details (IP, session, etc.)
            authenticationToken.setDetails(
                    new WebAuthenticationDetailsSource().buildDetails(request)
            );

            // Store authentication in security context
            SecurityContextHolder.getContext()
                    .setAuthentication(authenticationToken);
        }

        // Continue filter chain (VERY IMPORTANT)
        filterChain.doFilter(request, response);
    }

    /**
     * Extracts JWT token from Authorization header
     *
     * Expected format:
     * Authorization: Bearer <JWT_TOKEN>
     */
    private String getTokenFromRequest(HttpServletRequest request) {

        // Read Authorization header
        String bearerToken = request.getHeader("Authorization");

        // Check if header has text and starts with "Bearer "
        if (StringUtils.hasText(bearerToken)
                && bearerToken.startsWith("Bearer ")) {

            // Remove "Bearer " prefix and return token
            return bearerToken.substring(7);
        }

        return null;
    }
}
