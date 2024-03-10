package com.example.Haksik.Review;

import com.example.Haksik.User.SiteUser;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 200)
    private String subject;

    private String content;

    private LocalDateTime createDate;

    @ManyToOne
    private SiteUser author;

    private Integer category;
}
