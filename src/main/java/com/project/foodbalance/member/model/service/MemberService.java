package com.project.foodbalance.member.model.service;

import java.util.ArrayList;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.member.model.vo.Member;

public interface MemberService {

	Member selectLogin(String user_id);		//로그인
	int updateLoginStack(Member member);	//로그인시 스택 초기화
	int updateLoginOk(Member member);		//로그인 제한여부
	int updatePwdEncoding(Member member);	//비밀번호 암호화
	int insertMember(Member member);		//회원가입
	int selectDupCheckId(String user_id);	//회원가입시 아이디 중복 체크
	
	Member dupCheck(String email);			//네이버 로그인시 메일 체크
	Member selectUser(String user_email);	//네이버 메일등록
	int selectListCount();					//회원수 검색
	ArrayList<Member> selectList(Paging page);//회원조회
	int searchListCount(String keyword);	//아이디로 검색시 총 목록갯수 조회
	ArrayList<Member> searchId(Paging page);//아이디로 검색
	int searchOkListCount(String keyword);	//로그인 가능여부로 총 목록갯수 조회
	ArrayList<Member> selectSearchLoginOk(Paging page);//로그인 가능여부로 검색
	int updateMember(Member member);		//내정보 수정
	Member selectMember(String user_id);	//회원탈퇴 회원 찾기
	int deleteMember(String user_id);		//회원삭제
	int selectCheckKeyword(String Keyword);	//비밀번호 찾기 키워드
	
	
}