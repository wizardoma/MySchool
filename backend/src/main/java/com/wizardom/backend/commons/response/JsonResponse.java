package com.wizardom.backend.commons.response;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class JsonResponse<T> {
    private int status;
    private T data;
    private Errors errors;

    static <T> JsonResponse<?> withData(int status, T data){
        return  new JsonResponse<>().setData(data).setStatus(status);
    }

    static  JsonResponse<?> withError(int status, Errors error){
        return new JsonResponse<>().setStatus(status).setErrors(error);
    }

    static JsonResponse<?> Nothing(int code){
        return new JsonResponse<>().setStatus(code);
    }



}
