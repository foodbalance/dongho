package com.project.foodbalance.board.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;

@Repository("boardDao")
public class BoardDao implements Serializable {


	private static final long serialVersionUID = 2129957075764586224L;

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Board> selectTop3() {
		List<Board> list = session.selectList("boardMapper.selectTop3");
		return (ArrayList<Board>)list;
	}

	public int selectListCount() {
		return session.selectOne("boardMapper.getListCount");
	}

	public Board selectBoard(int board_no) {
		return session.selectOne("boardMapper.selectBoard", board_no);
	}

	public ArrayList<Board> selectList(Paging page) {
		List<Board> list = session.selectList("boardMapper.selectList", page);
		return (ArrayList<Board>)list;
	}

	public int updateAddReadcount(int board_no) {
		return session.update("boardMapper.addReadCount", board_no);
	}

	public int insertOriginBoard(Board board) {
		return session.insert("boardMapper.insertOriginBoard", board);
	}

	public int updateOrigin(Board board) {
		return session.update("boardMapper.updateOrigin", board);
	}

	public int deleteBoard(Board board) {
		return session.delete("boardMapper.deleteBoard", board);
	}

	public ArrayList<Board> selectSearchTitle(Paging page) {
		List<Board> list = session.selectList("boardMapper.searchTitle", page);
		return (ArrayList<Board>)list;
	}

	public ArrayList<Board> selectSearchWriter(Paging page) {
		List<Board> list = session.selectList("boardMapper.searchWriter", page);
		return (ArrayList<Board>)list;
	}

	public int searchTitleCount(String keyword) {
		return session.selectOne("boardMapper.searchTitleCount", keyword);
	}

	public int searchWriterCount(String keyword) {
		return session.selectOne("boardMapper.searchWriterCount", keyword);
	}

}
