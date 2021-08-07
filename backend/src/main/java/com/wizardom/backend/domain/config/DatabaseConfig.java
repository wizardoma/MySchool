package com.wizardom.backend.domain.config;

import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.university.department.repository.DepartmentRepository;
import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

import static com.wizardom.backend.domain.university.department.config.DepartmentConfig.*;

/**
 * @author Ibekason Alexander Onyebuchi
 *
 *  Class that bootstraps universities and students
 */


@Transactional
@RequiredArgsConstructor
@Configuration
public class DatabaseConfig implements CommandLineRunner {

    private final Map<String, String> universities = new HashMap<>();
    private final UniversityRepository universityRepository;
    private final DepartmentRepository departmentRepository;

    @Override
    public void run(String... args) {
        universities.put("futo", "Federal University of Technology Owerri");
        universities.put("imsu", "Imo State University");
        universities.put("palm", "Eastern Palm University");
        for (var entry : universities.entrySet()) {
            if (universityRepository.findByShortNameIgnoreCase(entry.getKey()).isEmpty()) {
                universityRepository.save(new University().setFullName(entry.getValue()).setShortName(entry.getKey().toLowerCase()));
            }
        }

        University futo = universityRepository.findByShortNameIgnoreCase("futo").get();
        University imsu = universityRepository.findByShortNameIgnoreCase("imsu").get();
        University palm = universityRepository.findByShortNameIgnoreCase("palm").get();

        futoDepartments.stream().map(department -> new Department().setName(department).setUniversity(futo)).forEach(department -> {
            if (departmentRepository.findByNameAndUniversity(department.getName(), futo).isEmpty()) {
                System.out.println("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });

        imsuDepartments.stream().map(department -> new Department().setName(department).setUniversity(imsu)).forEach(department -> {
            if (departmentRepository.findByNameAndUniversity(department.getName(), imsu).isEmpty()) {
                System.out.println("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });

        palmUniversities.stream().map(department -> new Department().setName(department).setUniversity(palm)).forEach(department -> {
            if (departmentRepository.findByNameAndUniversity(department.getName(), palm).isEmpty()) {
                System.out.println("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });
    }


}
