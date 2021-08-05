package com.wizardom.backend.application.spaces.controller;

import com.wizardom.backend.application.spaces.controller.request.CreateSpaceRequest;
import com.wizardom.backend.domain.space.services.SpaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.wizardom.backend.commons.response.ResponseEntityUtils.ok;

@RequiredArgsConstructor
@RequestMapping("/spaces")
public class SpaceController {
    private final SpaceService spaceService;

    @PostMapping
    public ResponseEntity<?> saveSpaces(@ModelAttribute CreateSpaceRequest request) {
        return ok(spaceService.createSpace(request));
    }

    @GetMapping("")
    public ResponseEntity<?> getSpaces() {
        return ok(spaceService.getSpaces());
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getSpaceById(@PathVariable long id) {
        return ok(spaceService.getSpaceById(id));
    }

    @GetMapping("users/{id}")
    public ResponseEntity<?> getSpaceByUser(@PathVariable("id") String userId) {
        return ok(spaceService.getSpacesByUser(userId));
    }

    @GetMapping("contributors/{id}")
    public ResponseEntity<?> getSpaceContributors(@PathVariable("id") long spaceId) {
        return ok(spaceService.getSpaceContributors(spaceId));
    }

    @GetMapping("posts/{id}")
    public ResponseEntity<?> getPostsInSpace(@PathVariable("id") long spaceId){
        return ok(spaceService.getPostsInSpace(spaceId));
    }

    @GetMapping("posts/{id}")
    public ResponseEntity<?> getQuestionsInSpace(@PathVariable("id") long spaceId){
        return ok(spaceService.getQuestionsInSpace(spaceId));
    }
}
