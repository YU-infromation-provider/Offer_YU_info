package com.example.Haksik;

import com.example.Haksik.Leedo.LeedoMenu;
import com.example.Haksik.Leedo.LeedoMenuController;
import com.example.Haksik.Leedo.LeedoMenuRepository;
import com.example.Haksik.staff.StaffMenu;
import com.example.Haksik.staff.StaffMenuRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
class HaksikApplicationTests {
	@Autowired
	StaffMenuRepository staffMenuRepository;

	@Test
	void contextLoads() {
		List<String> m = new ArrayList<>();
		m.add("카레라이스");
		m.add("제육볶음");
		m.add("김치");
		StaffMenu a = new StaffMenu();
		a.setMenu(m);
		staffMenuRepository.save(a);

	}
}
