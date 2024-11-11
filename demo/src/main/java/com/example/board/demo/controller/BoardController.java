package com.example.board.demo.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.board.demo.model.Board;
import com.example.board.demo.model.PagingResponse;
import com.example.board.demo.model.SearchDto;
import com.example.board.demo.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
    private final BoardService boardService;

    
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/list")
    public String list(@ModelAttribute("params") final SearchDto params, Model model) {
    	PagingResponse<Board> response = boardService.findAll(params);
        model.addAttribute("response", response);
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

    //게시글 삭제
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        boardService.delete(id);
        return "redirect:/board/list";
    }
    
    //게시글 다중삭제
    @PostMapping("/deleteSelected")
    public ResponseEntity<Map<String, String>> deleteSelected(@RequestBody Map<String, List<Integer>> requestBody) {
        List<Integer> selectedIds = requestBody.get("selectedIds");
        
        System.out.println("Selected IDs: " + selectedIds);  // 로그 출력
        
        //선택항목 없음
        if (selectedIds == null || selectedIds.isEmpty()) {
        	Map<String, String> errorResponse = new HashMap<>();
        	errorResponse.put("message", "선택된 항목이 없습니다.");
            return ResponseEntity.badRequest().body(errorResponse);
        }
        
        try {
        	//삭제성공
        	boardService.deleteSelectedBoards(selectedIds);
        }
        catch (Exception e){
        	Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "삭제 처리 중 오류가 발생했습니다.");
            return ResponseEntity.status(500).body(errorResponse);
        }
        
        Map<String, String> successResponse = new HashMap<>();
        successResponse.put("message", "success");
        return ResponseEntity.ok(successResponse);
    }
}
