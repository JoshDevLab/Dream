package choi.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class MemberDetail extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); 
		
		if("GET".equalsIgnoreCase(method)) { // method가 "GET"일 때 
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
			
			if(!"admin".equalsIgnoreCase(userid)) {	//get요청을 한 사용자가 관리자로 로그인중이 아니라면
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/index.dream");
			}
			else {	//관리자로 get요청을 하였다면 페이지 보여주기
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/admin/ad_member/memberDetail.jsp");
			}
			
		}
		
		
		
		else {	// method가 "POST"일 때 아마 
			
		}
		
	}

}
