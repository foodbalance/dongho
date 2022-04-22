package com.project.foodbalance.member.model.service;

import com.project.foodbalance.member.model.vo.Member;

public interface MemberService {

	Member selectLogin(String user_id);		//로그인
	int updateLoginStack(Member member);	//로그인시 스택 초기화
	int updateLoginOk(Member member);		//로그인 제한여부
	int updatePwdEncoding(Member member);	//비밀번호 암호화
}
