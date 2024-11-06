package com.example.board.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/") //페이지 이동 폴더 디폴트값
public class pageController {
 
	//데이터 전송 test 코드
	@GetMapping("/")
	public String Hello(Model model) {
		return "index";
	}

	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("message", "hello test!!");
		return "index";
	}
	
	@GetMapping("/user/signup")
	public String signup() {
		return "/user/signup";
	}
	
	@GetMapping("/user/signin")
	public String signin() {
		return "/user/signin";
	}
	

}
