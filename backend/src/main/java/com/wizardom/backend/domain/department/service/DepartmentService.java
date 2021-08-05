package com.wizardom.backend.domain.department.service;

import com.wizardom.backend.domain.department.model.Department;
import com.wizardom.backend.domain.students.model.Student;

import java.util.List;

public interface DepartmentService {

    List<Department> getDepartments();
    List<Student> getStudentsOfDepartment(long departmentId);
}
