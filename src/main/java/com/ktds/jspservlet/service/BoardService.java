package com.ktds.jspservlet.service;

import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.DateDTO;
import com.ktds.jspservlet.dto.ImageDTO;
import com.ktds.jspservlet.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

@Slf4j
@Service // 이 클래스를 Spring Bean으로 등록
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
public class BoardService {
    private final BoardRepository boardRepository; // BoardRepository 의존성 주입

    // 이미지 저장 경로
    private static String UPLOAD_DIR = "src/main/resources/static/";

    public int save(BoardDTO boardDTO, String imagePath) {
        return boardRepository.save(boardDTO, imagePath); // 게시글 저장 요청을 BoardRepository에 위임
    }

    public String storeFile(MultipartFile file) throws IOException {
        // 파일명 중복 방지를 위해 현재 시간을 파일명에 추가
        String originalFileName = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFileName;

        try {
            // 저장할 파일 경로
            Path path = Paths.get(UPLOAD_DIR + fileName);
            // 파일 저장
            Files.copy(file.getInputStream(), path);
            return fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
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

    public int findAllCount(String userId){
        return boardRepository.findAllCount(userId);
    }

    public int findAllCount(){
        return boardRepository.findAllCount();
    }

    public List<BoardDTO> getPagingBoard(int page, String userId){
        return boardRepository.getPagingBoard(page, userId);
    }

    public List<BoardDTO> getPagingBoard(int page){
        return boardRepository.getPagingBoard(page);
    }

    public List<DateDTO> getCalendarData(int year, int month) {
        return boardRepository.findDatesByMonth(year, month);
    }

    public String getImagePath(String image) throws IOException {
        Path imagePath = Paths.get("C:\\Users\\KTDS\\Desktop\\jspservlet\\jspservlet\\src\\main\\resources\\static", image);
        byte[] imageBytes = Files.readAllBytes(imagePath);
        String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
        return encodedImage;
    }

}