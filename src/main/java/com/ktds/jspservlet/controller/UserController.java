package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.UserDTO;
import com.ktds.jspservlet.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    // TODO : signup, signin 탭 구분 jsp 수정

    @GetMapping("/join")
    public String join() { return "join"; }

    @PostMapping("/join")
    public String join(@ModelAttribute UserDTO userDTO,RedirectAttributes redirectAttributes){
        int joinResult = userService.join(userDTO);
        if (joinResult > 0) {
            redirectAttributes.addFlashAttribute("signupSuccess", true);
            return "redirect:/login"; // 게시글 저장 성공 시 목록 페이지로 리다이렉트
        } else {
            return "join"; // 게시글 저장 실패 시 다시 "save" 페이지로 이동
        }
    }

    @RequestMapping("/checkId")
    @ResponseBody //ajax 값을 바로jsp 로 보내기위해 사용
    public String checkId(@RequestParam("userId") String id) {
        String result="N";

        int flag = userService.checkId(id);
        if(flag == 1) result ="Y";
        //아이디가 있을시 Y 없을시 N jsp view 로 보냄
        return result;
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("userId") String userId,
                        @RequestParam("userPassword") String userPassword,
                        RedirectAttributes redirectAttributes, HttpSession session) {
        UserDTO user = userService.validateUser(userId, userPassword);

        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "loginSuccess"; // 로그인 성공 시 이동할 페이지
        } else {
            redirectAttributes.addFlashAttribute("loginError", true);
            return "redirect:/login";
        }
    }

    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model){
        UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            // 사용자 맞춤형 기능 실행
            model.addAttribute("user", loggedInUser);
            // 추가적인 사용자 맞춤형 정보 및 기능
            return "mypage";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 현재 세션을 무효화
        return "redirect:/login";
    }

}
