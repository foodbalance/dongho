package com.project.foodbalance.training.model.service;

import java.util.ArrayList;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.vo.Train;

public interface TrainService {
	ArrayList<Train> selectTop3();	//메인 페이지 상위 3개목록
	int selectListCount();	//총 운동법 게시글 조회용 (페이징 처리용)
	ArrayList<Train> seletList(Paging page);	//한 페이지에 출력할 게시글 조회용
	Train selectTrain(int train_no);	//운동법 상세보기용
	int updateAddReadcount(int train_no);	//조회수 처리용
	int insertOriginTrain(Train train);	//원글 등록용
	int updateOriginTrain(Train train);	//운동법 게시글 수정용
	int deleteTrain(Train train);	//운동법 게시글 삭제용
	
	ArrayList<Train> selectSearchTtitle(String keyword);
	ArrayList<Train> selectSearchWriter(String keyword);
	ArrayList<Train> selectSearchDate(SearchDate date);
	
}
