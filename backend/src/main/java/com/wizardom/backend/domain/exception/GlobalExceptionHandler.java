package com.wizardom.backend.domain.exception;

import com.wizardom.backend.commons.response.Errors;
import com.wizardom.backend.commons.response.JsonResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler({CustomException.class})
    public ResponseEntity<?> handleStudentException(CustomException exception) {
        String code = exception.getCode();
        String summary = exception.getSummary();
        return response(HttpStatus.BAD_REQUEST, code,summary);
    }


    private ResponseEntity<?> response(HttpStatus status, String code, String summary){
        return new ResponseEntity<JsonResponse<?>>(
                new JsonResponse<>().setStatus(status.value()).setErrors(new Errors(code, summary)), status
        );
    }
}
