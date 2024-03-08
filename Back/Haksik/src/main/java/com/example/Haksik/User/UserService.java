package com.example.Haksik.User;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    public SiteUser create(String username, String email, String password){
        SiteUser user = new SiteUser();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        this.userRepository.save(user);
        return user;
    }

    public boolean check(String email, String password){
        Optional<SiteUser> os = userRepository.findByEmail(email);
        if(os.isPresent()){
            SiteUser siteUser = os.get();
            return passwordEncoder.matches(password,siteUser.getPassword());
        }
        return false;
    }
}
