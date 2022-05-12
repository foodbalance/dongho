package com.project.foodbalance.kakaomembercontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.foodbalance.kakaoservice.KakaoService;
import com.project.foodbalance.member.model.dao.MemberDao;
import com.project.foodbalance.member.model.service.MemberService;
import com.project.foodbalance.member.model.vo.Member;


@Controller
public class KakaoMemberController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private KakaoService ks;
	

	
	@RequestMapping(value="kakaologin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Member mb, HttpSession session, HttpServletRequest request) throws Exception {
		

		System.out.println("#########" + code);
		String access_Token = ks.getAccessToken(code);
		
		HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        
        String name = (String) userInfo.get("nickname");
        String id = (String) userInfo.get("email");
        
        if(ms.dupCheck(id) != null) {
        	mb = ms.dupCheck(id);
        }else {
        	mb.setUser_id(id);
        	mb.setUser_name(name);
        	if(ms.insertMember(mb) > 0) {
        		System.out.println("디비저장");
        	}else {
        		System.out.println("실패");
        	}
        }	
        
        
//        ms.insertMember(mb);
		
        session.setAttribute("loginMember", mb);
		return "common/main";
	
		
    	}

	
}
