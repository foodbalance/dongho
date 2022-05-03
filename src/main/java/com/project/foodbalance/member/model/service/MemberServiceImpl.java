package com.project.foodbalance.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.member.model.dao.MemberDao;
import com.project.foodbalance.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired  //자동 의존성주입 처리됨 (자동 객체생성됨)
	private MemberDao memberDao;
	
	//로그인
	@Override
	public Member selectLogin(String user_id) {
		return memberDao.selectLogin(user_id);
	}

	//로그인시 스택 초기화
	@Override
	public int updateLoginStack(Member member) {
		return memberDao.updateLoginStack(member);
	}
	
	//로그인 제한 여부
	@Override
	public int updateLoginOk(Member member) {
		return memberDao.updateLoginOk(member);
	}
	
	//비밀번호 암호화
	@Override
	public int updatePwdEncoding(Member member) {
		return memberDao.updatePwdEncoding(member);
	}
	
	//회원가입
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	
	//회원가입시 아이디 중복 체크
	@Override
	public int selectDupCheckId(String user_id) {
		return memberDao.selectDupCheckId(user_id);
	}
	
	//네이버 로그인시 메일 체크
	@Override
	public Member dupCheck(String email) {
		return memberDao.dupCheck(email);
	}
	
	//네이버  메일조회
	@Override
	public Member selectUser(String user_email) {
		return memberDao.selectUser(user_email);
	}

	//회원수 검색
	@Override
	public int selectListCount() {
		return memberDao.selectListCount();
	}
	//회원조회
	@Override
	public ArrayList<Member> selectList(Paging page) {
		return memberDao.selectList(page);
	}

	//아이디로 검색시 총 목록갯수 조회
	@Override
	public int searchListCount(String keyword) {
		return memberDao.searchLsitCount(keyword);
	}
	
	//아이디로 검색
	@Override
	public ArrayList<Member> searchId(Paging page) {
		return memberDao.searchId(page);
	}

	//로그인 가능여부로 총 목록갯수 조회
	@Override
	public int searchOkListCount(String keyword) {
		return memberDao.searchOkListCount(keyword);
	}

	//로그인 가능여부로 검색
	@Override
	public ArrayList<Member> selectSearchLoginOk(Paging page) {
		return memberDao.selectSearchLoginOk(page);
	}
	
	//내정보 수정
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}
	
	//회원탈퇴 아이디 찾기
	@Override
	public Member selectMember(String user_id) {
		return memberDao.selectMember(user_id);
	}
	
	//회원삭제
	@Override
	public int deleteMember(String user_id) {
		return memberDao.deleteMember(user_id);		
	}
}
