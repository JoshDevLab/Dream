package kim.product.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import kim.member.model.MemberVO;
import kim.product.model.InterProductDAO;
import kim.product.model.ProductDAO;
import kim.product.model.ProductVO;


public class DetailProductController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		// product_num 은 바뀔 수 있음
		String product_num = request.getParameter("product_num");
		
		try {

			ProductVO product = pdao.getDetail(product_num);
			
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			  
			session.setAttribute("product", product);
			
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/product/detail.dream?product_no="+product.getProduct_num());
			
		} catch(SQLException e) {
		    e.printStackTrace();
			super.setRedirect(true); 
		    super.setViewPage(request.getContextPath()+"/error.up");
		}
		
	
		
		
		
		
		
		
		
		
		
	}
	
	
	

}
