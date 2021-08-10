package com.wizardom.backend.domain.posts.comments;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Accessors(chain = true)
public class Comment {
    @Id
    @GeneratedValue
    private long id;

    private String body;

    @JsonIgnore
    @ManyToOne
    private Post post;

    @ManyToOne
    private Student student;

    private LocalDateTime date;

    @PrePersist
    private void setDate() {
        this.date = LocalDateTime.now();
    }


}
