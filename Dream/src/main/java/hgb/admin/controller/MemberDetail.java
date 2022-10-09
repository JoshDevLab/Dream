package hgb.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hgb.member.model.InterMemberDAO;
import hgb.member.model.MemberDAO;
import hgb.member.model.MemberDTO;


public class MemberDetail extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ctxPath = request.getContextPath();
		
		if(super.checkLogin(request)) {
			
			HttpSession session = request.getSession();
			String userid = (String) (session.getAttribute("userid"));
			
			if("admin".equals(userid)) {
				
				userid = request.getParameter("userid");
				InterMemberDAO mdao = new MemberDAO();
				MemberDTO mdto = mdao.memberOneDetail(userid);
				
				request.setAttribute("mdto", mdto);
				
				// *** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 *** //
				String goBackURL = request.getParameter("goBackURL");
			//	System.out.println("~~~ 확인용 goBackURL => : " + goBackURL);
	     	//  ~~~ 확인용 goBackURL => : /member/memberList.up?sizePerPage=10 currentShowPageNo=8 searchType=name searchWord=정
				
				request.setAttribute("goBackURL", goBackURL);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/admin/ad_member/memberDetail.jsp");
			     
			}
			else { // admin 계정으로 진입한게 아닐때
				String message = "관리자 이외는 접근이 불가합니다.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	            super.setRedirect(false);
	            super.setViewPage("/WEB-INF/view/index.jsp");
			}
			
		}
		else { // 로그인을 하지 않고 진입했을때
			super.setRedirect(true);
	        super.setViewPage(ctxPath+"/login/login.dream");
		}
		
		
		
			
		
	}

}
