package com.wizardom.backend.application.students.controller;

import com.wizardom.backend.application.students.controller.request.CreateStudentRequest;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.*;

import com.wizardom.backend.application.students.mapper.StudentMapper;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("students")
public class StudentController {
    final StudentService studentService;

    @PostMapping("")
    public ResponseEntity<?> saveUser(@ModelAttribute CreateStudentRequest userRequest) {
        System.out.println(userRequest.toString());
        Student student = studentService.saveStudent(userRequest);
        return created(StudentMapper.toDto(student));
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getUser(@PathVariable("id") String id) {
        Student student = studentService.getStudentById(id);
        return ok(StudentMapper.toDto(student));
    }

}
