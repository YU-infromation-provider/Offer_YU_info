package com.example.Haksik.Leedo;

import com.example.Haksik.staff.StaffMenu;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/leedo")
public class LeedoMenuController {
    private final LeedoMenuRepository leedoMenuRepository;
    @GetMapping("/menu")
    public List<LeedoMenu> getLeedoMenu(){
        return leedoMenuRepository.findAll();
    }
}
