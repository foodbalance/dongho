package com.project.foodbalance.notice.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.member.model.vo.Member;
import com.project.foodbalance.notice.model.service.NoticeService;
import com.project.foodbalance.notice.model.vo.Notice;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	// 게시글 페이지단위로 목록 조회 처리용
	@RequestMapping("nlist.do")
	public ModelAndView noticeListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		// 패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = noticeService.selectListCount();
		// 페이지 수 계산
		// 주의 : 목록이 11개 이면, 페이지 수는 2가됨
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지그룹의 끝값
		int endPage = startPage + 10 - 1;
		// 패이징 구분
		String menu = "notice";
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);
		// -----------------------------------------
		// 서비스 메소드 실행하고 결과 받기
		ArrayList<Notice> list = noticeService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("menu", menu);
			mv.setViewName("notice/noticeListView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		return mv;
	}
	
	
	// 공지 등록 페이지 이동
	@RequestMapping("noticeWrite.do")
	public String moveWritePage() {
		return "notice/noticeWrite";
	}

	// 공지 등록
	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public String insertOriginNotice(Notice notice, HttpServletRequest request, Model model) {
		if (noticeService.insertNotice(notice) > 0) {
			// 새 공지글 등록 성공시
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", "새 공지글 등록 실패");
			return "common/commonview";
		}
	}

	// 공지글 상세보기 요청 처리용
	@RequestMapping("ndetail.do")
	public String noticeDatailMethod(@RequestParam("notice_no") int notice_no, Model model, HttpSession session) {
		Notice notice = noticeService.selectNotice(notice_no);
		
		//조회수 1증가 처리
		noticeService.updateAddReadcount(notice_no);

		if (notice != null) {
			model.addAttribute("notice", notice);

			Member loginMember = (Member) session.getAttribute("loginMember");

			if (loginMember != null && loginMember.getAdmin_ok().equals("Y")) {
				// 관리가자 상세보기 요청 했을 때
				return "notice/noticeAdminDetailView";
			} else {
				// 클라이언트가 상세보기 요청했을 때
				return "notice/noticeDetailView";
			}
		} else {
			model.addAttribute("message", notice_no + "번 공지글 상세보기 실패");
			return "common/commonview";
		}
		
	}

	// 공지글 수정페이지로 이동 처리용
	@RequestMapping("upmove.do")
	public String moveUpdatePage(@RequestParam("notice_no") int notice_no, Model model) {
		Notice notice = noticeService.selectNotice(notice_no);
		System.out.println("확인:: " + notice_no);
		System.out.println("확인:: " + notice.getNotice_title());
		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeUpdate";
		} else {
			model.addAttribute("message", notice_no + "번 수정페이지로 이동 실패");
			return "common/commonview";
		}
	}

//		@RequestMapping("upmove.do")
//		public String moveUpdatePage() {
//			System.out.println("므ㅝ냔ㅁㅇㄹ");
//			return "notice/noticeUpdate";
//		}
	// 공지글 수정
	@RequestMapping(value = "nupdate.do", method = RequestMethod.POST)
	public String noticeUpdateMethod(Notice notice, Model model) {
		if (noticeService.updateNotice(notice) > 0) {
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice.getNotice_no() + "번 공지 수정 실패");
			return "common/commonview";
		}
	}

	// 공지글 삭제 요청 처리용
	@RequestMapping("ndel.do")
	public String noticeDeleteMethod(@RequestParam("notice_no") int notice_no, Model model) {
		if (noticeService.deleteNotice(notice_no) > 0) {
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice_no + "번 글 삭제 실패");
			return "common/commonview";
		}
	}

	// 제목 검색 및 페이징
	@RequestMapping("nsearchTitle.do")
	public ModelAndView searchTitleMethod(@RequestParam(name="page", required=false) String page, @RequestParam("keyword") String keyword, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
		int limit = 10; //한 페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = noticeService.selectSearchTitle(keyword);
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
		String menu = "notice";
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
	
		//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow, searchkeyword);
		//-----------------------------------------
		//서비스 메소드 실행하고 결과 받기
		ArrayList<Notice> list = noticeService.pageSearchTitle(paging);

		
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
			mv.addObject("action", "nsearchTitle");
			mv.addObject("keyword", searchkeyword);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		return mv;
	}

	// 공지사항 제목 검색시 글 갯수
//		@RequestMapping(value="nAddSearchTitle.do", method=RequestMethod.POST)
//		public ModelAndView SearchTitleCount(@RequestParam(name="page", required=false) String page, @RequestParam("keyword") String keyword, Model model,ModelAndView mv) {
//			int listCount = noticeService.selectWriterCount();
	//
//			ArrayList<Notice> list = noticeService.selectSearchTitle(keyword);
//			
//			if(list != null && list.size() > 0) {
//				mv.addObject("list", list);
//				mv.addObject("listCount", listCount);		
//				mv.setViewName("notice/noticeListView");
//			}else {
//				mv.addObject("message",  "페이지 목록 조회 실패");
//				mv.setViewName("common/error");
//			}
//			return mv;
//		}	
	// 작성자 검색 및 페이징
	@RequestMapping("nsearchWriter.do")
	public ModelAndView searchWriterMethod(@RequestParam(name="page", required=false) String page, @RequestParam("keyword") String keyword, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
		int limit = 10; //한 페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = noticeService.selectSearchWriter(keyword);
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
		String menu = "notice";
		
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
		ArrayList<Notice> list = noticeService.pageSearchWriter(paging);

		
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
			mv.addObject("action", "nsearchWriter");
			mv.addObject("keyword", searchkeyword);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		return mv;
	}

	
	// 날짜 검색 및 페이징
	@RequestMapping("nsearchDate.do")
	public ModelAndView searchDateMethod(@RequestParam(name="page", required=false) String page, SearchDate date, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//패이징 계산 처리 -- 별도 클래스로 작성해서 사용해도 됨----------
		int limit = 10; //한 페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = noticeService.selectSearchDate(date);
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
		String menu = "notice";
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}


		//쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow, begin, end);
		//-----------------------------------------
		//서비스 메소드 실행하고 결과 받기
		ArrayList<Notice> list = noticeService.pageSearchDate(paging);

		
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
			mv.addObject("action", "nsearchDate");
			mv.addObject("begin", begin);
			mv.addObject("end", end);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		return mv;
	}

	@RequestMapping(value = "ntop3.do", method = RequestMethod.POST)
	@ResponseBody
	public String noticeNewTop3Method(HttpServletResponse response) throws UnsupportedEncodingException {
		// 최근 등록 공지글 3개 조회해 옴
		ArrayList<Notice> list = noticeService.selectNewTop3();

		System.out.println("공지 리스트" + list);
		System.out.println("1:" + list.get(0));
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (Notice notice : list) {
			// notice 필드값 저장용 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("notice_no", notice.getNotice_no());
			job.put("notice_title", URLEncoder.encode(notice.getNotice_title(), "utf-8"));
			// 한글 데이터는 반드시 인코딩해서 json에 담아야 한글이 깨지지 않음
			job.put("notice_date", notice.getNotice_date().toString());
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json 에 담아야 함

			jarr.add(job); // job를 jarr에 저장
		}

		// 전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);

		return sendJson.toJSONString(); // json 을 json string 형으로 바꿔서 전송함
		// 뷰리졸버에게로 리턴됨

	}
}
