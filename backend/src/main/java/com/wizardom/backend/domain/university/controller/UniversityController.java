package com.wizardom.backend.domain.university.controller;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.*;

import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/universities")
public class UniversityController {
    private final UniversityService universityService;

    @GetMapping
    public ResponseEntity<?> getUniversities() {
        List<University> universities = universityService.getUniversities();
        return ok(universities);
    }

    @GetMapping("departments/{id}")
    public ResponseEntity<?> getDepartmentsOfUniversity(@PathVariable("id") String universityName) {
        return ok(universityService.getDepartmentsOfUniversity(universityName));
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getUniversityById(@PathVariable("id") long universityId) {
        return ok(universityService.getUniversityById(universityId));
    }

    @GetMapping("departments")
    public ResponseEntity<?> getAllDepartments() {
        return ok(universityService.getAllDepartments());
    }

}
