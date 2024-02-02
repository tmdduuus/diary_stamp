package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.CommentDTO;
import com.ktds.jspservlet.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/save")
    public ResponseEntity<?> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        return new ResponseEntity<>(commentService.findAll(commentDTO.getBoardId()), HttpStatus.ACCEPTED);
    }

}
