package com.wizardom.backend.application.students.mapper;

import com.wizardom.backend.application.students.dto.StudentDto;
import com.wizardom.backend.domain.students.model.Student;

/**
 * @author Ibekason Alexander Onyebuchi
 */

public class StudentMapper {
    public static StudentDto toDto(Student student) {
        return new StudentDto()
                .setMatricNo(student.getMatricNo())
                .setDepartment(student.getDepartment())
                .setEmail(student.getEmail())
                .setId(student.getId())
                .setLevel(student.getLevel())
                .setUniversity(student.getUniversity().getFullName());
    }

    public static Student toStudent(StudentDto studentDto) {
        return new Student().setDepartment(studentDto
                .getDepartment())
                .setMatricNo(studentDto.getMatricNo())
                .setEmail(studentDto.getEmail())
                .setId(studentDto.getId())
                .setLevel(studentDto.getLevel());
    }
}
