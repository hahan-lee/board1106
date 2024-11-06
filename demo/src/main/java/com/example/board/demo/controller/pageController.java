package com.example.board.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pageController {
 
	@GetMapping("/")
	public String Hello(Model model) {
		model.addAttribute("message", "hello test");
		return "index";
	}
}
