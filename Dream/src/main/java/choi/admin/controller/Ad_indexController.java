package choi.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Ad_indexController extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {	//method가 "POST"일 때 
			
		}
		else {	//method가 "GET"일 때 
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/admin/ad_index.jsp");
		}
		
	}

}
