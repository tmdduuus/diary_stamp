package com.ktds.jspservlet.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 이 클래스는 Spring의 컨트롤러로 지정
public class HomeController {

    @GetMapping("/") // HTTP GET 요청에 대한 처리를 위한 매핑, 루트 경로 ("/")에 대한 처리
    public String index() {
        return "index"; // "index" 뷰 이름을 반환하여 해당 JSP 파일을 표시
    }
}