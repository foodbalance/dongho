package com.project.foodbalance.board.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.foodbalance.board.model.dao.BoardDao;
import com.project.foodbalance.board.model.dao.ReplyDao;
import com.project.foodbalance.board.model.vo.Reply;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDao dao;

	// 댓글 조회
	@Override
	public List<Reply> list(int board_no) throws Exception {
	    return dao.list(board_no);
	}

	@Override
	public void write(Reply vo) throws Exception {
	    dao.write(vo);
	}


	@Override
	public void updateReply(Reply vo) {
		dao.updateReply(vo);
		
	}

	@Override
	public void deleteReply(int reply_no) {
		dao.deleteReply(reply_no);
	}
	

	@Override
	public List<Reply> viewReply(int board_no){
		return dao.viewReply(board_no);
	}


}