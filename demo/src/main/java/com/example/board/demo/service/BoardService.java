package com.example.board.demo.service;

import org.springframework.stereotype.Service;
import com.example.board.demo.mapper.BoardMapper;
import com.example.board.demo.model.Board;
import com.example.board.demo.model.Pagination;
import com.example.board.demo.model.PagingResponse;
import com.example.board.demo.model.SearchDto;

import java.util.Collections;
import java.util.List;

@Service
public class BoardService {
	
    private final BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public PagingResponse<Board> findAll(final SearchDto params) {
    	// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null 반환
    	int count = boardMapper.count(params);
    	if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }
    	
    	// Pagination 페이지정보 계산 => SearchDto params에 계산된 페이지 정보 저장
    	Pagination pagination = new Pagination(count, params);
    	params.setPagination(pagination);
    	
    	// 계산된 페이지 정보 받기(limitStart, recordSize) 데이터조회 => 응답 데이터 반환
        List<Board> list = boardMapper.findAll(params);
        return new PagingResponse<>(list, pagination);
    }

    //해당 id 게시글 찾기
    public Board findById(int id) {
        return boardMapper.findById(id);
    }

    //게시글 작성
    public int insert(Board board) {
        return boardMapper.insert(board);
    }
    
    //게시글 수정
    public int update(Board board) {
        return boardMapper.update(board);
    }
    
    //게시글 삭제
    public int delete(int id) {
        return boardMapper.delete(id);
    }

    //게시글 선택삭제
    public void deleteSelectedBoards(List<Integer> selectedIds) {
        try {
        	//선택된 id 없을 시
            if (selectedIds.isEmpty()) {
                throw new IllegalArgumentException("boardservice: 선택된 항목이 없습니다. ");
            }
            
            System.out.println("service // Selected IDs: " + selectedIds);//로그테스트
            
            boardMapper.deleteSelectedBoards(selectedIds);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("service.java 오류");
        }
    }

}