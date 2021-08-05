package com.wizardom.backend.domain.posts.service;

import com.wizardom.backend.application.posts.controller.request.CreatePostRequest;
import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.posts.model.PostType;
import com.wizardom.backend.domain.posts.repository.PostRepository;
import com.wizardom.backend.domain.students.exceptions.StudentNotFoundException;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
    private final StudentRepository studentRepository;
    private final PostRepository postRepository;

    @Override
    public List<Post> getFeeds() {
        return postRepository.findAll();
    }

    @Override
    public List<Post> getPostsByUser(String userId) {
        Student student = studentRepository.findById(userId).orElseThrow(() -> new StudentNotFoundException("No student found"));
        return postRepository.findByStudent(student);
    }

    @Override
    public Post getPostById(long id) {
        return postRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Resource was not found"));
    }

    @Override
    public Post createPost(CreatePostRequest request) {
        Student student = studentRepository.findById(request.getUserID()).orElseThrow(() -> new StudentNotFoundException("No student found with ID"));

        return postRepository.save(new Post().setBody(request.getBody())
                .setStudent(student)
                .setPostType(PostType.valueOf(request.getType()))
                .setTitle(request.getTitle())
        );
    }
}
