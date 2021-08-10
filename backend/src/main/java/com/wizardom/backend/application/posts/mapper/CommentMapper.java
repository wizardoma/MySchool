package com.wizardom.backend.application.posts.mapper;

import com.wizardom.backend.application.posts.dto.CommentDto;
import com.wizardom.backend.application.students.mapper.StudentMapper;
import com.wizardom.backend.domain.posts.comments.Comment;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.time.ZoneId;

@Data
@Slf4j

public class CommentMapper {
    public static CommentDto toDto(Comment comment) {
        return new CommentDto()
                .setBody(comment.getBody())
                .setDate(comment.getDate().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli())
                .setId(comment.getId())
                .setStudent(StudentMapper.toDto(comment.getStudent()));
    }
}
