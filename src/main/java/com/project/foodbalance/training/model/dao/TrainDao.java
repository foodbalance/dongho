package com.project.foodbalance.training.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.vo.Train;

@Repository("trainDao")
public class TrainDao implements Serializable{

	private static final long serialVersionUID = 4549498462032513535L;
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Train> selectTop3() {
		List<Train> list = session.selectList("trainMapper.selectTop3");
		return (ArrayList<Train>)list;
	}

	public int selectListCount() {
		return session.selectOne("trainMapper.getListCount");
	}

	public ArrayList<Train> selectList(Paging page) {
		List<Train> list = session.selectList("trainMapper.selectList", page);
		return (ArrayList<Train>)list;
	}

	public Train selectTrain(int train_no) {
		return session.selectOne("trainMapper.selectTrain", train_no);
	}

	public int updateAddReadcount(int train_no) {
		return session.update("trainMapper.addReadCount", train_no);
	}

	public int insertOriginTrain(Train train) {
		return session.insert("trainMapper.insertOriginTrain", train);
	}

	public int updateOriginTrain(Train train) {
		return session.update("trainMapper.updateOrigin", train);
	}

	public int deleteTrain(Train train) {
		return session.delete("trainMapper.deleteTrain", train);
	}

	public ArrayList<Train> selectSearchTitle(Paging page) {
		List<Train> list = session.selectList("trainMapper.searchTitle", page);
		return (ArrayList<Train>)list;
	}
	
	//총 게시글 갯수 조회 (제목 검색)
	public int searchTitleCount(String keyword) {	
		return session.selectOne("trainMapper.searchTitleCount", keyword);
	}
	
	public ArrayList<Train> selectSearchWriter(Paging page) {
		List<Train> list = session.selectList("trainMapper.searchWriter", page);
		return (ArrayList<Train>)list;
	}

	public ArrayList<Train> selectSearchDate(Paging page) {
		List<Train> list = session.selectList("trainMapper.searchDate", page);
		return (ArrayList<Train>)list;
	}

	public int searchWriterCount(String keyword) {
		return session.selectOne("trainMapper.searchWriterCount", keyword);
	}

	public int searchDateCount(SearchDate date) {
		return session.selectOne("trainMapper.searchDateCount", date);
	}


	
	
}
