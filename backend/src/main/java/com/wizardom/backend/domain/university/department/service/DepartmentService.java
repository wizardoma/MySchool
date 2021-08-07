package com.wizardom.backend.domain.university.department.service;

import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.students.model.Student;

import java.util.List;

public interface DepartmentService {

    Department getDepartmentById(long id);
    List<Department> getDepartments();
    List<Student> getStudentsOfDepartment(long departmentId);
}
