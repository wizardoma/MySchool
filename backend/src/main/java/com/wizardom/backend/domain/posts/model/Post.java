package com.wizardom.backend.domain.posts.model;

import com.wizardom.backend.domain.posts.comments.Comment;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@Accessors(chain = true)
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Student student;

    @OneToMany(mappedBy = "post", fetch = FetchType.EAGER)
    private List<Comment> comments;

    @ManyToOne
    private Space space;

    @Enumerated(value = EnumType.STRING)
    private PostType postType;

    private String imageUrl;

    private String title;
    
    @Column(name = "body", length = 3000)
    private String body;

    private LocalDateTime postDate = LocalDateTime.now();

}
