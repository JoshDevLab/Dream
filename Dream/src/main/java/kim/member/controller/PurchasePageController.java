package kim.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import kim.member.model.InterMemberDAO;
import kim.member.model.MemberDAO;
import kim.member.model.MemberVO;
import kim.product.model.InterProductDAO;
import kim.product.model.ProductDAO;
import kim.product.model.ProductVO;


public class PurchasePageController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); 
		
		if("GET".equalsIgnoreCase(method)) {
		// GET 방식이라면    
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/member/purchasePage.jsp");
		}
		else {
			// 필요한 값들 일단 정리
			System.out.println("data 도착!");
			System.out.println(request.getParameter("length"));
			System.out.println(request.getParameter("productNum"));
			int length = Integer.parseInt(request.getParameter("length")); 
			String productNum = request.getParameter("productNum");
			ArrayList<String>sizeArr = new ArrayList<String>();
			ArrayList<String>cntArr = new ArrayList<String>();
			
			for(int i=0; i<length ;i++) {
				sizeArr.add((String)request.getParameter("size"+i)); 
				cntArr.add((String)request.getParameter	("cnt"+i)); 
			}
			
			System.out.println("sizeArr"+sizeArr);
			System.out.println("cntArr"+cntArr);
			
			request.setAttribute("sizeArr", sizeArr);
			request.setAttribute("cntArr", cntArr);
			
			HttpSession session = request.getSession();
			String sessionUserid = (String) session.getAttribute("userid");
			System.out.println(sessionUserid);
			// memberVO 객체 하나로 드갈 예정
			InterMemberDAO mdao = new MemberDAO();
			MemberVO user = new MemberVO();
			// 일단 포인트 얼마 남았나 체크
			
			
			user = mdao.pointCheck(sessionUserid);
			
			request.setAttribute("user", user);
			System.out.println("fullPrice"+request.getParameter("fullPrice"));
			request.setAttribute("fullPrice",request.getParameter("fullPrice"));
			
			// 선택한 제품의 정보도 가져갈 예정
			
			InterProductDAO pdao = new ProductDAO();
			ProductVO product = pdao.getDetail(productNum);
			product.setOrder_product_size(sizeArr);
			product.setOrder_product_cnt(cntArr);
			
			System.out.println(product.getOrder_product_cnt());
			System.out.println(product.getOrder_product_size());
			
			
			
			request.setAttribute("product", product);
			
			
			
			
			super.setViewPage("/WEB-INF/view/member/purchasePage.jsp");
		}
	}

}
