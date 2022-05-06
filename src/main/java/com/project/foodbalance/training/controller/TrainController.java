package com.project.foodbalance.training.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.training.model.service.TrainService;
import com.project.foodbalance.training.model.vo.Train;

@Controller
public class TrainController {
	private static final Logger logger = LoggerFactory.getLogger(TrainController.class);
	
	@Autowired
	private TrainService trainService;
	
//	@RequestMapping("trainPage.do")
//	public String moveTrainPage() {
//		return "train/trainListView";
//	}
	
	@RequestMapping(value="ttop3.do", method=RequestMethod.POST)
	@ResponseBody
	public String trainReadCountTop3(HttpServletResponse respnose) throws UnsupportedEncodingException{
		// top3 운동법 조회해옴
		ArrayList<Train> list = trainService.selectTop3();
		
		//전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		//list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();
		
		//list를 jarr 로 옮기기(복사)
		for(Train train: list) {
			//train 필드값 저장용 json 객체 생성
			JSONObject job = new JSONObject();
			
			job.put("train_no", train.getTrain_no());
			job.put("train_title", URLEncoder.encode(train.getTrain_title(), "utf-8"));
			job.put("train_url_img", train.getTrain_url_img());
			//한글 데이터 인코딩하여 json에 담아야함
			
			jarr.add(job);
		}
		
		//전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);
		System.out.println("인기 운동법 : " + list);
		return sendJson.toJSONString();	//json 을 json string 형으로 바꿔 전송
		//뷰리졸버에게로 리턴
	}
	
