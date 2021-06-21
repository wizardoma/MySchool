package com.wizardom.backend.domain.university.service;

import com.wizardom.backend.domain.BaseService;
import com.wizardom.backend.domain.university.model.University;
import org.springframework.stereotype.Service;

import java.util.List;

public abstract class UniversityService extends BaseService {

    public abstract List<University> getUniversities();
    public abstract University getByShortName(String shortName);
}
