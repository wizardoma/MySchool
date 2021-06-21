package com.wizardom.backend.application.students.mapper;

import com.wizardom.backend.application.students.dto.StudentDto;
import com.wizardom.backend.domain.students.model.Student;


public class StudentMapper {
    public static StudentDto toDto(Student student) {
        return new StudentDto()
                .setDepartment(student.getDepartment())
                .setEmail(student.getEmail())
                .setId(student.getId())
                .setLevel(student.getLevel())
                .setUniversity(student.getUniversity().getFullName());
    }

    public static Student toStudent(StudentDto studentDto) {
        return new Student().setDepartment(studentDto
                .getDepartment())
                .setEmail(studentDto.getEmail())
                .setId(studentDto.getId())
                .setLevel(studentDto.getLevel());
    }
}
