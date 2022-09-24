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

		/*
>>>>>>> refs/remotes/origin/main
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
			MemberDTO loginUserInfo = mdao.selectOneUser(useridMap);
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
			System.out.println(b_membership);
			JSONObject jsonObj = new JSONObject(); // {}
			jsonObj.put("b_membership", b_membership);     // {"isExists":true} 또는 {"isExists":false} 으로 만들어준다. 
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
//			System.out.println(">> 확인용 json => " + json);
			
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
			// json 시작 //
		}
		else // "GET" 방식일 경우
		{
		
		}
		
<<<<<<< HEAD
		
		 
=======
		HttpSession session = request.getSession(); 
		String loginuserid = (String)session.getAttribute("userid"); // 세션에 저장된 사용자 아이디 불러오기
>>>>>>> refs/remotes/origin/main
		
<<<<<<< HEAD
=======
		// json 시작 // 
		Map<String,String> useridMap = new HashMap<>();
		InterMemberDAO mdao = new MemberDAO();
		
		useridMap.put("loginuserid", loginuserid); // 세션영역에 있는 회원 아이디 Map에 저장
		
		MemberDTO loginuser = mdao.selectOneUser(useridMap);
		
		boolean isReigstedMembership; // json 으로 전달하기위한 boolean 변수 선언 (멤버십 가입 여부)
		
		if(loginuser.getMembership() == 1) {// 멤버십 가입중이라면 isReigstedMembership에 true 
			isReigstedMembership = true;
		}
		else { // 멤버십 가입중이라면 isReigstedMembership에 false 
			isReigstedMembership = false;
		}
		
		JSONObject jsonObj = new JSONObject(); 
		jsonObj.put("isReigstedMembership", isReigstedMembership); // {"isReigstedMembership":true} 또는 {"isReigstedMembership":false} 
		
		String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
		System.out.println(">> 확인용 json => " + json);
		// >> 확인용 json => {"isExists":true}
		// >> 확인용 json => {"isExists":false}
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/jjyjsonview.jsp");
		
		// json 끝 // 
		
		
		
		/*
		String message ="";
		String loc ="";
		
		InterMemberDAO mdao = new MemberDAO();
		Map<String, String> useridMap = new HashMap<>();
		useridMap.put("loginuserid", loginuserid);
>>>>>>> refs/remotes/origin/main
		
		
		
//		if(loginUserInfo.getMembership() == 1) { // 멤버십에 가입되어있는 회원이라면 
//			message = "이미 드림캐쳐 멤버십에 가입되어있습니다.";
//			loc =request.getContextPath()+"/member/mypage.dream";
//			
//			request.setAttribute("message", message);
//			request.setAttribute("loc", loc);
//			
//			super.setRedirect(false);
//			super.setViewPage("/WEB-INF/view/msg.jsp");
//			return; // 메소드 종료
//		}
//		else {
//			// 2. 멤버십 가입이 안되어있는 경우 멤버십 가입 진행하기
//			int n = mdao.registMembership(useridMap);
////			System.out.println("확인용 map에 담긴 userid :" +useridMap.get("loginuserid"));
//			
//			if(n == 1) {
//				message = "드림캐쳐 가입에 성공했습니다!";
//				loc =request.getContextPath()+"/member/mypage.dream";
//				
//				request.setAttribute("message", message);
//				request.setAttribute("loc", loc);
//				super.setRedirect(false);
//				super.setViewPage("/WEB-INF/view/msg.jsp");
//			}
//			else {
//				message = "드림캐쳐 가입에 실패했습니다. 다시 시도해주시기 바랍니다.";
//				loc =request.getContextPath()+"/member/mypage.dream";
//				
//				request.setAttribute("message", message);
//				request.setAttribute("loc", loc);
//				super.setRedirect(false);
//				super.setViewPage("/WEB-INF/view/msg.jsp");
//				return ;
//			}
//		}
		
		*/
		

	}

}
