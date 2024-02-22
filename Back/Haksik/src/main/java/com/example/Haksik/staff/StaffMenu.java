package com.example.Haksik.staff;

import com.example.Haksik.StringListConverter;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
public class StaffMenu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String date;

    private double price;

    @Convert(converter = StringListConverter.class)
    private List<String> menu;
}
