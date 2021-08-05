package com.wizardom.backend.domain.university.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@Accessors(chain = true)
@Entity(name = "universities")
@Data
public class University {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private long id;
    private String shortName;
    private String fullName;

    @OneToMany
    private List<Department> departments;

    @JsonIgnore
    @OneToMany(mappedBy = "university", fetch = FetchType.LAZY)
    private List<Student> students;

}
