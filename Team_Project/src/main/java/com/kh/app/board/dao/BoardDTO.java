package com.kh.app.board.dao;

public class BoardDTO {
	private int boardnum;
	private String boardtitle;
	private String boardcontents;
	private String username;
	private String boarddate;	// date 를 string 타입으로 가지고 올 수 있나? 된다고 하네
	private int boardreadcount;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontents() {
		return boardcontents;
	}
	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	public int getBoardreadcount() {
		return boardreadcount;
	}
	public void setBoardreadcount(int boardreadcount) {
		this.boardreadcount = boardreadcount;
	}
	
	
}
