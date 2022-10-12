package kim.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import kim.member.model.InterMemberDAO;
import kim.member.model.MemberDAO;

public class deletemessage extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod(); // "GET" 또는 "POST"
		HttpSession session = request.getSession();
		String fk_sender_userid = (String) session.getAttribute("userid");

		if("POST".equalsIgnoreCase(method)) {
			
	
			String messageno = request.getParameter("messageno");
			
			InterMemberDAO mdao = new MemberDAO();
			
			int n = mdao.deletemessage(messageno);
			
			JSONObject jsonObj = new JSONObject();
			
			// 꼬우면 그냥 msg 띄우고 성공! 실패! 하고 다시 원래페이지로 보내도 되긴함
			jsonObj.put("success", n);     
			
			String json = jsonObj.toString(); 
			
			request.setAttribute("json", json);
			
			System.out.println(json);
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/jsonview.jsp");
		}	
	}

}
