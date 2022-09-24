package jjy.login.controller;

import java.util.*;
import jjy.login.model.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LoginController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*
		String method = request.getContextPath(); // "GET" or "POST"
		
		if("POST".equalsIgnoreCase(method)) { //"POST" 방식일때
		
		}
		else{ // "GET" 방식일때
		
		}
		*/
		
		String userid = request.getParameter("userid"); // form 태그에서 입력받은 userid
		String passwd = request.getParameter("passwd"); // form 태그에서 입력받은 passwd
		
		String message = "";  // msg.jsp 에 전달할 문자열
		String loc = ""; //msg.jsp에 전달할 url 주소

		InterLoginDAO logindao = new LoginDAO();
		
		Map<String, String> userinfoMap = new HashMap<>(); // userid, passwd 를 각각의 키값으로 저장
		userinfoMap.put("userid", userid);
		userinfoMap.put("passwd", passwd);
		
		// 사용자 정보를 저장하는 객체(userid, passwd, update_passwd_date) 
		LoginDTO loginuser = logindao.selectOneUser(userinfoMap);
		
		super.setViewPage("/WEB-INF/view/login/login.jsp");
		
		if(loginuser != null) {
			// session 영역에 로그인 한 사용자 아이디(userid) 저장
			HttpSession session =  request.getSession();
			session.setAttribute("userid", userid);
			
			System.out.println("로그인 성공!");
			System.out.println("확인용 userid" + loginuser.getUserid());
			System.out.println("확인용 session에 저장된 아이디 "+session.getAttribute("userid"));
			
			super.setRedirect(true); // sendRedirect 방식으로 페이지 이동
			super.setViewPage(request.getContextPath()+"/index.dream"); // 시작 홈페이지로 이동
			
		}// end of if(loginuser != null) {}---------------------
		
	}
}
