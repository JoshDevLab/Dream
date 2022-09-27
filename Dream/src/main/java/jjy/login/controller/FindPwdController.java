package jjy.login.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import jjy.login.model.*;

public class FindPwdController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 String method = request.getMethod(); 
		 
		 if("POST".equalsIgnoreCase(method)) { // "POST"방식
			 
			// json 에서 email, mobile 을 받아옴
			String userid = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			
			System.out.println("확인용 mobile"+mobile);
			System.out.println("확인용 email"+userid);
			
			Map<String, String> findPwdMap = new HashMap<>();
			findPwdMap.put("mobile", mobile);
			findPwdMap.put("userid", userid);
			
			InterLoginDAO logindao = new LoginDAO();
			boolean isExistUser = logindao.checkMobileEmail(findPwdMap);
			
			JSONObject jsonObj = new JSONObject(); //  {}
			jsonObj.put("isExistUser", isExistUser); // {"isExists":true} 또는 {"isExists":false} 으로 만들어준다.
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
			System.out.println(">> 확인용 json => " + json);
			
			request.setAttribute("json", json);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
			return;
//			if (isExistUser) { // 입력받은 mobile, email 에 해당하는 회원이 있는 경우
//				// 문자 발송
//				System.out.println("해당 회원이 존재합니다.");
//				super.setViewPage("/WEB-INF/view/login/findPwdReslt.jsp");
//				
//			} else { // 입력받은 mobile, email 에 해당하는 회원이 없는 경우
//						// alert 띄우기
//				System.out.println("해당 회원이 존재하지 않습니다.");
//			}
		 } 
		
		super.setViewPage("/WEB-INF/view/login/findPwd.jsp");
	}

}
