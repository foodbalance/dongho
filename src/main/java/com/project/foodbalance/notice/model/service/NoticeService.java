package com.project.foodbalance.notice.model.service;


import java.util.ArrayList;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> selectAll();
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	ArrayList<Notice> selectList(Paging page); //한 페이지에 출력할 게시글 조회용
	Notice selectNotice(int notice_no); //해당 번호에 대한 게시글 상세 조회용
	int insertNotice(Notice notice); //원글 등록용
	int updateNotice(Notice notice);  //원글 수정용
	int deleteNotice(int notice_no);  //게시글 삭제용
	int selectWriterCount();//제목으로 검색 갯수 카운트
	
	ArrayList<Notice> selectNewTop3();  //메인에 최신 공지 3개 올리기용
	
	int selectSearchTitle(String keyword);  //제목으로 검색
	ArrayList<Notice> pageSearchTitle(Paging page);  //제목 검색 페이징
	
	int selectSearchWriter(String keyword);  //작성자로 검색
	ArrayList<Notice> pageSearchWriter(Paging page);  //작성자 검색 페이징
	
	int selectSearchDate(SearchDate date);  //날짜로 검색
	ArrayList<Notice> pageSearchDate(Paging page);  //날짜 검색 페이징
	
	int updateAddReadcount(int notice_no);  // 공지사항 조회수
	
}