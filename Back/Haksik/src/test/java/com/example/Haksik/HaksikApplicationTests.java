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
	LeedoMenuRepository leedoMenuRepository;

	@Test
	void contextLoads() {
		leedoMenuRepository.deleteAll();
		LeedoMenu m = new LeedoMenu();
////		List<Map<String,Double>>list = new ArrayList<>();
////		List<Map<String,Double>>list2 = new ArrayList<>();
		Map<String,Double> a = new HashMap<>();
////		Map<String,Double> a2 = new HashMap<>();
////		Map<String,Double> a3 = new HashMap<>();
		a.put("정식",6.0);
		a.put("영대라면",3.2);
		a.put("만두라면",3.4);
//		System.out.println(a);
////		list.add(a);
////		list.add(a2);
////		list.add(a3);
		m.setType("정식/라면/찌개");
		m.setDate("월");
		m.setMenu(a);
		leedoMenuRepository.save(m);
	}
}
