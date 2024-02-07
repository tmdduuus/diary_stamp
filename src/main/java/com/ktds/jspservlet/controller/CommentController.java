package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.CommentDTO;
import com.ktds.jspservlet.dto.UserDTO;
import com.ktds.jspservlet.service.CommentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/save")
    public ResponseEntity<?> save(@ModelAttribute CommentDTO commentDTO, HttpSession httpSession){
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        commentDTO.setCommentWriter(loggedInUser.getUserId());

        commentService.save(commentDTO);

        List<CommentDTO> commentDTOList = commentService.findByBoardId(commentDTO.getBoardId());

        return new ResponseEntity<>(commentDTOList, HttpStatus.ACCEPTED);
    }

    @GetMapping("/delete")
    public Object delete(@RequestParam("id") Long id, HttpSession httpSession,
                         HttpServletRequest request){
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        String userId = loggedInUser.getUserId();

        String commentWriter = commentService.findByCommentId(id).getCommentWriter();
        Long boardId = commentService.findByCommentId(id).getBoardId();

        if(!userId.equals(commentWriter)){
            request.setAttribute("msg", "해당 댓글 삭제 권한이 없습니다.");
            request.setAttribute("url", "/diary?id="+boardId);
//            return "alert";
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("msg", "해당 댓글 삭제 권한이 없습니다."));
        }else{
            commentService.delete(id);
            return new ResponseEntity<>(commentService.findByBoardId(boardId), HttpStatus.ACCEPTED);
        }
    }

}
