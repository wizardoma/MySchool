package com.wizardom.backend.domain.students.model;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Embeddable;

@Accessors(chain = true)
@Embeddable
@Data
public class Name {
    private String firstName;
    private String middleName;
    private String lastName;

    public String fullName(){
        return firstName + " "+ middleName + " " + lastName;
    }


}
