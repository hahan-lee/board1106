package com.example.board.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.board.demo.model.Board;

@Mapper
public interface BoardMapper {
    List<Board> findAll(); //리스트출력
    Board findById(int id); //상세보기
    int insert(Board board); //쓰기
    int update(Board board); //수정
    int delete(int id); //삭제
    void deleteSelectedBoards(List<Integer> selectedIds);
}
