package jjy.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jjy.member.model.*;

public class MembershipController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setViewPage("/WEB-INF/view/member/membership.jsp"); // 멤버십 페이지로 이동
		/*
		String method = request.getMethod();// "GET" or "POST"; 
		if("POST".equalsIgnoreCase(method)) { // "POST" 방식일 경우 
			
		}
		else // "GET" 방식일 경우
		{
		
		}
		*/
		
//		String message ="";
//		String loc ="";
//		
//		HttpSession session = request.getSession(); 
//		String loginuserid = (String)session.getAttribute("userid"); // 세션에 저장된 사용자 아이디 불러오기
//		
//		InterMemberDAO mdao = new MemberDAO();
//		Map<String, String> useridMap = new HashMap<>();
//		useridMap.put("loginuserid", loginuserid);
		
//		// 1. 멤버십 가입 여부 알아오기
//		MemberDTO loginUserInfo = mdao.selectOneUser(useridMap);
//		
//		System.out.println("loginUserInfo.getMembership() : "+ loginUserInfo.getMembership());
//		
//		// 2. 멤버십 가입이 안되어있는 경우 멤버십 가입 진행하기
//		int n = mdao.registMembership(useridMap);
		
		
		
		
	}

}
