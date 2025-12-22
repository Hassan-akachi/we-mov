package com.pl.wemovbackend.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerId;
    @NonNull
    private String customerName;
    @Column(unique = true)
    private String mobile;
    @Column(unique = true)
    private String email;
}
