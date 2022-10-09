package kim.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			HttpSession session = request.getSession();
			String loginuserid = (String) session.getAttribute("userid");

			if("GET".equalsIgnoreCase(method)) {	//method가 "GET" 일 때
				InterProductDAO pdao = new ProductDAO();
				// product_num 은 바뀔 수 있음
				
				try {
					
					
					
					ProductVO product = pdao.getDetail(loginuserid);
			
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/member/message.jsp");
					
				} catch(SQLException e) {
				    e.printStackTrace();
					super.setRedirect(true); 
				    super.setViewPage(request.getContextPath()+"/error.up");
				}
				
			}
			else {	//method가 "POST" 일 때
				
			}
			
					
		
			
			
			
			
			
			
			
			
			
		}
		
		


}