	//운동법 게시글 페이지 단위로 목록 조회 처리용
	@RequestMapping("tlist.do")
	public ModelAndView trainListMethod(@RequestParam(name="page", required=false) String page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징 계산처리
		int limit = 10;	//한페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록 갯수 조회
		int listCount = trainService.selectListCount();
		//페이지 수 계산
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / 10 + 0.9);
		int endPage = startPage + 10 - 1;
		//페이징처리 분류
		String menu = "train";
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);
		
		//서비스 메소드 실행하고 결과 받기
		ArrayList<Train> list = trainService.selectList(paging);
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("menu", menu);
			
			mv.setViewName("train/trainListView");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 운동법 쓰기 페이지로 이동
	@RequestMapping("twform.do")
	public String moveTrainWriteForm() {
		return "train/trainWriteForm";
	}
	
	//운동법 등록 처리용
	@RequestMapping(value = "tinsert.do", method = RequestMethod.POST)
	public String trainInsertMethod(Train train, HttpServletRequest request, Model model) {
		String thumbId = train.getTrain_url().substring(train.getTrain_url().length()-11) + "/default.jpg"; //유뷰브 url 에서 동영상 아이디 추출
		String furl = "http://img.youtube.com/vi/";	// 썸네일 이미지 추출하기 위한 전반부 url
		String url_img = furl + thumbId;		
		train.setTrain_url_img(url_img);	//썸네일 이미지 url train에 지정
		train.setTrain_url("https://www.youtube.com/embed/" + thumbId + "autoplay=1&mute=1");	// 유튜브 iframe에 src 에 들어갈 url 구문 지정
		if(trainService.insertOriginTrain(train) > 0) {
			System.out.println(train);
			return "redirect:tlist.do?page=1";
		}else {
			model.addAttribute("message", "운동법 등록 실패");
			return "common/error";
		}
	}
	

	
	//운동법 상세보기
	@RequestMapping("tdetail.do")
	public ModelAndView trainDetailMethod(ModelAndView mv, @RequestParam("train_no") int train_no,
			@RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//조회수 증가 처리
		trainService.updateAddReadcount(train_no);
		
		//해당 게시글 조회
		Train train = trainService.selectTrain(train_no);
		System.out.println(train.getTrain_url());
		if(train != null) {
			mv.addObject("train", train);
			mv.addObject("currentPage", currentPage);
			mv.setViewName("train/trainDetail");
		}else {
			mv.addObject("message", train_no + "번 게시글 조회 실패.");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	//삭제 처리용
	@RequestMapping("tdel.do")
	public String trainDeleteMethod(Train train, HttpServletRequest request, Model model) {
		if(trainService.deleteTrain(train) > 0) {
			return "redirect:tlist.do?page=1";
		}else {
			model.addAttribute("message", train.getTrain_no() + "번 글 삭제 실패");
			return "common/error";
		}
	}
	
	//수정 페이지 이동
	@RequestMapping("tupview.do")
	public String moveTrainUpdateView(@RequestParam("train_no") int train_no, @RequestParam("page") int currentPage
			,Model model) {
		Train train = trainService.selectTrain(train_no);
		if(train != null) {
			model.addAttribute("train", train);
			model.addAttribute("page", currentPage);
			return "train/trainUpdateView";
		}else {
			model.addAttribute("message", train_no + "번 글 수정페이지 이동 실패");
			return "common/error";
		}
	}
	
	//수정 처리용
	@RequestMapping(value="trainup.do", method=RequestMethod.POST)
	public String trainUpdateMethod(Train train, HttpServletRequest request, Model model,
			@RequestParam("page") int page, @RequestParam(name="delFlag", required =false) String delFlag) {
		if (trainService.updateOriginTrain(train) > 0) {
			model.addAttribute("page", page);
			model.addAttribute("train_no", train.getTrain_no());
			return "redirect:tdetial.do";
		}else {
			model.addAttribute("message", train.getTrain_no() + "번 게시물 수정 실패");
			return "common/errer";
		}
	}
	
	// 제목 검색 페이징
		@RequestMapping("tsearchTitle.do")
		public ModelAndView tsearchTitleMethod(@RequestParam(name="page", required=false) String page, @RequestParam("keyword") String keyword, ModelAndView mv) {
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
			int limit = 10; //한 페이지에 출력할 목록 갯수
			//페이지 수 계산을 위해 총 목록갯수 조회
			int listCount = trainService.searchTitleCount(keyword);
			System.out.println("제목  " + keyword);
			//페이지 수 계산
			//주의 : 목록이 11개 이면, 페이지 수는 2가됨
			int maxPage = (int)((double)listCount / limit + 0.9);
			//현재 페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
			int startPage = (int)((double)currentPage / 10 + 0.9);
			//현재 페이지가 포함된 페이지그룹의 끝값
			int endPage = startPage + 10 - 1;
			// 검색어
			String searchkeyword  = keyword;
			//페이징처리 분류
			String menu = "train";
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
		
			//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			Paging paging = new Paging(startRow, endRow, searchkeyword);
			//-----------------------------------------
			//서비스 메소드 실행하고 결과 받기
			ArrayList<Train> list = trainService.selectSearchTitle(paging);

			
			System.out.println("검색" + listCount +",  키워드 : " + searchkeyword);
			
			if(list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("listCount", listCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startPage", startPage);
				mv.addObject("endPage", endPage);
				mv.addObject("limit", limit);
				mv.addObject("menu", menu);
				mv.addObject("action", "tsearchTitle");
				mv.addObject("keyword", searchkeyword);
				mv.setViewName("train/trainListView");
			}else {
				mv.addObject("message", currentPage + "페이지 목록 조회 실패");
				mv.setViewName("common/commonview");
			}
			return mv;
		}

		// 작성자 검색 페이징
		@RequestMapping("tsearchWriter.do")
		public ModelAndView tsearchWriterMethod(@RequestParam(name="page", required=false) String page, @RequestParam("keyword") String keyword, ModelAndView mv) {
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
			int limit = 10; //한 페이지에 출력할 목록 갯수
			//페이지 수 계산을 위해 총 목록갯수 조회
			int listCount = trainService.searchWriterCount(keyword);
			System.out.println("작성자   " + keyword);
			//페이지 수 계산
			//주의 : 목록이 11개 이면, 페이지 수는 2가됨
			int maxPage = (int)((double)listCount / limit + 0.9);
			//현재 페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
			int startPage = (int)((double)currentPage / 10 + 0.9);
			//현재 페이지가 포함된 페이지그룹의 끝값
			int endPage = startPage + 10 - 1;
			// 검색어
			String searchkeyword  = keyword;
			//페이징처리 분류
			String menu = "train";
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
		
			//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			Paging paging = new Paging(startRow, endRow, searchkeyword);
			
			System.out.println(paging);
			//-----------------------------------------
			//서비스 메소드 실행하고 결과 받기
			ArrayList<Train> list = trainService.selectSearchWriter(paging);

			
			System.out.println("검색" + listCount +",  키워드 : " + searchkeyword);
			System.out.println(list);
			if(list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("listCount", listCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startPage", startPage);
				mv.addObject("endPage", endPage);
				mv.addObject("limit", limit);
				mv.addObject("menu", menu);
				mv.addObject("action", "tsearchWriter");
				mv.addObject("keyword", searchkeyword);
				mv.setViewName("train/trainListView");
			}else {
				mv.addObject("message", currentPage + "페이지 목록 조회 실패");
				mv.setViewName("common/commonview");
			}
			return mv;
		}
			
		
		// 날짜 검색 페이징
			@RequestMapping("tsearchDate.do")
			public ModelAndView tsearchDateMethod(@RequestParam(name="page", required=false) String page, SearchDate date, ModelAndView mv) {
				int currentPage = 1;
				if(page != null) {
					currentPage = Integer.parseInt(page);
				}
				
				//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
				int limit = 10; //한 페이지에 출력할 목록 갯수
				//페이지 수 계산을 위해 총 목록갯수 조회
				int listCount = trainService.searchDateCount(date);
				System.out.println("검색" + listCount);
				//페이지 수 계산
				//주의 : 목록이 11개 이면, 페이지 수는 2가됨
				int maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
				int startPage = (int)((double)currentPage / 10 + 0.9);
				//현재 페이지가 포함된 페이지그룹의 끝값
				int endPage = startPage + 10 - 1;
				// 검색어
				Date begin = date.getBegin();
				Date end = date.getEnd();
				//페이징처리 분류
				String menu = "train";
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}


				//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				Paging paging = new Paging(startRow, endRow, begin, end);
				//-----------------------------------------
				//서비스 메소드 실행하고 결과 받기
				ArrayList<Train> list = trainService.selectSearchDate(paging);

				
				System.out.println(list);
				
				if(list != null && list.size() > 0) {
					mv.addObject("list", list);
					mv.addObject("listCount", listCount);
					mv.addObject("maxPage", maxPage);
					mv.addObject("currentPage", currentPage);
					mv.addObject("startPage", startPage);
					mv.addObject("endPage", endPage);
					mv.addObject("limit", limit);
					mv.addObject("menu", menu);
					mv.addObject("action", "tsearchDate");
					mv.addObject("begin", begin);
					mv.addObject("end", end);
					mv.setViewName("train/trainListView");
				}else {
					mv.addObject("message", currentPage + "페이지 목록 조회 실패");
					mv.setViewName("common/commonview");
				}
				return mv;
			}
}




















