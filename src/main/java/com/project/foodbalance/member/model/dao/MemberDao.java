package com.project.foodbalance.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
	
	
	
}
