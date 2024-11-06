package com.example.board.demo.service;

import org.springframework.stereotype.Service;

import com.example.board.demo.mapper.UserMapper;
import com.example.board.demo.model.Board;
import com.example.board.demo.model.User;

import java.util.List;

@Service
public class UserService {
    private final UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    //회원목록 조회
    public List<User> findAll() {
        return userMapper.findAll();
    }

    //해당유저 찾기
    public User findById(String user) {
        return userMapper.findById(user);
    }

    //회원가입 DB저장 메서드
    public int insert(User user) {
        return userMapper.insert(user);
    }

    //회원정보수정 - 한다면?
    public int update(User user) {
        return userMapper.update(user);
    }

}