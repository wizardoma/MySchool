package com.wizardom.backend.domain.students.service;

import com.wizardom.backend.application.students.controller.request.CreateStudentRequest;
import com.wizardom.backend.domain.students.exceptions.StudentExistsException;
import com.wizardom.backend.domain.students.model.Name;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.repository.StudentRepository;
import com.wizardom.backend.domain.university.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class StudentServiceImpl extends StudentService {
    private final UniversityService universityService;
    private final StudentRepository studentRepository;


    @Override
    public Student saveStudent(CreateStudentRequest request) {
        studentRepository.findById(request.getId()).ifPresent((s) -> {
            throw new StudentExistsException("Student already exists");
        });

        Student student = new Student().setUniversity(universityService.getByShortName(request.getUniversity()))
                .setLevel(request.getLevel())
                .setEmail(request.getEmail())
                .setId(request.getId())
                .setDepartment(request.getDepartment())
                .setName(extractName(request.getName())).setDepartment(request.getDepartment());

        return studentRepository.save(student);
    }

    @Override
    public Student editStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public void deleteStudent(String id) {
        studentRepository.deleteById(id);
    }

    @Override
    public Student getStudentById(String id) {
        return studentRepository.findById(id).get();
    }

    private Name extractName(String name) {
        String[] arrays = name.split(" ");
        return new Name().setFirstName(arrays[0]).setLastName(arrays[1]);
    }

}
