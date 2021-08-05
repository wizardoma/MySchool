package com.wizardom.backend.domain.department.model;

import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.university.model.University;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @ManyToOne
    private University university;

    @OneToMany
    private List<Student> students;
}
