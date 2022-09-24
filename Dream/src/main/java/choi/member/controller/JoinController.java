package choi.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import choi.member.model.InterMemberDAO;
import choi.member.model.MemberDAO;
import common.controller.AbstractController;

public class JoinController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("post".equalsIgnoreCase(method)) {	//"POST"요청인 경우
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			Map<String,String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("passwd", passwd);
			InterMemberDAO mdao = new MemberDAO();
			
			int n = mdao.memberJoin(paraMap);	//데이터베이스에 회원정보 insert 해주는 함수 호출
			
			if(n != 2) {	//DB에 저장하는게 실패한 경우
				System.out.println("DB저장 실패");
				super.setViewPage("/WEB-INF/view/error/join_error.jsp");
			}
			else {	//DB에 저장하는게 성공한 경우
				System.out.println("DB저장 성공");
				super.setViewPage("/WEB-INF/view/login/login.jsp");
			}
		}
		else {	//"GET"요청인 경우
			super.setViewPage("/WEB-INF/view/member/join.jsp");
		}
	}
}
