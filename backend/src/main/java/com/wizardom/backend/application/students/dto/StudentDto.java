package com.wizardom.backend.application.students.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class StudentDto {
    private String id;
    private String name;
    private String university;
    private String department;
    private String level;
    private String email;
}
