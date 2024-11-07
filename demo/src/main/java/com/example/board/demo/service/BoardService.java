package com.example.board.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.board.demo.mapper.BoardMapper;
import com.example.board.demo.model.Board;

import java.util.Arrays;
import java.util.List;

@Service
public class BoardService {
	
    private final BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public List<Board> findAll() {
        return boardMapper.findAll();
    }

    public Board findById(int id) {
        return boardMapper.findById(id);
    }

    public int insert(Board board) {
        return boardMapper.insert(board);
    }

    public int update(Board board) {
        return boardMapper.update(board);
    }

    public int delete(int id) {
        return boardMapper.delete(id);
    }

    public void deleteSelectedBoards(List<Integer> selectedIds) {
        try {
            if (selectedIds.isEmpty()) {
                throw new IllegalArgumentException("선택된 항목이 없습니다.");
            }
            // 삭제 처리 로직
            System.out.println("Selected IDs: " + selectedIds);
            boardMapper.deleteSelectedBoards(selectedIds);
        } catch (Exception e) {
            // 예외 처리 및 로그 출력
            e.printStackTrace();
            throw new RuntimeException("service.java 오류");
        }
    }

}