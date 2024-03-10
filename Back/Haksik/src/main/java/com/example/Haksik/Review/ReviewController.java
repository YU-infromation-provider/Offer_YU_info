package com.example.Haksik.Review;

import com.example.Haksik.User.SiteUser;
import com.example.Haksik.User.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
    private final UserRepository userRepository;
    private final ReviewService reviewService;
    private final ReviewRepository reviewRepository;
    @PostMapping("/create")
    public void reviewCreate(@RequestBody ReviewModel reviewModel){
        Optional<SiteUser> os = userRepository.findByEmail(reviewModel.getEmail());
        if(os.isPresent()){
            SiteUser s = os.get();
            reviewService.create(reviewModel.getSubject(), reviewModel.getContent(), s,reviewModel.getCategory());
        }
    }

    @PostMapping("/joogdoList")
    public List<Review> joogdoList(){
        List<Review> joogdoList = reviewRepository.findByCategory(1);
        return joogdoList;
    }

    @PostMapping("/leedoList")
    public List<Review> leedoList(){
        List<Review> leedoList = reviewRepository.findByCategory(2);
        return leedoList;
    }

    @PostMapping("/staffList")
    public List<Review> staffList(){
        List<Review> staffList = reviewRepository.findByCategory(3);
        return staffList;
    }
}
