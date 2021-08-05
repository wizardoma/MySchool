package com.wizardom.backend.domain.students.model;

import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.section.model.Section;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.university.model.University;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Data
@Accessors(chain = true)
@Table(name = "students")
public class Student {
    @Id
    private String id;

    @Embedded()
    private Name name;


    private  String matricNo;

    @ManyToOne
    private Section section;

    @ManyToOne
    private University university;

    @OneToMany
    private Collection<Post> posts;

    @ManyToMany()
    private Collection<Space> spaces;

    private String department;

    private String level;

    private String email;

    public String getFullName() {
        return  this.name.fullName();
    }

}
