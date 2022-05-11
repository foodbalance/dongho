package com.project.foodbalance.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	//로그인
	public Member selectLogin(String user_id) {
		return session.selectOne("memberMapper.selectLogin", user_id);
	}
	
	//로그인시 스택 초기화
	public int updateLoginStack(Member member) {
		return session.update("memberMapper.updateLoginStack", member);
	}
	
	//로그인 제한 여부
	public int updateLoginOk(Member member) {
		return session.update("memberMapper.updateLoginOk", member);
	}
	
	//비밀번호 암호화
	public int updatePwdEncoding(Member member) {
		return session.update("memberMapper.updatePwdEncoding", member);
	}
	
	//회원가입
	public int insertMember(Member member) {
		return session.insert("memberMapper.insertMember", member);
	}
	
	//회원가입시 아이디 중복 체크
	public int selectDupCheckId(String user_id) {
		return session.selectOne("memberMapper.selectCheckId", user_id);
	}
	
	//네이버 로그인시 메일 체크
	public Member dupCheck(String user_email) {
		return session.selectOne("memberMapper.dupCheck", user_email);
	}
	
	//네이버  메일등록
	public Member selectUser(String user_email) {
		return session.selectOne("memberMapper.selectUser", user_email);
	}
	
	//회원수 조회
	public int selectListCount() {
		return session.selectOne("memberMapper.getListCount");
	}
	
	//회원조회
	public ArrayList<Member> selectList(Paging page) {
		List<Member> list = session.selectList("memberMapper.selectList", page);
		return (ArrayList<Member>)list;
	}
	
	//아이디로 검색시 총 목록갯수 조회
	public int searchLsitCount(String keyword) {
		return session.selectOne("memberMapper.searchListCount", keyword);
	}
	//아이디로 검색
	public ArrayList<Member> searchId(Paging page) {
		List<Member> list = session.selectList("memberMapper.searchId", page);
		return (ArrayList<Member>)list;
	}
	//로그인 가능여부로 총 목록갯수 조회
	public int searchOkListCount(String keyword) {
		return session.selectOne("memberMapper.searchOkListCount", keyword);
	}
	//로그인 가능여부로 검색
	public ArrayList<Member> selectSearchLoginOk(Paging page) {
		List<Member> list =session.selectList("memberMapper.selectSearchLoginOk", page);
		return (ArrayList<Member>)list;
	}
	//내정보 수정
	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	//회원탈퇴 아이디 찾기
	public Member selectMember(String user_id) {
		return session.selectOne("memberMapper.selectMember", user_id);
	}
	//회원삭제
	public int deleteMember(String user_id) {
		return session.delete("memberMapper.deleteMember", user_id);
	}
	
	//비밀번호 찾기 키워드
	public int selectCheckKeyword(String keyword) {
		return session.selectOne("memberMapper.selectCheckKeyword", keyword);
	}
	

}