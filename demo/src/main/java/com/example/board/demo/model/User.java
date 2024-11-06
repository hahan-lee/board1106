package com.example.board.demo.model;

import java.util.Date;

import org.springframework.data.annotation.Id;


public class User {

	private int idx;
	
	@Id
	private String userId;
	
	private String userPw;
	private String userName;
	private String userEmail;
    private Date createdAt;
    
    public int getIdx() {
		return idx;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	@Override
	public String toString() {
		return "User [idx=" + idx + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", createdAt=" + createdAt + "]";
	}
	
}
