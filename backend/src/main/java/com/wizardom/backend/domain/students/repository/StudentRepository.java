package com.wizardom.backend.domain.students.repository;

import com.wizardom.backend.domain.students.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StudentRepository extends JpaRepository<Student, String> {
    Optional<Student> findByMatricNo(String matricNo);
}
