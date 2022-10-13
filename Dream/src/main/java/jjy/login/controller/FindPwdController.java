package jjy.login.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import jjy.login.model.*;
import net.nurigo.java_sdk.api.Message;

public class FindPwdController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 String method = request.getMethod(); 
		 
		 if("POST".equalsIgnoreCase(method)) { // "POST"방식
			 
			String api_key = "NCS3QAJRVZXIPIX4"; // 발급받은 본인 API Key
			String api_secret = "XNCSM8KRACNOF4APKHFQXYDM3N9BSFVS";  // 발급받은 본인 API Secret

			Message coolsms = new Message(api_key, api_secret);
			
			String smsContent = "Dream 임시 비밀번호 [ "; // 랜덤 문자 + 숫자 + 특수문자 8자리 임시 비밀번호 발급  
			
			/////////////////////////////////////////////////////////////////////////////////////////
			// 임시 비밀번호 생성 
			Random rnd = new Random();
			char randchar = ' ';
			
			String tempPwd = "";
			
			for(int i=0; i<4; i++) {
				randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
				tempPwd += randchar;
			}// end of for--------------------------
			
			int randnum = 0;
			for(int i=0; i<4; i++) {
				randnum = rnd.nextInt(9 - 0 + 1) + 0;
				tempPwd += randnum;
			}// end of for--------------------------
			
			final char[] passwordTable =  { '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };
			tempPwd += passwordTable[rnd.nextInt(passwordTable.length)];
			smsContent += tempPwd; 
			smsContent += " ]입니다."; 
//			System.out.println("확인용 발급된 임시 비밀번호 => "+ smsContent);
//			System.out.println("확인용 발급된 임시 (findPwdMap.get(\"tempPwd\") => "+ tempPwd);
			///////////////////////////////////////////////////////////////////////////////////////////
			
			String userid = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			
//			System.out.println("확인용 mobile : "+mobile);
//			System.out.println("확인용 email : "+userid);
			
			HashMap<String, String> findPwdMap = new HashMap<>();
			findPwdMap.put("mobile", mobile);
			findPwdMap.put("userid", userid);
			findPwdMap.put("tempPwd",tempPwd);
			findPwdMap.put("smsContent",smsContent);
			
			InterLoginDAO logindao = new LoginDAO();
			boolean isExistUser = logindao.checkMobileEmail(findPwdMap);
			
			if(isExistUser) { // 이메일, 아이디에 일치하는 회원이 존재하는 경우 
				
				// == 4개 파라미터(to, from, type, text)는 필수사항이다. == 
				// 키값은 임의로 작성이 불가능하다.
		        HashMap<String, String> paraMap = new HashMap<>();
		        paraMap.put("to", mobile);          // 수신번호
		        paraMap.put("from", "01088665389"); // 발신번호(등록된 번호만 가능)
		                                            // 2020년 10월 16일 이후로 발신번호 사전등록제로 인해 등록된 발신번호로만 문자를 보내실 수 있습니다.
		        paraMap.put("type", "SMS");         // Message type ( SMS(단문), LMS(장문), MMS, ATA )
		        paraMap.put("text", smsContent);    // 문자내용  
		        
		        paraMap.put("app_version", "JAVA SDK v2.2"); // application name and version
		        paraMap.put("mode", "test"); // 'test' 모드. 실제로 발송되지 않으며 전송내역에 60 오류코드로 뜹니다. 차감된 캐쉬는 다음날 새벽에 충전 됩니다.
		        
		        JSONObject jsonObj = (JSONObject)coolsms.send(paraMap);
		        jsonObj.put("isExistUser", isExistUser);		        
		        String json = jsonObj.toString();
		        
		        // System.out.println("~~~~ 확인용 json => "+json);
		        
		        int updtePwdResult = logindao.updatePassword(findPwdMap);
		        
		        
		        request.setAttribute("json", json);
		        super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
				return;
			}
			else { // 이메일과 아이디가 일치하는 회원이 존재하지 않는 경우 
				JSONObject jsonObj2 = new JSONObject(); //  {}
				jsonObj2.put("isExistUser", isExistUser); // {"isExists":true} 또는 {"isExists":false} 으로 만들어준다.
				
				String json = jsonObj2.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
				// System.out.println(">> 확인용 json => " + json);
				
				request.setAttribute("json", json);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
				return;
			}
			
//			JSONObject jsonObj = new JSONObject(); //  {}
//			jsonObj.put("isExistUser", isExistUser); // {"isExists":true} 또는 {"isExists":false} 으로 만들어준다.
//			
//			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
//			System.out.println(">> 확인용 json => " + json);
//			
//			request.setAttribute("json", json);
			
		//	super.setRedirect(false);
			
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
