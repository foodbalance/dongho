package com.project.foodbalance.training.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.training.model.vo.Train;

@Repository("trainDao")
public class TrainDao implements Serializable{

	private static final long serialVersionUID = 4549498462032513535L;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Train> selectTop3() {
		List<Train> list = session.selectList("trainMapper.trainTop3");
		return (ArrayList<Train>)list;
	}
	
	//총 운동법 갯수 조회(페이지 수 계산)
	public Train getListCount(int register_no) {
		return session.selectOne("trainMapper.getListCount");
	}
	
	//해당 번호에 대한 운동법 상세 조회
	public Train selectTrain(int register_no) {
		return session.selectOne("trainMapper.selectTrain", register_no);
	}
	
	//한 페이지에 출력할 게시글 조회
	public ArrayList<Train> selectList(Paging page){
		List<Train> list = session.selectList("trainMapper.selectList", page);
		return (ArrayList<Train>)list;
	}
	
	//상세보기시에 조회수 1증가 처리
	public int updateAddreadcount(int register_no) {
		return session.update("trainMapper.addReadCount", register_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
