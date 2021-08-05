package com.wizardom.backend.domain.university.service;

import com.wizardom.backend.domain.department.model.Department;
import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.university.exception.UniversityNotFoundException;
import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Ibekason Alexander Onyebuchi
 */

@RequiredArgsConstructor
@Service
public class UniversityServiceImpl extends UniversityService {
    private final UniversityRepository universityRepository;

    @Override
    public University getUniversityById(long universityId) {
        return universityRepository.findById(universityId)
                .orElseThrow(() -> new ResourceNotFoundException("No University found"));
    }

    @Override
    public List<University> getUniversities() {
        return universityRepository.findAll();
    }

    @Override
    public University getByShortName(String shortName) {
        return universityRepository.findByShortNameIgnoreCase(shortName).orElseThrow(
                () -> new UniversityNotFoundException("No university found")
        );
    }

    @Override
    public List<Department> getDepartmentsOfUniversity(long universityId) {
        return universityRepository.findById(universityId)
                .orElseThrow(() -> new ResourceNotFoundException("No university found"))
                .getDepartments();
    }

}
