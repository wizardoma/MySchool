package com.wizardom.backend.domain.department.service;

import com.wizardom.backend.domain.department.model.Department;
import com.wizardom.backend.domain.department.repository.DepartmentRepository;
import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.students.model.Student;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    private final DepartmentRepository departmentRepository;

    @Override
    public List<Department> getDepartments() {
        return departmentRepository.findAll();
    }

    @Override
    public List<Student> getStudentsOfDepartment(long departmentId) {
        return departmentRepository.findById(departmentId).orElseThrow(() -> new ResourceNotFoundException("No department found")).getStudents();
    }
}
