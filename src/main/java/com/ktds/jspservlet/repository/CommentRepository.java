package com.ktds.jspservlet.repository;

import com.ktds.jspservlet.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommentRepository {
    private final SqlSessionTemplate sql;

    public int save(CommentDTO commentDTO) {
        return sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

    public CommentDTO findByCommentId(Long commentId) {
        return sql.selectOne("Comment.findByCommentId", commentId);
    }

    public void delete(Long commentId) {
        sql.delete("Comment.delete", commentId);
    }

    public List<CommentDTO> findByBoardId(Long boardId) {
        return sql.selectList("Comment.findByBoardId", boardId);
    }
}
