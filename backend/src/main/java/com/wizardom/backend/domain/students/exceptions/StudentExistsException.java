package com.wizardom.backend.domain.students.exceptions;

import com.wizardom.backend.domain.exception.CustomException;

public class StudentExistsException extends CustomException {
    public StudentExistsException(String message) {
        super("student.exists",message);
    }
}
