package com.project.foodbalance.training.model.dao;

import java.io.Serializable;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.vo.Train;

@Repository("trainDao")
public class TrainDao implements Serializable{

	private static final long serialVersionUID = 4549498462032513535L;
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Train> selectTop3() {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Train> selectList(Paging page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Train selectTrain(int train_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateAddReadcount(int train_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertOriginBoard(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateOriginTrain(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteTrain(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Train> selectSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Train> selectSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Train> selectSearchDate(SearchDate date) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
}
