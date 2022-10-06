package choi.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class QnaWrite extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) { //요청방식이 "GET"일 때 
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/admin/ad_notice/qna_write.jsp");
		}
		else {	//요청방식이 "POST"일 때 
			
		}
		
	}

}
