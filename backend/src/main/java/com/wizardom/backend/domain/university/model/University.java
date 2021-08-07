package com.wizardom.backend.domain.university.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@Accessors(chain = true)
@Entity(name = "universities")
@Getter
@Setter
@ToString
public class University {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String shortName;
    private String fullName;

    @OneToMany
    private List<Department> departments;

    @JsonIgnore
    @OneToMany(mappedBy = "university")
    private List<Student> students;

}
