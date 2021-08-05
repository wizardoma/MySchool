package com.wizardom.backend.domain.exception;

public class ResourceNotFoundException extends CustomException{
    
    static private  final String code = "resource.notfound";
    
    public ResourceNotFoundException(String message) {
        super(code, message);
    }
}
