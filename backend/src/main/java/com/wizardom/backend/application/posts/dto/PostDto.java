package com.wizardom.backend.application.posts.dto;

import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;

@Data
public class PostDto {
    private  long id;
    private  String body;
    private String title;
    private String imageUrl;
    private Student student;
    private Space space;
    private int dateTime;
    
}
