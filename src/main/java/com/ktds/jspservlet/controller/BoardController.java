package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.*;
import com.ktds.jspservlet.service.BoardService;
import com.ktds.jspservlet.service.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
@Controller // 이 클래스는 Spring의 컨트롤러로 지정
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
@RequestMapping("/diary") // 이 컨트롤러에서 처리할 요청 URL의 기본 경로 설정
public class BoardController {
    private final BoardService boardService; // BoardService 의존성 주입
    private final CommentService commentService;

    // Todo : User 로그인 & 회원가입 기능 구현
    @GetMapping("/save") // HTTP GET 요청에 대한 처리를 위한 매핑
    public String saveForm() {
        return "save"; // "save" 뷰 이름을 반환하여 해당 JSP 파일을 표시
    }

    @PostMapping("/save") // HTTP POST 요청에 대한 처리를 위한 매핑
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        MultipartFile file = boardDTO.getImage();
        String imagePath = boardService.storeFile(file);
        boardDTO.setImagePath(imagePath);

        int saveResult = boardService.save(boardDTO, imagePath); // 게시글 저장 요청 처리
        if (saveResult > 0) {
            return "redirect:/diary/paging"; // 게시글 저장 성공 시 목록 페이지로 리다이렉트
        } else {
            return "save"; // 게시글 저장 실패 시 다시 "save" 페이지로 이동
        }
    }

    // Todo : 이미지 조회 기능 업데이트 & photo 데이터 안불러와짐
    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "list";
    }

    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value="page", required = false, defaultValue = "1") int page) throws IOException {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        String getImagePath = boardService.getImagePath(boardDTO.getImageName());
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        model.addAttribute("getImagePath", getImagePath);

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        boardService.delete(id);
        return "redirect:/diary/paging";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model){
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
        return "detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "update";
    }

    // TODO : endPageNum 확인
    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", defaultValue = "1") int page, Model model){
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

        model.addAttribute("paging", pageDTO);
        model.addAttribute("boardList", boardDTOList);

        return "paging";
    }

    @GetMapping("/date")
    public String getCalendarData(Model model, @RequestParam int year, @RequestParam int month) {
        List<DateDTO> calendarData = boardService.getCalendarData(year, month);
        System.out.println(calendarData);
        model.addAttribute("calendarData", calendarData);
        return "calendar";
    }

}