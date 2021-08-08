package com.wizardom.backend.application.posts.dto;

import com.wizardom.backend.application.students.dto.StudentDto;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class PostDto {
    private  long id;
    private  String body;
    private String title;
    private String postType;
    private String imageUrl;
    private StudentDto student;
    private Space space;
    private long date;
    
}
