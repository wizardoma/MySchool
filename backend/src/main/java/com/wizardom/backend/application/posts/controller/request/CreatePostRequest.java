package com.wizardom.backend.application.posts.controller.request;

import lombok.Data;

@Data
public class CreatePostRequest {
    private String title;
    private String type;
    private String body;
    private String userID;
}
