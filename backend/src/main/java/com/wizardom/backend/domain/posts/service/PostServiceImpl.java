package com.wizardom.backend.domain.posts.service;

import com.wizardom.backend.application.posts.controller.request.CreateCommentRequest;
import com.wizardom.backend.application.posts.controller.request.CreatePostRequest;
import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.posts.comments.Comment;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.posts.model.PostType;
import com.wizardom.backend.domain.posts.repository.CommentRepository;
import com.wizardom.backend.domain.posts.repository.PostRepository;
import com.wizardom.backend.domain.students.exceptions.StudentNotFoundException;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
    private final StudentRepository studentRepository;
    private final PostRepository postRepository;
    private final CommentRepository commentRepository;

    @Override
    public List<Post> getFeeds() {
        List<Post> posts = postRepository.findAll().stream()
                .filter(post -> post.getPostType() == PostType.post)
                .collect(Collectors.toList());

        Collections.reverse(posts);
        return posts;
    }


    @Override
    public List<Post> getPostsByUser(String userId) {
        Student student = studentRepository.findById(userId).orElseThrow(() -> new StudentNotFoundException("No student found"));
        List<Post> posts = postRepository.findByStudent(student);
        Collections.reverse(posts);
        return posts;
    }

    @Override
    public Post getPostById(long id) {
        return postRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Resource was not found"));
    }

    @Override
    public List<Comment> getAllComments() {
        return commentRepository.findAll();

    }

    @Override
    public List<Comment> getCommentsOfPosts(long postId) {
        return PostById(postId).getComments();
    }

    @Override
    public Comment createPostComment(long postId, CreateCommentRequest request) {
        return commentRepository.save(new Comment().setBody(request.getBody())
                .setStudent(StudentById(request.getUserId()))
                .setPost(PostById(postId)));
    }

    @Override
    public List<Post> getQuestions() {
        List<Post> posts = postRepository.findAll().stream()
                .filter(post -> post.getPostType() == PostType.question)
                .collect(Collectors.toList());
        Collections.reverse(posts);
        return posts;

    }

    @Override
    public Post createPost(CreatePostRequest request) {
        Student student = StudentById(request.getUserId());
        return postRepository.save(new Post()
                .setBody(request.getBody())
                .setStudent(student)
                .setPostType(PostType.valueOf(request.getType()))
                .setTitle(request.getTitle())
        );
    }

    private Student StudentById(String userId) {
        return studentRepository.findById(userId).orElseThrow(() -> new StudentNotFoundException("No student found with ID"));

    }

    private Post PostById(long id) {
        return postRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("No Posts Found"));
    }
}
