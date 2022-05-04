package com.project.foodbalance.board.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.foodbalance.board.model.service.BoardService;
import com.project.foodbalance.board.model.service.ReplyService;
import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.board.model.vo.Reply;

@Controller
public class ReplyController {

	@Inject
	private ReplyService replyService;
	@Inject
	private BoardService boardService;
	
	// 댓글 작성
	@RequestMapping(value = "writeReply.do", method = RequestMethod.POST)
	public String posttWirte(Reply vo) throws Exception {

		
	    replyService.write(vo);
	    
	    return "redirect:/bdetail.do?board_no=" + vo.getBoard_no();
	}
	
	//댓글 수정 페이지
		@RequestMapping(value = "updateReply.do", method = RequestMethod.GET)
		public String updateReply(Locale locale, Model model, HttpSession session, HttpServletRequest req, int board_no) {

			int reply_no = Integer.parseInt(req.getParameter("reply_no"));
			
			model.addAttribute("board", boardService.selectBoard(board_no));
			model.addAttribute("reply", replyService.viewReply(board_no));
			model.addAttribute("update", reply_no);
			
			return "board/updateReply";
		}
		
		//댓글 수정하기
		@RequestMapping(value = "updateReplyPro.do", method = RequestMethod.POST)
		public String updateReplyPro(RedirectAttributes redirectAttributes, HttpServletRequest req, HttpServletResponse response, Locale locale, Model model, int reply_no) throws IOException {
			Reply vo = new Reply();
			vo.setReply_no(Integer.parseInt(req.getParameter("reply_no")));
			vo.setReply_content(req.getParameter("updateReply"));
			int board_no = Integer.parseInt(req.getParameter("board_no"));
			
			replyService.updateReply(vo);
			redirectAttributes.addAttribute("board_no", board_no);
			
			return "redirect:/bdetail.do?board_no=" + board_no;
		}
		
		//댓글 삭제하기
		@RequestMapping(value = "deleteReply.do", method = RequestMethod.GET)
		public String deleteReply(RedirectAttributes redirectAttributes, HttpServletResponse response, HttpServletRequest req, Locale locale, Model model, int board_no) {

			redirectAttributes.addAttribute("board_no", board_no);
			
			int replyNo = Integer.parseInt(req.getParameter("reply_no"));
			
			replyService.deleteReply(replyNo);
			return "redirect:/bdetail.do?board_no=" + board_no;
		}


}
