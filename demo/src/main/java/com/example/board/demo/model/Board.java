package com.example.board.demo.model;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {

	private int id;
    private String title;
    private String content;
    private String writer;
    private Date createdAt;

    //수정일자, 수정인 추가
    private Date updateAt;
    private String updateUser; //굳이..
    
}