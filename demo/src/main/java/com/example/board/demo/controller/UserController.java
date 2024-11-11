package com.example.board.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.board.demo.model.Board;
import com.example.board.demo.model.User;
import com.example.board.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	private final UserService userService;
	
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	//회원리스트 출력
    @GetMapping("user/userlist")
    public String userlist(Model model) {
        model.addAttribute("Users", userService.findAll());
        return "user/userlist";
    }

    //회원가입
    @PostMapping("user/signup")
    public String signup(User user,Model model) {
    	
    	//아이디 중복 체크
    	if(userService.findById(user.getUserId())!= null) {
    		//아이디 존재 시
    		model.addAttribute("errMessage","이미 존재하는 아이디 입니다.");
    		return "user/signup";//회원가입페이지 그대로
    	}
    	
    	userService.insert(user);
    	return "redirect:/user/signin"; 
    }
    

    // 로그인 요청 처리
    @PostMapping("user/signin")
    public String login(@RequestParam String userId, @RequestParam String userPw, HttpSession session, Model model) {
        //아이디 또는 비밀번호 입력하지 않은 경우
        if (userId == null || userId.trim().isEmpty() || userPw == null || userPw.trim().isEmpty()) {
            model.addAttribute("errorMessage", "아이디와 비밀번호를 모두 입력해주세요.");
            return "user/signin"; // 로그인 페이지 유지
        }
    	
        //로그인 데이터 받음
    	User user = userService.findById(userId);             
        if (user != null && user.getUserPw().equals(userPw)) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/board/list"; // 로그인 성공 시 유저리스트 페이지 이동
        }
        else {
        	//비밀번호,아이디 불일치
        	model.addAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다. 다시 입력해주세요.");
            return "user/signin";
        }
    }
    
    // 로그아웃 요청 처리
    @GetMapping("user/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화 - 로그아웃
        return "redirect:/user/signin"; // 로그인 페이지 이동
    }
	
}
