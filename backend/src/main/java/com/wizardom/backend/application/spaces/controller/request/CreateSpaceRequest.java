package com.wizardom.backend.application.spaces.controller.request;

import lombok.Data;

@Data
public class CreateSpaceRequest {
    private String name;
    private String description;
    private String userID;
}
