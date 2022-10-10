package kim.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import kim.product.model.InterProductDAO;
import kim.product.model.ProductDAO;
import kim.product.model.ProductVO;

public class Message extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
			
			String method = request.getMethod();
			
			System.out.println(method);
			
			if("GET".equalsIgnoreCase(method)) {	//method가 "GET" 일 때
				InterProductDAO pdao = new ProductDAO();
				// product_num 은 바뀔 수 있음
				
				
				String productnum = request.getParameter("num");
				
				
				
					
					
			
					
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/member/message.jsp");
					
				
				
				
			}
			else {	//method가 "POST" 일 때
				
			}
			
					
		
			
			
			
			
			
			
			
			
			
		}
		
		


}
