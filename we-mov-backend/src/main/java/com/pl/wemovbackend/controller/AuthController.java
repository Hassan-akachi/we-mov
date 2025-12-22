package com.pl.wemovbackend.controller;

import com.pl.wemovbackend.entities.AppUsers;
import com.pl.wemovbackend.models.AuthResponseModel;
import com.pl.wemovbackend.security.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    // JWT expiration time (in milliseconds) loaded from application.properties
    @Value("${app-jwt-expiration-milliseconds}")
    private Long expiration;

    // Spring Security authentication manager
    @Autowired
    private AuthenticationManager authenticationManager;

    // Utility class for generating and validating JWT tokens
    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    /**
     * Login endpoint
     * Authenticates user credentials and returns JWT token
     *
     * @param user AppUsers object containing username and password
     * @return AuthResponseModel with JWT token and expiration info
     */
    @PostMapping("/login")
    public ResponseEntity<AuthResponseModel> login(@RequestBody AppUsers user) {

        // Authenticate username and password
        Authentication authentication =
                authenticationManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                user.getUserName(),
                                user.getPassword()
                        )
                );

        // Store authentication in Spring Security context
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // Generate JWT token for authenticated user
        String token = jwtTokenProvider.generateToken(authentication);

        // Build authentication response
        AuthResponseModel authResponseModel = new AuthResponseModel(
                HttpStatus.OK.value(),
                "Successfully logged in",
                token,
                System.currentTimeMillis(),
                expiration
        );

        return ResponseEntity.ok(authResponseModel);
    }
}
