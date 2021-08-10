package com.wizardom.backend.domain.config;

import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.space.repository.SpaceRepository;
import com.wizardom.backend.domain.university.department.model.Department;
import com.wizardom.backend.domain.university.department.repository.DepartmentRepository;
import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.repository.UniversityRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static com.wizardom.backend.domain.space.config.SpaceInitializer.defaultSpaces;
import static com.wizardom.backend.domain.university.department.config.DepartmentConfig.*;

/**
 * @author Ibekason Alexander Onyebuchi
 * <p>
 * Class that bootstraps universities and students
 */

@Slf4j
@Transactional
@RequiredArgsConstructor
@Configuration
public class DatabaseConfig implements CommandLineRunner {

    private final Map<String, String> universities = new HashMap<>();
    private final UniversityRepository universityRepository;
    private final DepartmentRepository departmentRepository;
    private final SpaceRepository spaceRepository;

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
                log.info("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });

        imsuDepartments.stream().map(department -> new Department().setName(department).setUniversity(imsu)).forEach(department -> {
            if (departmentRepository.findByNameAndUniversity(department.getName(), imsu).isEmpty()) {
                log.info("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });

        palmUniversities.stream().map(department -> new Department().setName(department).setUniversity(palm)).forEach(department -> {
            if (departmentRepository.findByNameAndUniversity(department.getName(), palm).isEmpty()) {
                log.info("Adding department " + department.toString());
                departmentRepository.save(department);
            }
        });

        log.info("Done with departments");


        defaultSpaces.forEach((key, value) -> {
            if (spaceRepository.findByNameIgnoreCase(key).isEmpty()) {
                List<Department> departments = new ArrayList<>();
                for (Integer integer : value) {
                    Optional<Department> department = departmentRepository.findById(Long.valueOf(integer));
                    department.ifPresent(departments::add);
                }
                log.info("Added all departments");

                log.info("Space not empty");
                Space space = spaceRepository
                        .save(new Space()
                                .setName(key)
                                .setDescription("This is the Official Space of " + key + " . Share posts and ask questions about " + key)
                                .setDepartments(departments));
                for (Department department : departments) {
                    log.info("saving space to departments");
                    departmentRepository.save(department.setSpace(space));
                }
                log.info("save space " + space.toString());
            }
        });

    }


}
