package jjy.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jjy.member.model.*;
import jjy.purchase.model.InterPurchaseListDAO;
import jjy.purchase.model.PurchaseListDAO;
import jjy.purchase.model.PurchaseListDTO;

public class BuyListController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String sessionUserid = (String) session.getAttribute("userid");

		if (sessionUserid != null) {

			String userid = request.getParameter("userid");

//			if (sessionUserid.equals(userid)) {

				InterPurchaseListDAO pdao = new PurchaseListDAO();
				PurchaseListDTO pdto = new PurchaseListDTO();

				List<PurchaseListDTO> purchaseList = pdao.allPurchaseList(userid);
				
				String start_date =  request.getParameter("start_date");
				String end_date = request.getParameter("end_date");
				String input_shipping = request.getParameter("input_shipping");
				String sort = request.getParameter("sort");
				userid = request.getParameter("userid");
				
				System.out.println(start_date);
				System.out.println(end_date);
				System.out.println(input_shipping);
				System.out.println(sort);
				System.out.println(userid);
				
				
				request.setAttribute("pdto", pdto);

				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/member/purchase_list.jsp");

//			} else {
//				String message = "비정상적인 경로접근!!";
//				String loc = "javascript:history.back()";
//
//				request.setAttribute("message", message);
//				request.setAttribute("loc", loc);
//
//				// super.setRedirect(false);
//				super.setViewPage("/WEB-INF/view/msg.jsp");
//			}
		}

	}

}
