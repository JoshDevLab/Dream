package jjy.login.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import jjy.login.model.*;
import jjy.member.model.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LoginController extends AbstractController {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod(); // "GET" or "POST"
//		System.out.println("## 확인용 ## method : "+method);
		String message = "";
		String loc = "";
		
		if("GET".equalsIgnoreCase(method)) { // "GET" 방식일때
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/login/login.jsp");
		}
		else { // "POST" 방식일때
			//////////////////////////////////////////////////////////////////////////////////////
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/login/login.jsp");

			String userid = request.getParameter("userid"); // form 태그에서 입력받은 userid
			String passwd = request.getParameter("passwd"); // form 태그에서 입력받은 passwd
			String client_ip = request.getRemoteAddr(); // 접속한 사용자의 ip 주소

			InterLoginDAO logindao = new LoginDAO();

			Map<String, String> userinfoMap = new HashMap<>(); // userid, passwd 를 각각의 키값으로 저장
			userinfoMap.put("userid", userid);
			userinfoMap.put("passwd", passwd);
			userinfoMap.put("client_ip", client_ip);

			// 사용자 정보를 저장하는 객체( userid , passwd , secession , rest_member ,update_passwd_date)
			LoginDTO loginuser = logindao.selectOneUser(userinfoMap);

			if (loginuser != null) { // 로그인 사용자 정보가 있는 경우

				//////////////////////////////////////////////////////////////////////////////////////////
				//////////////////////////////////////////////////////////////////////////////////////////
				// 만약 마지막 로그인 날짜가 현재로부터 1년이 지난경우 휴면유저 처리 시작
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String lastLoginDate = logindao.checkLastLoginDate(userid); // 로그인에 기록된 마지막 로그인날짜
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 현재날짜

				if (lastLoginDate == null) { // 만약 로그인 기록이 없는 경우
					lastLoginDate = logindao.checkRegistDate(userid);
				} else {
					lastLoginDate = lastLoginDate.substring(0, 11);
				}

//				System.out.println("확인용 마지막 로그인 날짜: "+lastLoginDate);
//				System.out.println("확인용 오늘 날짜 : "+today);

				Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(lastLoginDate);
				Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(today);

				long diffSec = (format2.getTime() - format1.getTime()) / 1000; // 초 차이
				long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

//				System.out.println("확인용 마지막 로그인 날짜로부터 "+diffDays + "일 차이");

				if (diffDays >= 365) {
					logindao.updateRestMember(userid);
				}
				// 만약 마지막 로그인 날짜가 현재로부터 1년이 지난경우 휴면유저 처리 끝
				//////////////////////////////////////////////////////////////////

				logindao.updateLoginDate(userinfoMap);// 로그인 기록
				int secession = Integer.parseInt(loginuser.getSecession()); // 탈퇴 유무
				int restMember = Integer.parseInt(loginuser.getRest_member()); // 휴면 유무

				if (secession == 1) { // 탈퇴 회원인 경우
//					System.out.println("##확인용## 탈퇴한 회원");

					message = "탈퇴회원입니다.";
					loc = request.getContextPath()+"/login/login.dream";

					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					// super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/msg.jsp");
					
				} else { // 탈퇴 회원이 아닌경우

					if (restMember == 1) { // 휴면 사용자인경우
//						System.out.println("##확인용## 로그인 실패 휴면 회원.");

						message = "휴면 회원입니다. 관리자에게 문의바랍니다.";
						loc = request.getContextPath()+"/login/login.dream";

						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						// super.setRedirect(false);
						super.setViewPage("/WEB-INF/view/msg.jsp");
						
					} else { // 휴면사용자가 아닌경우
//						System.out.println("확인용 암호변경 3개월 이상: "+loginuser.isRequirePwdChange());
						// 비밀번호 변경일을 받아 3개월 이상인 경우 alert 창 띄우기 
						if(loginuser.isRequirePwdChange()) {
							message = "비밀번호를 변경한지 3개월이 지났습니다.!";
							loc = request.getContextPath() + "/index.dream";
							
							// session 영역에 로그인 한 사용자 아이디(userid) 저장
							HttpSession session = request.getSession();
							session.setAttribute("userid", userid);
	
							System.out.println("확인용 로그인된 아이디 : " + loginuser.getUserid());
							System.out.println("확인용 session에 저장된 아이디 : " + session.getAttribute("userid"));
							

							request.setAttribute("message", message);
							request.setAttribute("loc", loc);
							// super.setRedirect(false);
							super.setViewPage("/WEB-INF/view/msg.jsp");
						}
						else {
							System.out.println("loginController 에서 출력 ## 확인용 ## 로그인 성공!");
							
							// 멤버십 가입 회원일경우 현재 날짜와 비교해서 한달 이상 지난경우 멤버십 해지 처리하기 

							InterMemberDAO mdao = new MemberDAO();
							System.out.println("확인용 userinfoMap: "+userinfoMap);
							
							MemberDTO mdto = new MemberDTO();
							
							mdto = mdao.selectOneUser(userinfoMap);
							System.out.println("확인용 mdto: "+mdto);
							if(mdto.getMembershipregistgap() > 1) {
								// 멤버십 가입 취소로 변경, 멤버십이 해지되었습니다. alert 출력 
								int result = mdao.deleteMembership(userinfoMap);
								// 확인용 
								if(result == 1) {
									System.out.println("확인용 멤버십 탈퇴처리됨.");
								}
								else {
									System.out.println("확인용 멤버십 탈퇴처리 오류발생");
								}
							}
							
							
							
							// 멤버십 가입 회원일경우 현재 날짜와 비교해서 한달 이상 지난경우 멤버십 해지 처리하기 
	
							// session 영역에 로그인 한 사용자 아이디(userid) 저장
							HttpSession session = request.getSession();
							session.setAttribute("userid", userid);
	
							System.out.println("확인용 userid" + loginuser.getUserid());
							System.out.println("확인용 session에 저장된 아이디 " + session.getAttribute("userid"));
	
							super.setRedirect(true); // sendRedirect 방식으로 페이지 이동
							super.setViewPage(request.getContextPath() + "/index.dream"); // 시작 홈페이지로 이동
						}
					}
				} // 탈퇴한 회원이 아닌경우 끝 ---------------------------------------------------------------------------------
			} // if (loginuser != null) {
		} // post else { // "POST" 방식일때 끝 ---------------------------------------------------------------- 
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {}-----------------------

} // end of public class LoginController extends AbstractController {}---------------------------
