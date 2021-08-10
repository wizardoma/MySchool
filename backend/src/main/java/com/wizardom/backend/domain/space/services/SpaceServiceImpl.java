package com.wizardom.backend.domain.space.services;

import com.wizardom.backend.application.spaces.controller.request.CreateSpaceRequest;
import com.wizardom.backend.domain.exception.ResourceNotFoundException;
import com.wizardom.backend.domain.posts.model.Post;
import com.wizardom.backend.domain.posts.model.PostType;
import com.wizardom.backend.domain.space.model.Space;
import com.wizardom.backend.domain.space.repository.SpaceRepository;
import com.wizardom.backend.domain.students.model.Student;
import com.wizardom.backend.domain.students.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SpaceServiceImpl implements SpaceService {
    private final SpaceRepository spaceRepository;
    private final StudentRepository studentRepository;

    @Override
    public List<Space> getSpaces() {
        return spaceRepository.findAll();
    }

    @Override
    public Space getSpaceById(long id) {
        return spaceById(id);
    }

    @Override
    public Space createSpace(CreateSpaceRequest request) {
        Student student = studentRepository.findById(request.getUserID())
                .orElseThrow(() -> new ResourceNotFoundException("No User found with Id: " + request.getUserID()));
        return spaceRepository.save(new Space()
                .setOwner(student)
                .setDescription(request.getDescription()).setName(request.getName()));

    }

    @Override
    public List<Space> getSpacesByUser(String userId) {
        return studentById(userId).getSpaces();
    }

    @Override
    public List<Student> getSpaceContributors(long spaceId) {
        return spaceById(spaceId).getStudents();
    }



    @Override
    public List<Post> getPostsInSpace(long spaceId) {

        return spaceById(spaceId).getPosts()
                .stream()
                .filter(post -> post.getPostType() == PostType.post)
                .collect(Collectors.toList());
    }

    @Override
    public List<Post> getQuestionsInSpace(long spaceId) {
        return spaceById(spaceId).getPosts()
                .stream()
                .filter(post -> post.getPostType() == PostType.question)
                .collect(Collectors.toList());
    }

    @Transactional
    @Override
    public void followSpace(long spaceId, String userId) {
        Space space = spaceById(spaceId);
        Student student = studentById(userId);
        student.getSpaces().add(space);
        studentRepository.save(student);

        space.getStudents().add(student);
        spaceRepository.save(space);

    }

    private Space spaceById(long spaceId) {
        return spaceRepository.findById(spaceId).orElseThrow(() -> new ResourceNotFoundException("No space found"));
    }

    private Student studentById(String studentId){
        return studentRepository.findById(studentId)
                .orElseThrow(() -> new ResourceNotFoundException("No User Found"));
    }


}