package com.example.board.demo.model;


import java.util.Date;

public class Board {

	private int id;
    private String title;
    private String content;
    private String writer;
    private Date createdAt;

    public int getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getWriter() {
		return writer;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}