package com.wizardom.backend.commons.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Accessors;


@Data
@AllArgsConstructor
@Accessors(chain = true)
public class Errors {
    private final String code;
    private final String summary;
}


