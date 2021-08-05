package com.wizardom.backend.domain.university.config;

import com.wizardom.backend.domain.university.model.University;
import com.wizardom.backend.domain.university.repository.UniversityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class DatabaseConfig implements CommandLineRunner {

    private final Map<String, String> universities = new HashMap<>();

    @Autowired
    private UniversityRepository universityRepository;

    @Override
    public void run(String... args) throws Exception {
        universities.put("futo", "Federal University of Technology Owerri");
        universities.put("imsu", "Imo State University");
        universities.put("palm", "Eastern Palm University");
        for (var entry : universities.entrySet()) {
            if (universityRepository.findByShortNameIgnoreCase(entry.getKey()).isEmpty()) {
                universityRepository.save(new University().setFullName(entry.getValue()).setShortName(entry.getKey().toLowerCase()));
            }
        }
    }

}
