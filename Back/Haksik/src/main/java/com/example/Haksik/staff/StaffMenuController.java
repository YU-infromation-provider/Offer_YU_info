package com.example.Haksik.staff;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/staff")
public class StaffMenuController {
    private final StaffMenuRepository staffMenuRepository;

    @GetMapping("/menu")
    public List<StaffMenu> getStaffMenu(){
        return staffMenuRepository.findAll();
    }
}
