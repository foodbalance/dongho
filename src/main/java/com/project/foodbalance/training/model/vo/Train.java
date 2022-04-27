package com.project.foodbalance.training.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Train implements Serializable {

	private static final long serialVersionUID = -2802867426306390890L;
	
	private int train_no;	//운동법 게시번호
	private String user_id;	//사용자 아이디
	private String train_title;	//운동법 제목
	private String train_content;	//운동법 설명
	private String train_url;	//운동법 영상 url
	private Date train_date;	//게시날짜
	private int train_count;	//조회수
	
	public Train() {
		super();
	}

	public Train(int train_no, String user_id, String train_title, String train_content, String train_url,
			Date train_date, int train_count) {
		super();
		this.train_no = train_no;
		this.user_id = user_id;
		this.train_title = train_title;
		this.train_content = train_content;
		this.train_url = train_url;
		this.train_date = train_date;
		this.train_count = train_count;
	}

	public int getTrain_no() {
		return train_no;
	}

	public void setTrain_no(int train_no) {
		this.train_no = train_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTrain_title() {
		return train_title;
	}

	public void setTrain_title(String train_title) {
		this.train_title = train_title;
	}

	public String getTrain_content() {
		return train_content;
	}

	public void setTrain_content(String train_content) {
		this.train_content = train_content;
	}

	public String getTrain_url() {
		return train_url;
	}

	public void setTrain_url(String train_url) {
		this.train_url = train_url;
	}

	public Date getTrain_date() {
		return train_date;
	}

	public void setTrain_date(Date train_date) {
		this.train_date = train_date;
	}

	public int getTrain_count() {
		return train_count;
	}

	public void setTrain_count(int train_count) {
		this.train_count = train_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Train [train_no=" + train_no + ", user_id=" + user_id + ", train_title=" + train_title
				+ ", train_content=" + train_content + ", train_url=" + train_url + ", train_date=" + train_date
				+ ", train_count=" + train_count + "]";
	}
	
	
}
