package com.project.foodbalance.board.model.vo;

import java.sql.Date;

public class Reply {

	private int board_no;
	private int reply_no;
	private String reply_content;
	private String user_id;
	private Date reply_date;

	public Reply() {
		super();
	}

	public Reply(int board_no, int reply_no, String reply_content, String user_id, Date reply_date) {
		super();
		this.board_no = board_no;
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.user_id = user_id;
		this.reply_date = reply_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "Reply [board_no=" + board_no + ", reply_no=" + reply_no + ", reply_content=" + reply_content
				+ ", user_id=" + user_id + ", reply_date=" + reply_date + "]";
	}

}