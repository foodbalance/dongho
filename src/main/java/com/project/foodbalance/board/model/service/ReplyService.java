package com.project.foodbalance.board.model.service;

import java.util.List;

import com.project.foodbalance.board.model.vo.Reply;

public interface ReplyService {

	// 댓글 조회
	public List<Reply> list(int bno) throws Exception;

	// 댓글 조회
	public void write(Reply vo) throws Exception;

	// 댓글 수정
	public void updateReply(Reply vo);

	// 댓글 삭제
	public void deleteReply(int replyNo);

	public List<Reply> viewReply(int board_no);

}