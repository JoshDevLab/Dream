package jjy.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import jjy.member.model.InterMemberDAO;
import jjy.member.model.MemberDAO;
import jjy.member.model.MemberDTO;

public class MembershipRegistController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();// "GET" or "POST"; 
		if("POST".equalsIgnoreCase(method)) { // "POST" 방식일 경우 
			String message ="";
			String loc ="";
			
			HttpSession session = request.getSession(); 
			String loginuserid = (String)session.getAttribute("userid"); // 세션에 저장된 사용자 아이디 불러오기
			
			InterMemberDAO mdao = new MemberDAO();
			Map<String, String> useridMap = new HashMap<>();
			useridMap.put("loginuserid", loginuserid);
			
			
			// 1. 멤버십 가입 여부 알아오기 0: 미가입 1: 가입중 
			MemberDTO loginUserInfo = mdao.selectOneUser(loginuserid);
//			System.out.println("확인용 멤버십 가입 여부 : "+ loginUserInfo.getMembership());
			boolean b_membership;
			
			if(loginUserInfo.getMembership() == 1) { // 멤버십 가입
				b_membership = true;
			}
			else { // 멤버십 미가입 
				b_membership = false;
				int n = mdao.registMembership(useridMap);
			}
			
			// json 시작 // 
//			System.out.println(b_membership);
			JSONObject jsonObj = new JSONObject(); // {}
			jsonObj.put("b_membership", b_membership);     // {"isExists":true} 또는 {"isExists":false} 으로 만들어준다. 
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
			// System.out.println(">> 확인용 json => " + json);
			
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
			// json 끝 //
		}
		else // "GET" 방식일 경우
		{
		
		}
		

	}

}
