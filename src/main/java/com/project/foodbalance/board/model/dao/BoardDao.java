package com.project.foodbalance.board.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;


@Repository("boardDao")
public class BoardDao implements Serializable{

	private static final long serialVersionUID = -2083362122348685373L;
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Board> selectTop3() {
		List<Board> list = session.selectList("boardMapper.selectTop3");
		return (ArrayList<Board>)list;
	}

	//총 게시글 갯수 조회 (페이지 수 계산)
	public int selectListCount() {
		return session.selectOne("boardMapper.getListCount");
	}
	
	//한 페이지에 출력할 게시글 조회
	public ArrayList<Board> selectList(Paging page) {
		List<Board> list = session.selectList("boardMapper.selectList", page);
		return (ArrayList<Board>)list;
	}
	
	//해당 번호에 대한 게시글 상세 조회
	public Board selectBoard(int board_no) {
		return session.selectOne("boardMapper.selectBoard", board_no);
	}
	
	//상세보기시에 조회수 1증가 처리
	public int updateAddReadcount(int board_no) {
		return session.update("boardMapper.addReadCount", board_no);
	}

	//게시글 등록
	public int insertOriginBoard(Board board) {
		return session.insert("boardMapper.insertOriginBoard", board);
	}

	//게시글 수정
	public int updateOrigin(Board board) {
		return session.update("boardMapper.updateOrigin", board);
	}

	//게시글 삭제
	public int deleteBoard(Board board) {
		return session.delete("boardMapper.deleteBoard", board);
	}
	

	//제목 검색 페이징
	public ArrayList<Board> selectSearchTitle(Paging page) {
		List<Board> list = session.selectList("boardMapper.searchTitle", page);
		return (ArrayList<Board>)list;
	}
	//총 게시글 갯수 조회 (제목 검색)
	public int searchTitleCount(String keyword) {	
		return session.selectOne("boardMapper.searchTitleCount", keyword);
	}
	
	
	//작성자 검색 페이징
	public ArrayList<Board> selectSearchWriter(Paging page) {
		List<Board> list = session.selectList("boardMapper.searchWriter", page);
		return (ArrayList<Board>)list;
	}
	//총 게시글 갯수 조회 (작성자 검색)
	public int searchWriterCount(String keyword) {
		return session.selectOne("boardMapper.searchWriterCount", keyword);
	}
	
//	//날짜 검색 페이징
	public ArrayList<Board> selectSearchDate(Paging page) {
		List<Board> list = session.selectList("boardMapper.searchDate", page);
		return (ArrayList<Board>)list;
	}
	//총 게시글 갯수 조회 (날짜 검색)
	public int searchDateCount(SearchDate date) {			
		return session.selectOne("boardMapper.searchDateCount", date);
	}
	
	public int insertReply(Board reply) {
		int result = 0;

		if (reply.getBoard_reply_lev() == 2) {  //댓글이면
			result = session.insert("boardMapper.insertReply1", reply);
		}
		if (reply.getBoard_reply_lev() == 3) {  //대댓글이면
			result = session.insert("boardMapper.insertReply2", reply);
		}

		return result;
	}

	public int updateReplySeq(Board reply) {
		int result = 0;

		if (reply.getBoard_reply_lev() == 2) {  //댓글이면
			result = session.update("boardMapper.updateReplySeq1", reply);
		}
		if (reply.getBoard_reply_lev() == 3) {  //대댓글이면
			result = session.update("boardMapper.updateReplySeq2", reply);
		}

		return result;
	}
	
	public int updateReply(Board reply) {
		return session.update("boardMapper.updateReply", reply);
	}
	
	
}