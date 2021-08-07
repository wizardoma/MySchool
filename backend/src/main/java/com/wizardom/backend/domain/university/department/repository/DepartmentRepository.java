package com.wizardom.backend.domain.university.department.repository;

import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.university.model.University;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
    Optional<Department> findByNameAndUniversity(String name, University university);

    List<Department> findByUniversity(University university);



}
