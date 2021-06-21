package com.wizardom.backend.domain.students.repository;

import com.wizardom.backend.domain.students.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, String> {
}
