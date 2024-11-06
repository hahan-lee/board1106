package com.example.board.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.board.demo.model.Board;
import com.example.board.demo.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    
    
	@GetMapping("/")
	public String Hello(Model model) {
		model.addAttribute("message", "hello test");
		return "index";
	}
    
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("boards", boardService.findAll());
        return "board/list";
    }

    @GetMapping("/view/{id}")
    public String view(@PathVariable int id, Model model) {
        model.addAttribute("board", boardService.findById(id));
        return "board/view";
    }

    @GetMapping("/create")
    public String createForm() {
        return "board/create";
    }

    @PostMapping("/create")
    public String create(Board board) {
        boardService.insert(board);
        return "redirect:/board/list";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model) {
        model.addAttribute("board", boardService.findById(id));
        return "board/edit";
    }

    @PostMapping("/edit")
    public String edit(Board board) {
        boardService.update(board);
        return "redirect:/board/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        boardService.delete(id);
        return "redirect:/board/list";
    }
}
