package com.wizardom.backend.domain.section.service;

import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.section.model.Section;
import com.wizardom.backend.domain.space.model.Space;

import java.util.List;

public interface SectionService {

    List<Space> getSectionSpaces(long sectionId);
    Section getSectionById(long sectionId);
    List<Section> getSections();
    List<Post> getPostsOfSection(long sectionId);
    List<Post> getQuestionsOfSection(long sectionId);

}
