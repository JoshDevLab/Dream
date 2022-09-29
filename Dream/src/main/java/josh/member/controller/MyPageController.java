package josh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import josh.member.model.*;

public class MyPageController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkLogin(request)) {
			HttpSession session = request.getSession();
			String sessionUserid = (String) session.getAttribute("userid");
			
			String userid = request.getParameter("userid");
			
			if(sessionUserid.equals(userid)) {
				
				InterMemberDAO mdao = new MemberDAO();
				MemberDTO mdto = mdao.selectOne(userid);
				
				request.setAttribute("mdto", mdto);
				
				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/member/mypage.jsp");
			}
			else {
				String message = "비정상적인 경로접근!!";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/joshmsg.jsp");
			}
		}
		else {
			// 로그인을 안 했으면
			String message = "회원정보를 수정하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
		
	}

}
