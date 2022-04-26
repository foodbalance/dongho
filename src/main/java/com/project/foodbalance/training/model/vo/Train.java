package com.project.foodbalance.training.model.vo;

import java.io.Serializable;

public class Train implements Serializable {

	private static final long serialVersionUID = -2802867426306390890L;
	
	private String user_id;
	private int register_no;
	private String training_way;
	private String train_url;
	
	public Train() {
		super();
	}

	public Train(String user_id, int register_no, String training_way, String train_url) {
		super();
		this.user_id = user_id;
		this.register_no = register_no;
		this.training_way = training_way;
		this.train_url = train_url;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getTraining_way() {
		return training_way;
	}

	public void setTraining_way(String training_way) {
		this.training_way = training_way;
	}

	public String getTrain_url() {
		return train_url;
	}

	public void setTrain_url(String train_url) {
		this.train_url = train_url;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Train [user_id=" + user_id + ", register_no=" + register_no + ", training_way=" + training_way
				+ ", train_url=" + train_url + "]";
	}
	
	
}
