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
		
		String method = request.getMethod();
		
		System.out.println(method);
		
		if("GET".equalsIgnoreCase(method)) {	//method가 "GET" 일 때
			InterProductDAO pdao = new ProductDAO();
			// product_num 은 바뀔 수 있음
			
			System.out.println("출발");
			String product_num = request.getParameter("num");
			System.out.println(product_num);
			
			try {
				System.out.println("3");
				ProductVO product = pdao.getDetail(product_num);
		
				request.setAttribute("pdNum", product.getProduct_num());
			
				request.setAttribute("pdImage", product.getProduct_image_array());
				request.setAttribute("pdName", product.getProduct_name());
				request.setAttribute("pdSize", product.getProduct_size());
				request.setAttribute("pdCnt", product.getProduct_cnt());
				request.setAttribute("product", product);
				
				
				System.out.println("img = "+product.getProduct_image_array());
				System.out.println("size ="+product.getProduct_size());
				System.out.println("cnt = "+product.getProduct_cnt());
			
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/product/product_detail.jsp");
				
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
