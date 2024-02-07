package com.ktds.jspservlet.repository;

import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.DateDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository // 이 클래스를 Spring Bean으로 등록
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
public class BoardRepository {
    private final SqlSessionTemplate sql; // SqlSessionTemplate 의존성 주입

    public int save(BoardDTO boardDTO, String imagePath) {
        Map<String, Object> params = new HashMap<>();
        params.put("boardDTO", boardDTO);
        params.put("imagePath", imagePath);
        return sql.insert("Board.save", params); // 게시글 저장 쿼리 실행
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public void updateHits(Long id) {
        sql.insert("Board.updateHits", id);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public int findAllCount(String userId){
        return sql.selectOne("Board.findAllCount", userId);
    }

    public List<BoardDTO> getPagingBoard(int startPage, String userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("startPage", startPage);
        params.put("userId", userId);
        return sql.selectList("Board.getPagingBoard", params);
    }

    public List<DateDTO> findDatesByMonth(int year, int month) {
        Map<String, Integer> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        return sql.selectList("Board.getDatesByMonth", params);
    }

    public int saveImage(MultipartFile imageFile) {
        return sql.insert("Board.saveImage", imageFile);
    }
}