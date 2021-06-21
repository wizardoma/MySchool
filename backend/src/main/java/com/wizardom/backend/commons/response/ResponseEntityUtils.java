package com.wizardom.backend.commons.response;

import static org.springframework.http.HttpStatus.*;
import org.springframework.http.ResponseEntity;

public class ResponseEntityUtils {

    public static ResponseEntity<?> ok(){
        return new ResponseEntity<JsonResponse<?>>(
                JsonResponse.Nothing(OK.value()), OK
                );
    }

    public static <T> ResponseEntity<?> ok(T payload){
        return new ResponseEntity<JsonResponse<?>>(
                JsonResponse.withData(OK.value(),payload), OK
        );
    }

    public static <T> ResponseEntity<?> created(T payload){
        return new ResponseEntity<JsonResponse<?>>(
                JsonResponse.withData(CREATED.value(),payload), CREATED
        );
    }

}
