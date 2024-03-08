package com.example.Haksik.User;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final UserRepository userRepository;
    @PostMapping("/signup")
    public void signup(@RequestBody User user){
        userService.create(user.getUsername(),user.getEmail(),user.getPassword());
    }

    @PostMapping("/login")
    public Integer login(@RequestBody User user){
        if(userService.check(user.getEmail(),user.getPassword()))
            return 200;
        return 0;
    }
}