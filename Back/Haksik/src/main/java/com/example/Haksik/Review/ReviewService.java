package com.example.Haksik.Review;

import com.example.Haksik.User.SiteUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public void create(String subject, String content, SiteUser siteUser, Integer category){
        Review r = new Review();
        r.setSubject(subject);
        r.setContent(content);
        r.setAuthor(siteUser);
        r.setCategory(category);
        r.setCreateDate(LocalDateTime.now());
        reviewRepository.save(r);
    }
}
