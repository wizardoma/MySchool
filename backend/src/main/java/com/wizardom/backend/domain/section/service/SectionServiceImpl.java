package com.wizardom.backend.domain.section.service;

import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.posts.model.PostType;
import com.wizardom.backend.domain.section.model.Section;
import com.wizardom.backend.domain.section.repository.SectionRepository;
import com.wizardom.backend.domain.space.model.Space;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SectionServiceImpl implements SectionService {
    private final SectionRepository sectionRepository;

    @Override
    public List<Space> getSectionSpaces(long sectionId) {
        return getById(sectionId).getSpaces();
    }

    @Override
    public Section getSectionById(long sectionId) {
        return getById(sectionId);
    }

    @Override
    public List<Section> getSections() {
        return sectionRepository.findAll();
    }

    @Override
    public List<Post> getPostsOfSection(long sectionId) {
        return getById(sectionId).getSpaces()
                .stream()
                .flatMap(space -> space.getPosts().stream().filter(post -> post.getPostType() == PostType.post))
                .collect(Collectors.toList());
    }

    @Override
    public List<Post> getQuestionsOfSection(long sectionId) {
        return getById(sectionId).getSpaces()
                .stream()
                .flatMap(space -> space.getPosts().stream().filter(post -> post.getPostType() == PostType.question))
                .collect(Collectors.toList());
    }


    private Section getById(long sectionId) {
        return sectionRepository.findById(sectionId).orElseThrow(() -> new ResourceNotFoundException("No Section found"));
    }
}
