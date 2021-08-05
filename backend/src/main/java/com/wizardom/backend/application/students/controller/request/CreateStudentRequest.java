package com.wizardom.backend.application.students.controller.request;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CreateStudentRequest {
    private String id;
    private String name;
    private String matricNo;
    private String department;
    private String university;
    private String email;
    private String level;

}
