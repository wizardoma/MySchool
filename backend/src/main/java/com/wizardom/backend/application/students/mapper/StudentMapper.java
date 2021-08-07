package com.wizardom.backend.application.students.mapper;

import com.wizardom.backend.application.students.dto.StudentDto;
import com.wizardom.backend.domain.students.model.Student;

/**
 * @author Ibekason Alexander Onyebuchi
 */

public class StudentMapper {
    public static StudentDto toDto(Student student) {
        return new StudentDto()
                .setName(student.getFullName())
                .setImageUrl(student.getProfileUrl())
                .setMatricNo(student.getMatricNo())
                .setDescription(student.getDescription())
                .setDepartment(student.getDepartment().getName())
                .setEmail(student.getEmail())
                .setId(student.getId())
                .setLevel(student.getLevel())
                .setUniversity(student.getUniversity().getFullName());
    }

}
