package com.wizardom.backend.application.posts.mapper;

import com.wizardom.backend.application.posts.dto.PostDto;
import com.wizardom.backend.domain.posts.model.Post;

import java.time.ZoneOffset;

public class PostMapper {

    public static PostDto toDto(Post post) {
        return new PostDto()
                .setBody(post.getBody())
                .setDateTime(post.getPostDate().toEpochSecond(ZoneOffset.UTC))
                .setSpace(post.getSpace())
                .setTitle(post.getTitle())
                .setId(post.getId())
                .setStudent(post.getStudent());

    }
}
