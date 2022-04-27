package com.project.foodbalance.training.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.dao.TrainDao;
import com.project.foodbalance.training.model.vo.Train;

@Service("trainService")
public class TrainServiceImpl implements TrainService {
	
	@Autowired
	private TrainDao trainDao;
	
	@Override
	public ArrayList<Train> selectTop3() {
		return trainDao.selectTop3();
	}

	@Override
	public int selectListCount() {
		return trainDao.selectListCount();
	}

	@Override
	public ArrayList<Train> seletList(Paging page) {
		return trainDao.selectList(page);
	}

	@Override
	public Train selectTrain(int train_no) {
		return trainDao.selectTrain(train_no);
	}

	@Override
	public int updateAddReadcount(int train_no) {
		return trainDao.updateAddReadcount(train_no);
	}

	@Override
	public int insertOriginTrain(Train train) {
		return trainDao.insertOriginBoard(train);
	}

	@Override
	public int updateOriginTrain(Train train) {
		return trainDao.updateOriginTrain(train);
	}

	@Override
	public int deleteTrain(Train train) {
		return trainDao.deleteTrain(train);
	}

	@Override
	public ArrayList<Train> selectSearchTtitle(String keyword) {
		return trainDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Train> selectSearchWriter(String keyword) {
		return trainDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Train> selectSearchDate(SearchDate date) {
		return trainDao.selectSearchDate(date);
	}

	

}
