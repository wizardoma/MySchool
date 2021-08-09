package com.wizardom.backend.application.posts.controller.request;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
public class CreateCommentRequest {
    private String userId;
    private String body;
}
