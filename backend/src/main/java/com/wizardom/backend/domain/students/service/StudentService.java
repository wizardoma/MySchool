package com.wizardom.backend.domain.students.service;

import com.wizardom.backend.application.students.controller.request.CreateStudentRequest;
import com.wizardom.backend.domain.BaseService;
import com.wizardom.backend.domain.students.model.Student;


public abstract class StudentService extends BaseService {
    public abstract Student saveStudent(CreateStudentRequest request);
    public abstract Student editStudent(Student student);
    public abstract void deleteStudent(String id);
    public abstract Student getStudentById(String id);

}
