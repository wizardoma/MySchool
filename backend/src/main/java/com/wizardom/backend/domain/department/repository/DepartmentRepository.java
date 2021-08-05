package com.wizardom.backend.domain.department.repository;

import com.wizardom.backend.domain.department.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
}
