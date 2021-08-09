package com.wizardom.backend.domain.posts.service;

import com.wizardom.backend.application.posts.controller.request.CreateCommentRequest;
import com.wizardom.backend.application.posts.controller.request.CreatePostRequest;
import com.wizardom.backend.domain.posts.comments.Comment;
import com.wizardom.backend.domain.posts.model.Post;

import java.util.List;

public interface PostService {
    List<Post> getFeeds();
    
    List<Post> getPostsByUser(String userId);
    
    Post getPostById(long id);

    List<Comment> getAllComments();

    List<Comment> getCommentsOfPosts(long postId);

    Comment createPostComment(long postId, CreateCommentRequest request);

    List<Post> getQuestions();


    Post createPost(CreatePostRequest request);
}
