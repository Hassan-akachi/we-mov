package com.pl.wemovbackend.security;

import com.pl.wemovbackend.exceptions.ReservationApiException;
import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;

/**
 * JwtTokenProvider
 *
 * This class is responsible for:
 * 1. Generating JWT tokens after successful authentication
 * 2. Extracting username from JWT token
 * 3. Validating JWT tokens
 */
@Component
public class JwtTokenProvider {

    /**
     * Secret key used to sign and verify JWT tokens
     * Loaded from application.properties / application.yml
     */
    @Value("${app.jwt-secret}")
    private String jwtSecretKey;

    /**
     * Token expiration time in milliseconds
     * Example: 86400000 = 1 day
     */
    @Value("${app-jwt-expiration-milliseconds}")
    private Long expiration;

    /**
     * Generates a JWT token for an authenticated user
     *
     * @param authentication Spring Security authentication object
     * @return Signed JWT token as String
     */
    public String generateToken(Authentication authentication) {

        // Extract logged-in username
        String userName = authentication.getName();

        // Calculate token expiration time
        Date expireDate = new Date(new Date().getTime() + expiration);

        // Build and sign JWT token
        return Jwts.builder()
                .setSubject(userName)          // Username stored as subject
                .setIssuedAt(new Date())       // Token creation time
                .setExpiration(expireDate)     // Token expiry time
                .signWith(key())               // Sign token using secret key
                .compact();                    // Build token
    }

    /**
     * Extracts username (subject) from JWT token
     *
     * @param token JWT token
     * @return username stored inside the token
     */
    public String getUserName(String token) {

        // Parse token and extract claims
        Claims claims = Jwts.parser()
                .setSigningKey(key())          // Use secret key for validation
                .build()
                .parseClaimsJws(token)         // Validate and parse token
                .getBody();

        // Return username
        return claims.getSubject();
    }

    /**
     * Validates a JWT token
     *
     * @param token JWT token
     * @return true if token is valid
     * @throws ReservationApiException if token is invalid or expired
     */
    public boolean validateToken(String token) {
        try {
            // Parse token to validate signature and structure
            Jwts.parser()
                    .setSigningKey(key())
                    .build()
                    .parse(token);

            return true;

        } catch (MalformedJwtException e) {
            // Token format is invalid
            throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Invalid Token");

        } catch (ExpiredJwtException e) {
            // Token has expired
            throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Token Expired");

        } catch (UnsupportedJwtException e) {
            // Token type not supported
            throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Unsupported token");

        } catch (IllegalArgumentException e) {
            // Empty or null token
            throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Invalid argument");
        }
    }

    /**
     * Generates HMAC signing key from Base64 encoded secret
     *
     * @return cryptographic key used to sign/verify JWT
     */
    private Key key() {
        return Keys.hmacShaKeyFor(
                Decoders.BASE64.decode(jwtSecretKey)
        );
    }
}
