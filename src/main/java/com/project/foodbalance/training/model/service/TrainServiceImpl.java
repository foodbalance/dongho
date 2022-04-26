package com.project.foodbalance.training.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.vo.Train;

@Service("trainService")
public class TrainServiceImpl implements TrainService{

	@Override
	public ArrayList<Train> selectTop3() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Train> selectList(Paging page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Train selectBoard(int register_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateAddReadcount(int register_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertOriginBoard(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrigin(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(Train train) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Train> selectSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Train> selectSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Train> selectSearchDate(SearchDate date) {
		// TODO Auto-generated method stub
		return null;
	}

}
