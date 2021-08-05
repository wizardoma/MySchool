package com.wizardom.backend.domain.section.repository;


import com.wizardom.backend.domain.section.model.Section;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SectionRepository extends JpaRepository<Section, Long> {
}
