package com.wizardom.backend.domain.space.services;


import com.wizardom.backend.application.spaces.controller.request.CreateSpaceRequest;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.students.model.Student;

import java.util.List;

public interface SpaceService {
    List<Space> getSpaces();
    Space getSpaceById(long id);
    Space createSpace(CreateSpaceRequest request);

    List<Space> getSpacesByUser(String userId);

    List<Student> getSpaceContributors(long spaceId);

    List<Post> getPostsInSpace(long spaceId);

    List<Post> getQuestionsInSpace(long spaceId);

}
