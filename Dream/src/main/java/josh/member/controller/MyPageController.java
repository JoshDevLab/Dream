package josh.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import josh.member.model.*;
import josh.purchase.model.PurchaseListDTO;

public class MyPageController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkLogin(request)) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
			
			InterMemberDAO mdao = new MemberDAO();
			MemberDTO mdto = mdao.selectOne(userid);
			
			request.setAttribute("mdto", mdto);
			
			HashMap<String, Integer> map = mdao.shippingCnt(userid);
			
			request.setAttribute("map", map);
			
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

}
