package com.wizardom.backend.domain.section.model;

import com.wizardom.backend.domain.space.model.Space;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Section {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @OneToMany
    List<Space> spaces;
}
