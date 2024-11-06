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

    //작성이동 클릭 시 작성페이지 이동
    @GetMapping("/create")
    public String createForm() {
        return "board/create";
    }

    //작성 버튼 클릭 시 테이블 삽입, redirect 사용하여 list로 이동 => 기존페이지에서 다른페이지로 이동할 수 있도록 서버 응답
    @PostMapping("/create")
    public String create(Board board) {
        boardService.insert(board);
        return "redirect:/board/list";
    }

    
    //수정 할 게시글 내용 가져오기
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model) {
        model.addAttribute("board", boardService.findById(id));
        return "board/edit";
    }

    //수정 버튼 클릭 시 table 업데이트
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
