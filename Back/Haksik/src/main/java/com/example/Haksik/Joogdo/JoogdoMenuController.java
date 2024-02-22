package com.example.Haksik.Joogdo;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/joogdo")
public class JoogdoMenuController {
    private final JoogdoMenuRepository joogdoMenuRepository;
    @GetMapping("/menu")
    public List<JoogdoMenu> getJoogdoMenu(){
        return joogdoMenuRepository.findAll();
    }
}
