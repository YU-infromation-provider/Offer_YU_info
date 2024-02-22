package com.example.Haksik.Joogdo;

import com.example.Haksik.StringListConverter;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
@Entity
public class JoogdoMenu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String date;

    private String type;

    @Convert(converter = StringListConverter.class)
    private Map<String,Double> menu;
}
