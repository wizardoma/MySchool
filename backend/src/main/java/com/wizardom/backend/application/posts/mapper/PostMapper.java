package com.wizardom.backend.application.posts.mapper;

import com.wizardom.backend.application.posts.dto.PostDto;
import com.wizardom.backend.application.students.mapper.StudentMapper;
import com.wizardom.backend.domain.posts.model.Post;

import java.time.ZoneOffset;

public class PostMapper {
    public static PostDto toDto(Post post) {
        return new PostDto()
                .setPostType(post.getPostType().name())
                .setBody(post.getBody())
                .setDate(post.getPostDate().toEpochSecond(ZoneOffset.UTC))
                .setSpace(post.getSpace())
                .setTitle(post.getTitle())
                .setComments(post.getComments())
                .setId(post.getId())
                .setStudent(StudentMapper.toDto(post.getStudent()));

    }
}
