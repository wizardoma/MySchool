package com.wizardom.backend.domain.university.repository;

import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.university.model.University;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UniversityRepository extends JpaRepository<University, Long> {
Optional<University> findByShortNameIgnoreCase(String shortName);
}
