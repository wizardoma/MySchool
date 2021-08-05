package com.wizardom.backend.domain.posts.model;

import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Accessors(chain = true)
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Student student;

    @ManyToOne
    private Space space;

    @Enumerated(value = EnumType.STRING)
    private PostType postType;
    
    private String imageUrl;

    private String title;
    

    private String body;

    private LocalDateTime postDate = LocalDateTime.now();

}
