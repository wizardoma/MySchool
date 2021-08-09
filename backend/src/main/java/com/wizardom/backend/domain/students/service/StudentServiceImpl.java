package com.wizardom.backend.domain.students.service;

import com.wizardom.backend.application.students.controller.request.CreateStudentRequest;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.space.repository.SpaceRepository;
import com.wizardom.backend.domain.students.exceptions.StudentExistsException;
import com.wizardom.backend.domain.students.exceptions.StudentNotFoundException;
import com.wizardom.backend.domain.students.model.Name;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.repository.StudentRepository;
import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.university.department.repository.DepartmentRepository;
import com.wizardom.backend.domain.university.department.service.DepartmentService;
import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.service.UniversityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;

/**
 * @author Ibekason Alexander Onyebuchi
 */

@Transactional
@RequiredArgsConstructor
@Service
public class StudentServiceImpl extends StudentService {
    private final UniversityService universityService;
    private final StudentRepository studentRepository;
    private final DepartmentService departmentService;

    @Override
    public Student saveStudent(CreateStudentRequest request) {
        abortIfUserExists(request);
        University university = universityService
                .getUniversityById(request.getUniversityId());
        Department department = departmentService
                .getDepartmentById(request.getDepartmentId());
        Space space = department.getSpace();
        Student student = new Student().setUniversity(university)
                .setLevel(request.getLevel())
                .setEmail(request.getEmail())
                .setId(request.getId())
                .setSpaces(Collections.singletonList(space))
                .setMatricNo(request.getMatricNo())
                .setDepartment(department)
                .setName(extractName(request.getName()));

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
        return studentRepository.findById(id).orElseThrow(() -> new StudentNotFoundException("User not found"));
    }

    private Name extractName(String name) {
        String[] arrays = name.split(" ");
        return new Name().setFirstName(arrays[0]).setLastName(arrays[1]);
    }

    private void abortIfUserExists(CreateStudentRequest request) {
        studentRepository.findById(request.getId()).ifPresent((s) -> {
            throw new StudentExistsException("Student already exists");
        });
        studentRepository.findByMatricNo(request.getMatricNo()).ifPresent((s) -> {
            throw new StudentExistsException("Student already exists");
        });

    }
}
