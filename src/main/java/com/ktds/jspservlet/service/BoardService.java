package com.ktds.jspservlet.service;

import com.google.cloud.storage.*;
import com.ktds.jspservlet.dto.BoardDTO;
import com.ktds.jspservlet.dto.DateDTO;
import com.ktds.jspservlet.dto.ImageDTO;
import com.ktds.jspservlet.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
//import lombok.Value;

import org.springframework.beans.factory.annotation.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
        Storage storage = StorageOptions.getDefaultInstance().getService();

        // 파일명 중복 방지를 위해 현재 시간을 파일명에 추가
        String originalFileName = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFileName;

        // 업로드할 버킷 이름과 파일 이름 설정
        String bucketName = "diary-bucket"; // 여기에 당신의 버킷 이름을 입력하세요
        BlobId blobId = BlobId.of(bucketName, fileName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();

        try {
            Blob blob = storage.create(blobInfo, file.getBytes());
            return blob.getName(); // 업로드된 파일의 이름 반환
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

    public void update(BoardDTO boardDTO, String imagePath) {
        boardRepository.update(boardDTO, imagePath);
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

    public List<DateDTO> getCalendarData(int year, int month, String userId) {
        return boardRepository.findDatesByMonth(year, month, userId);
    }

    public String getImagePath(String image) throws IOException {
        // 구글 클라우드 프로젝트 ID와 버킷 이름을 설정합니다.
        String bucketName = "diary-bucket";

        Storage storage = StorageOptions.getDefaultInstance().getService();

        // 이미지 파일의 BlobId를 생성합니다. BlobId는 버킷 이름과 객체의 이름(파일 이름)으로 구성됩니다.
        BlobId blobId = BlobId.of(bucketName, image);

        // Blob 객체를 가져옵니다.
        Blob blob = storage.get(blobId);

        if (blob == null) {
            // blob이 null인 경우, 적절한 처리를 수행 (예: 오류 메시지 반환)
            throw new RuntimeException("The specified blob does not exist: " + image);
        }

        // Blob으로부터 바이트 배열을 읽어옵니다.
        byte[] imageBytes = blob.getContent();
        String encodedImage = Base64.getEncoder().encodeToString(imageBytes);

        return encodedImage;
    }

}