package com.project.foodbalance.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.project.foodbalance.board.model.vo.Reply;

public interface ReplyDao {

	// 댓글 조회
	public ArrayList<Reply> list(int board_no) throws Exception;

	// 댓글 조회
	public void write(Reply vo) throws Exception;

	// 댓글 수정
	public void updateReply(Reply vo);

	// 댓글 삭제
	public void deleteReply(int reply_no);
	
	public List<Reply> viewReply(int boardNo);
}
