package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.*;
import com.ktds.jspservlet.service.BoardService;
import com.ktds.jspservlet.service.CommentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
//@RestController
@Controller // 이 클래스는 Spring의 컨트롤러로 지정
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
@RequestMapping("/diary") // 이 컨트롤러에서 처리할 요청 URL의 기본 경로 설정
public class BoardController {
    private final BoardService boardService; // BoardService 의존성 주입
    private final CommentService commentService;

    @GetMapping("/save") // HTTP GET 요청에 대한 처리를 위한 매핑
    public String saveForm() {
        return "save"; // "save" 뷰 이름을 반환하여 해당 JSP 파일을 표시
    }

    @PostMapping("/save") // HTTP POST 요청에 대한 처리를 위한 매핑
    public String save(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws IOException {
        String imagePath = "";
        if(boardDTO.getImage().isEmpty()){
            imagePath = "basic.png";
        }else {
            MultipartFile file = boardDTO.getImage();
            imagePath = boardService.storeFile(file);
        }

        boardDTO.setImagePath(imagePath);

        UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");
        boardDTO.setBoardWriter(loggedInUser.getUserId());
        boardDTO.setBoardPass(loggedInUser.getUserPassword());

        int saveResult = boardService.save(boardDTO, imagePath); // 게시글 저장 요청 처리
        if (saveResult > 0) {
            return "pagingAll"; // 게시글 저장 성공 시 목록 페이지로 리다이렉트
        } else {
            return "save"; // 게시글 저장 실패 시 다시 "save" 페이지로 이동
        }
    }

    @GetMapping("/all")
    public String findAll(@RequestParam(value = "page", defaultValue = "1") int page, Model model) throws IOException {
//        List<BoardDTO> boardDTOList = boardService.findAll();
//        model.addAttribute("boardList", boardDTOList);
//        return "list";

        PageDTO pageDTO = new PageDTO();

        int countPageNum = boardService.findAllCount() / 10 + 1;//페이지 개수

        int startPage = (page - 1) * 10;

        if(countPageNum > 0){
            pageDTO.setStartPage(1);//시작 페이지
            pageDTO.setEndPage(countPageNum);
        }else{
            pageDTO.setStartPage(1);
            pageDTO.setEndPage(1);
        }

        pageDTO.setPage(page);
        pageDTO.setMaxPage(countPageNum);

        List<BoardDTO> boardDTOList = boardService.getPagingBoard(startPage);
        for(BoardDTO boardDTO : boardDTOList){
            String getImagePath = boardService.getImagePath(boardDTO.getImageName());
            boardDTO.setImagePath(getImagePath);
        }

        System.out.println(boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("boardList", boardDTOList);

        return "pagingAll";
    }

    //TODO : 1. 작성자 - 방문자 구별해서 수정,삭제 버튼 뜨도록?
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page,
                           HttpSession httpSession) throws IOException {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        String getImagePath = boardService.getImagePath(boardDTO.getImageName());
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        model.addAttribute("getImagePath", getImagePath);

        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        model.addAttribute("loggedInUserId", loggedInUser.getId());

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "detail";
    }

    // TODO : 3. endPageNum 확인 글목록 리스트 이미지 뜨도록 수정(주석)
    @GetMapping("/mylist")
    public String paging(@RequestParam(value = "page", defaultValue = "1") int page, Model model,  HttpSession session) throws IOException {
        PageDTO pageDTO = new PageDTO();
        UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");

        if(loggedInUser == null){
            return "redirect:/login"; // Todo : alert창 ( 로그인하시오 )
        }

        String userId = loggedInUser.getUserId();

        int countPageNum = boardService.findAllCount(userId) / 10 + 1;//페이지 개수

        int startPage = (page - 1) * 10;

        if(countPageNum > 0){
            pageDTO.setStartPage(1);//시작 페이지
            pageDTO.setEndPage(countPageNum);
        }else{
            pageDTO.setStartPage(1);
            pageDTO.setEndPage(1);
        }

        pageDTO.setPage(page);
        pageDTO.setMaxPage(countPageNum);

        List<BoardDTO> boardDTOList = boardService.getPagingBoard(startPage, userId);
        for (BoardDTO boardDTO:boardDTOList) {
            String getImagePath = boardService.getImagePath(boardDTO.getImageName());
            boardDTO.setImagePath(getImagePath);
        }

//        System.out.println(boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("boardList", boardDTOList);

        return "/paging";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession httpSession,
                         HttpServletRequest request){
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        String userId = loggedInUser.getUserId();

        String boardWriter = boardService.findById(id).getBoardWriter();

        if(!userId.equals(boardWriter)){
            request.setAttribute("msg", "권한이 없습니다.");
            request.setAttribute("url", "/diary?id="+id);
            return "alert";
        }else{
            boardService.delete(id);
            return "redirect:/diary/mylist";
        }
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        MultipartFile file = boardDTO.getImage();
        String imagePath = boardService.storeFile(file);
        boardDTO.setImagePath(imagePath);

        boardService.update(boardDTO, imagePath);
        BoardDTO dto = boardService.findById(boardDTO.getId());

        String getImagePath = boardService.getImagePath(dto.getImageName());
        model.addAttribute("board", dto);
        model.addAttribute("getImagePath", getImagePath);
        return "detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model,
                             HttpSession httpSession, HttpServletRequest request){
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        String userId = loggedInUser.getUserId();

        String boardWriter = boardService.findById(id).getBoardWriter();

        if(!userId.equals(boardWriter)){
            request.setAttribute("msg", "권한이 없습니다.");
            request.setAttribute("url", "/diary?id="+id);
            return "alert";
        }else{
            BoardDTO boardDTO = boardService.findById(id);
            model.addAttribute("board", boardDTO);
            return "update";
        }
    }


    @GetMapping("/calendar")
    public String calendar() {
        return "calendar"; // JSP 파일의 이름 (calendar.jsp)
    }

}