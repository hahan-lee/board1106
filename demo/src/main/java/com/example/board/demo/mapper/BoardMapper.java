package com.example.board.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.demo.model.Board;

@Mapper
public interface BoardMapper {
    List<Board> findAll();
    Board findById(int id);
    int insert(Board board);
    int update(Board board);
    int delete(int id);
}
