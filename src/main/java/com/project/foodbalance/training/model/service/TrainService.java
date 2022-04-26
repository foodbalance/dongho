package com.project.foodbalance.training.model.service;

import java.util.ArrayList;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.vo.Train;

public interface TrainService {
	ArrayList<Train> selectTop3();
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	ArrayList<Train> selectList(Paging page); //한 페이지에 출력할 게시글 조회용
	Train selectBoard(int register_no); //해당 번호에 대한 게시글 상세 조회용
	int updateAddReadcount(int register_no);  //상세보기시에 조회수 1증가 처리용
	int insertOriginBoard(Train train); //원글 등록용
	int updateOrigin(Train train);  //원글 수정용
	int deleteBoard(Train train);  //게시글 삭제용
	
	
	ArrayList<Train> selectSearchTitle(String keyword);
	ArrayList<Train> selectSearchWriter(String keyword);
	ArrayList<Train> selectSearchDate(SearchDate date);
}
