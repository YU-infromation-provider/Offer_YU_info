package com.example.Haksik;

import com.example.Haksik.Leedo.LeedoMenu;
import com.example.Haksik.Leedo.LeedoMenuController;
import com.example.Haksik.Leedo.LeedoMenuRepository;
import com.example.Haksik.User.SiteUser;
import com.example.Haksik.User.User;
import com.example.Haksik.User.UserRepository;
import com.example.Haksik.User.UserService;
import com.example.Haksik.staff.StaffMenu;
import com.example.Haksik.staff.StaffMenuRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.*;

@SpringBootTest
class HaksikApplicationTests {
	@Autowired
	UserRepository userRepository;

	@Autowired
	UserService userService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Test
	void contextLoads() {
		Optional<SiteUser> os = userRepository.findByEmail("asdf@naver.com");
		if (os.isPresent()){
			SiteUser siteUser = os.get();
			if(passwordEncoder.matches("asdf",siteUser.getPassword()))
				System.out.println("SUCESS!!!");
			else
				System.out.println("WTF!!!!");
		}
		else
			System.out.println("FAIL!!!!!!!!!!!!!!!!!");
	}
}
