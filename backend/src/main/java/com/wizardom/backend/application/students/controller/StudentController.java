package com.wizardom.backend.application.students.controller;

import com.wizardom.backend.application.students.controller.request.CreateStudentRequest;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.*;

import com.wizardom.backend.application.students.mapper.StudentMapper;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("api/v1/students")
public class StudentController {
    final StudentService studentService;

    @PostMapping("")
    public ResponseEntity<?> saveUser(@ModelAttribute CreateStudentRequest userRequest) {
        Student student = studentService.saveStudent(userRequest);
        return ok(StudentMapper.toDto(student));
    }


}
