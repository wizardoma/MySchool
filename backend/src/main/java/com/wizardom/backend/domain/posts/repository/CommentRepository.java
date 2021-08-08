package com.wizardom.backend.domain.posts.repository;

import com.wizardom.backend.domain.posts.comments.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}
