package com.example.board.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.demo.model.User;

@Mapper
public interface UserMapper {
    List<User> findAll(); //유저 전체 출력
    User findById(String userId);//아이디 조회 메서드
    int insert(User user);//회원가입 메서드
    int update(User user);//회원정보 수정 메서드
}
