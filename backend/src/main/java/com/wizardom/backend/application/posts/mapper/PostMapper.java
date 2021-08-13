package com.wizardom.backend.application.posts.mapper;

import com.wizardom.backend.application.posts.dto.CommentDto;
import com.wizardom.backend.application.posts.dto.PostDto;
import com.wizardom.backend.application.students.mapper.StudentMapper;
import com.wizardom.backend.domain.posts.model.Post;

import java.time.ZoneId;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class PostMapper {
    public static PostDto toDto(Post post) {
        List<CommentDto> commentDtos ;
        if (post.getComments() == null || post.getComments().size() == 0) {
            commentDtos = Collections.emptyList();
        }
        else {
           commentDtos =  post.getComments().stream().map(CommentMapper::toDto).collect(Collectors.toList());
        }
        return new PostDto()
                .setPostType(post.getPostType().name())
                .setBody(post.getBody())
                .setDate(post.getPostDate().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli())
                .setSpace(post.getSpace())
                .setImageUrl(post.getImageUrl())
                .setTitle(post.getTitle())
                .setComments(commentDtos)
                .setId(post.getId())
                .setStudent(StudentMapper.toDto(post.getStudent()));
    }
}
