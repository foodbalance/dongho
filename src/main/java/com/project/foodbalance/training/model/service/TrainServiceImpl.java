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
	public ArrayList<Train> selectList(Paging page) {
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
		return trainDao.insertOriginTrain(train);
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
	public ArrayList<Train> selectSearchTtitle(Paging page) {
		return trainDao.selectSearchTitle(page);
	}
	
	//작성자 검색 페이징
	@Override
	public ArrayList<Train> selectSearchWriter(Paging page) {
		return trainDao.selectSearchWriter(page);
	}
	
	//날짜검색페이징
	@Override
	public ArrayList<Train> selectSearchDate(Paging page) {
		return trainDao.selectSearchDate(page);
	}
	
	//제목 검색 페이징
	@Override
	public ArrayList<Train> selectSearchTitle(Paging page) {
		return trainDao.selectSearchTitle(page);
	}
	
	//제목 검색 카운트
	@Override
	public int searchTitleCount(String keyword) {
		return trainDao.searchTitleCount(keyword);
	}
	
	//작성자 검색 카운트
	@Override
	public int searchWriterCount(String keyword) {
		return trainDao.searchWriterCount(keyword);
	}
	
	//날짜 검색 카운트
	@Override
	public int searchDateCount(SearchDate date) {
		return trainDao.searchDateCount(date);
	}

	

}
