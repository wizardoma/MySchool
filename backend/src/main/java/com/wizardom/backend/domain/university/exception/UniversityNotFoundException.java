package com.wizardom.backend.domain.university.exception;

import com.wizardom.backend.domain.exception.CustomException;

public class UniversityNotFoundException extends CustomException {
    public UniversityNotFoundException(String summary) {
        super("university.notfound", summary);
    }
}
