package com.ktds.jspservlet.controller;

import com.ktds.jspservlet.dto.UserDTO;
import com.ktds.jspservlet.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/join")
    public String join() { return "join"; }

    @PostMapping("/join")
    public String join(@ModelAttribute UserDTO userDTO){
        int joinResult = userService.join(userDTO);
        if (joinResult > 0) {
            return "redirect:/"; // 게시글 저장 성공 시 목록 페이지로 리다이렉트
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
        //아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
        return result;
    }

}
