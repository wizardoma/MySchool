package com.wizardom.backend.application.posts.controller;

import com.wizardom.backend.application.posts.controller.request.CreateCommentRequest;
import com.wizardom.backend.application.posts.controller.request.CreatePostRequest;
import com.wizardom.backend.application.posts.mapper.PostMapper;
import com.wizardom.backend.domain.posts.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.ok;

@RequiredArgsConstructor
@RequestMapping("posts")
@RestController
public class PostController {
    private final PostService postService;

    @GetMapping("questions")
    public ResponseEntity<?> getQuestions() {
        return ok(
                postService
                        .getQuestions().stream()
                        .map(PostMapper::toDto)
                        .collect(Collectors.toList())
        );
    }

    @GetMapping("{postId}")
    public ResponseEntity<?> getPostById(@PathVariable long postId){
        return  ok(
                PostMapper.toDto(postService.getPostById(postId))
        );
    }

    @PostMapping("")
    public ResponseEntity<?> createPost(@ModelAttribute CreatePostRequest request) {
        return ok(
                PostMapper.toDto(postService.createPost(request)));
    }

    @GetMapping("")
    public ResponseEntity<?> getFeeds() {
        return ok(postService.getFeeds().stream().map((PostMapper::toDto)).collect(Collectors.toList()));
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<?> getPostsByUser(@PathVariable String id) {
        return ok(postService.getPostsByUser(id).stream()
                .map((PostMapper::toDto))
                .collect(Collectors.toList()));
    }


    @PostMapping("{postId}/comments")
    public ResponseEntity<?> createComment(@PathVariable long postId, @ModelAttribute CreateCommentRequest request) {
        return ok(postService.createPostComment(postId, request));
    }

    @GetMapping("/{postId}/comments")
    public ResponseEntity<?> getCommentsOfPost(@PathVariable long postId){
        return ok(postService.getCommentsOfPosts(postId));
    }
}

