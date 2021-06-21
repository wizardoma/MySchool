package com.wizardom.backend.domain.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class CustomException extends RuntimeException {
    private final String code;
    private final String summary;

    public CustomException(String code, String summary) {
        super(summary);
        this.code = code;
        this.summary = summary;
    }

}
