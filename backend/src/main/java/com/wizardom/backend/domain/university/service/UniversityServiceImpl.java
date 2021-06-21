package com.wizardom.backend.domain.university.service;

import com.wizardom.backend.domain.university.exception.UniversityNotFoundException;
import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class UniversityServiceImpl extends UniversityService{
    private final UniversityRepository universityRepository;

    @Override
    public List<University> getUniversities() {
        return universityRepository.findAll();
    }

    @Override
    public University getByShortName(String shortName) {
        return  universityRepository.findByShortNameIgnoreCase(shortName).orElseThrow(
                () -> new UniversityNotFoundException("No university found")
        );
    }
}
