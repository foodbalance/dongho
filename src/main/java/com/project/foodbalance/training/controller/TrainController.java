package com.project.foodbalance.training.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.foodbalance.training.model.service.TrainService;

@Controller
public class TrainController {
	private static final Logger logger = LoggerFactory.getLogger(TrainController.class);
	
	@Autowired
	private TrainService trainService;
	
	@RequestMapping("trainPage.do")
	public String moveTrainPage() {
		return "train/trainListView";
	}
	
	//운동법 게시글 페이지 단위로 목록 조회 처리용
	@RequestMapping("tlist.do")
	public ModelAndView trainListMethod(@RequestParam(name="page", required=false) String page, ModelAndView mv) {
		return mv;
	}
}
