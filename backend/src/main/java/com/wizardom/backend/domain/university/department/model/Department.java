package com.wizardom.backend.domain.university.department.model;

import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.university.model.University;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Accessors(chain = true)
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @ToString.Exclude
    @ManyToOne()
    private Space space;

    @ToString.Exclude
    @ManyToOne
    private University university;

    @ToString.Exclude
    @OneToMany
    private List<Student> students;
}
