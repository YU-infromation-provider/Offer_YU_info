package com.example.Haksik.User;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;

    @Column(unique = true)
    private String username;

    @Column(unique = true)
    private String name;

    private String password;

    @Column(unique = true)
    private String email;
}
