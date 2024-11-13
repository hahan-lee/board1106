package com.example.board.demo.model;

import java.util.Date;

import org.springframework.data.annotation.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {

	private int idx;
	
	@Id
	private String userId;
	
	private String userPw;
	private String userName;
	private String userEmail;
    private Date createdAt;
    
    private String userPost;
    private String userAddress;
    private String userDetailAddress;
    
	
}
