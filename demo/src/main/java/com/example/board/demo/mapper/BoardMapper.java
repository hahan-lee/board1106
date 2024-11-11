package com.example.board.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.board.demo.model.Board;
import com.example.board.demo.model.SearchDto;

@Mapper
public interface BoardMapper {
    List<Board> findAll(SearchDto params); //리스트출력
    int count(SearchDto params); // 게시글 수 카운팅
    Board findById(int id); //상세보기
    int insert(Board board); //쓰기
    int update(Board board); //수정
    int delete(int id); //삭제
    void deleteSelectedBoards(@Param("selectedIds") List<Integer> selectedIds); //선택삭제
}
