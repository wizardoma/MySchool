package com.wizardom.backend.domain.students.exceptions;

import com.wizardom.backend.domain.exception.CustomException;

public class StudentNotFoundException extends CustomException {
    public StudentNotFoundException(String message) {
        super("student.notfound",message);
    }
}
