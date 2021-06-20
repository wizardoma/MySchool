package com.wizardom.backend.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.MappedSuperclass;

@AllArgsConstructor
@Data
@MappedSuperclass
public abstract class BaseEntity<T> {
    T id;
}
