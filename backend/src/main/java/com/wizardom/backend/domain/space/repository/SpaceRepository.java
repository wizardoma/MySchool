package com.wizardom.backend.domain.space.repository;

import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SpaceRepository extends JpaRepository<Space, Long> {
    List<Space> findByOwner(Student owner);
    Optional<Space> findByNameIgnoreCase(String name);

}
