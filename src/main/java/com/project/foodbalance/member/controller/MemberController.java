package com.project.foodbalance.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.project.foodbalance.member.model.service.MemberService;
import com.project.foodbalance.member.model.vo.Member;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private String reId = "";
	private String rePwd = "";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그인 페이지로 이동
	@RequestMapping("loginPage.do")
	public String moveLoginPage(Model model) {
		model.addAttribute("reid", reId);
		model.addAttribute("repwd", rePwd);
		
		return "member/login";
	}
	
	
	//로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(HttpServletRequest request, Member member, HttpSession session, SessionStatus status, Model model) {	
		//DB 레코드 불러오기
		Member loginMember = memberService.selectLogin(request.getParameter("inputID"));
					
		String id = request.getParameter("inputID");
		String pwd = request.getParameter("inputPassword");
		String remember = request.getParameter("inputRemember");
		String viewName = null;
			
		if(remember == null) {
			remember = "";
		}
			
		if(remember.equals("Remember")) {
			reId = id;
			rePwd = pwd;
		}else{
			reId = "";
			rePwd = "";
		}
			
			
		System.out.println("아이디 : "+id);
		System.out.println("비밀번호 : "+pwd);

		try {
			//로그인 성공
			//로그인 성공 암호화
			if(loginMember != null && bcryptPasswordEncoder.matches(pwd, loginMember.getUser_pwd()) && loginMember.getLogin_ok().equals("Y")) {
				//로그인 제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
					
				session.setAttribute("loginMember", loginMember);
				status.setComplete();
					
				viewName = "common/main";
			}
				//로그인 성공 비암호화 (로그인 하면 비밀번호 암호화로 변경 시켜놓게 해놓음)
//				if(loginMember != null && loginMember.getUser_pwd().equals(pwd) && loginMember.getLogin_ok().equals("Y")) {
//					//패스워드 암호화 처리(주석으로 조절)
//					loginMember.setUser_pwd(bcryptPasswordEncoder.encode(loginMember.getUser_pwd()));
//				    memberService.updatePwdEncoding(loginMember);
//					//로그인 제한 스택 초기화
//				    loginMember.setLogin_stack(0);
//					memberService.updateLoginStack(loginMember);
//	
//					session.setAttribute("loginMember", loginMember);
//					viewName = "common/main";
//				}

			//비밀번호 입력 실패 로그인 제한
			else if(loginMember.getLogin_stack() >= 5 ) {
				//제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
				//로그인 제한 부여
				loginMember.setLogin_ok("N");
				memberService.updateLoginOk(loginMember);
					
				model.addAttribute("message2", "로그인 제한");
				model.addAttribute("message3", "관리자 이메일로 문의해주세요");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 제한자 로그인 시도시
			else if(loginMember.getLogin_ok().equals("N")) {
				model.addAttribute("message2", "로그인 제한");
				model.addAttribute("message3", "관리자 이메일로 문의해주세요");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 실패
			else {
				//제한 스택 부여
				System.out.println("로그인 아이디: "+loginMember.getUser_id());
				System.out.println("로그인 스택: "+loginMember.getLogin_stack());
				loginMember.setLogin_stack(loginMember.getLogin_stack()+1);
				memberService.updateLoginStack(loginMember);
		
				model.addAttribute("message", "비밀번호 불일치");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			}catch(Exception e){
				model.addAttribute("message", "등록되지 않은 아이디입니다.");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			
			return viewName;
		}
	
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		//로그인할 때 생성한 세션객체를 없앰
		HttpSession session = request.getSession(false);
		//세션 객체가 있으면, 리턴받음
		//세션 객체가 없으면, null 리턴됨
		if(session != null) {
			session.invalidate();  //해당 세션객체 없앰
			return "common/main";
		}else {
			model.addAttribute("sessionout", "로그인 세션 만료");
			return "common/commonview";
		}
	}
	
}