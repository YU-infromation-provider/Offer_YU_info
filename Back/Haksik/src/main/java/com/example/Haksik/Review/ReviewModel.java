package com.example.Haksik.Review;

import lombok.Getter;
import lombok.Setter;

@Getter
public class ReviewModel {
    private String subject;
    private String content;
    private String email;
    private Integer category;

    public ReviewModel(String subject, String content, String email, Integer category){
        this.subject = subject;
        this.content = content;
        this.email = email;
        this.category = category;
    }
}
