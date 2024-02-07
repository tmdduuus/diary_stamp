package com.ktds.jspservlet.service;

import com.ktds.jspservlet.dto.CommentDTO;
import com.ktds.jspservlet.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;

    public int save(CommentDTO commentDTO) {
        return commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId){
        return commentRepository.findAll(boardId);
    }

    public CommentDTO findByCommentId(Long commentId){
        return commentRepository.findByCommentId(commentId);
    }

    public void delete(Long commentId) {
        commentRepository.delete(commentId);
    }

    public List<CommentDTO> findByBoardId(Long boardId) {
        return commentRepository.findByBoardId(boardId);
    }
}
