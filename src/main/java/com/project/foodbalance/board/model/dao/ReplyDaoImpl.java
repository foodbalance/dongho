package com.project.foodbalance.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.board.model.vo.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession sql;


	// 댓글 조회
	@Override
	public ArrayList<Reply> list(int board_no) throws Exception {
	    List<Reply> list = sql.selectList("replyMapper.viewReply", board_no);
		return (ArrayList<Reply>)list;
	}


//	@Override
//	public void write(Reply vo) throws Exception {
//		
//		
//	}

	//댓글 수정
	@Override
	public void updateReply(Reply vo) {
		sql.update("replyMapper.updateReply", vo);
	}

	//댓글 삭제
	@Override
	public void deleteReply(int reply_no) {
		sql.delete("replyMapper.deleteReply", reply_no);
		
	}

	// 댓글 작성
	@Override
	public void write(Reply vo) throws Exception {
	    sql.insert("replyMapper.writeReply", vo);
	}



	
	@Override
	public List<Reply> viewReply(int board_no){
		 List<Reply> list = sql.selectList("replyMapper.viewReply", board_no);
			return (ArrayList<Reply>)list;
	}
		
	
//
//	// 댓글 수정
//	@Override
//	public void modify(Reply vo) throws Exception {
//	    sql.update("replyMapper.replyModify", vo);
//	}
//
//	// 댓글 삭제
//	@Override
//	public void delete(Reply vo) throws Exception {
//	    sql.delete("replyMapper.replyDelete", vo);
//	}

	

}