package com.wizardom.backend.application.sections;

import com.wizardom.backend.domain.section.service.SectionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.ok;

@RequiredArgsConstructor
@RestController
@RequestMapping("sections")
public class SectionController {
    private final SectionService sectionService;

    @GetMapping("")
    public ResponseEntity<?> getSections() {
        return ok(sectionService.getSections());
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getSectionById(@PathVariable("id") long sectionId) {
        return ok(sectionService.getSectionById(sectionId));
    }

    @GetMapping("spaces/{id}")
    public ResponseEntity<?> getSpacesOfSection(@PathVariable("id") long sectionId) {
        return ok(sectionService.getSectionSpaces(sectionId));
    }

    @GetMapping("posts/{id}")
    public ResponseEntity<?> getPostsOfSections(@PathVariable("id") long sectionId) {
        return ok(sectionService.getPostsOfSection(sectionId));
    }

    @GetMapping("questions/{id}")
    public ResponseEntity<?> getQuestionsOfSection(@PathVariable("id") long sectionId) {
        return ok(sectionService.getQuestionsOfSection(sectionId));
    }

}
