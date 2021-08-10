package com.wizardom.backend.domain.students.model;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Embeddable;

@Accessors(chain = true)
@Embeddable
@Getter
@Setter
@ToString
public class Name {
    private String firstName;
    private String lastName;

    public String fullName(){
        return this.firstName  + " " + (this.lastName == null || this.lastName.isEmpty() ? "" : this.lastName);
    }


}
