package com.ktds.jspservlet.service;

import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.DateDTO;
import com.ktds.jspservlet.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service // 이 클래스를 Spring Bean으로 등록
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
public class BoardService {
    private final BoardRepository boardRepository; // BoardRepository 의존성 주입

    public int save(BoardDTO boardDTO) {
        return boardRepository.save(boardDTO); // 게시글 저장 요청을 BoardRepository에 위임
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public int findAllCount(){
        return boardRepository.findAllCount();
    }

    public List<BoardDTO> getPagingBoard(int page){
        return boardRepository.getPagingBoard(page);
    }

    public List<DateDTO> getCalendarData(int year, int month) {
        return boardRepository.findDatesByMonth(year, month);
    }

}