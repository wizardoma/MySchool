package com.wizardom.backend.application.posts.dto;

import com.wizardom.backend.application.students.dto.StudentDto;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CommentDto {
    private long id;
    private String body;
    private StudentDto student;
    private long date;
}
