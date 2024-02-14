package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.DateDTO;
import com.ktds.jspservlet.dto.UserDTO;
import com.ktds.jspservlet.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@Controller // 이 클래스는 Spring의 컨트롤러로 지정
@RequiredArgsConstructor // 생성자 주입을 자동으로 생성
@RequestMapping("/diary")
public class DateController {
    private final BoardService boardService; // BoardService 의존성 주입

    @GetMapping("/date")
    public List<DateDTO> getCalendarData(@RequestParam int year, @RequestParam int month,
                                         HttpSession httpSession) {
        UserDTO loggedInUser = (UserDTO) httpSession.getAttribute("loggedInUser");
        String userId = loggedInUser.getUserId();

        // 여기 부터
        List<DateDTO> calendarData = boardService.getCalendarData(year, month, userId);
        System.out.println(calendarData);
        return calendarData;
    }
}
