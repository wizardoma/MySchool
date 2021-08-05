package com.wizardom.backend.domain.posts.repository;

import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.students.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {
    
    List<Post> findByStudent(Student student);
}
