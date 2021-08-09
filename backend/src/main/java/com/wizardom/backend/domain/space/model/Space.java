package com.wizardom.backend.domain.space.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.university.department.model.Department;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Accessors(chain = true)
public class Space {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private long id;
    private String name;
    @ManyToMany(fetch = FetchType.LAZY)
    List<Student> students;

    @ManyToOne
    public Student owner;

    private String description;

    @OneToMany(fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Department> departments;

    private String imageUrl;

    @OneToMany(fetch = FetchType.LAZY)
    List<Post> posts;
}
