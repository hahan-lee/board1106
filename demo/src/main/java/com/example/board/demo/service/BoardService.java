package com.example.board.demo.service;

import org.springframework.stereotype.Service;

import com.example.board.demo.mapper.BoardMapper;
import com.example.board.demo.model.Board;

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
}