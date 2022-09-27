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

		super.setViewPage("/WEB-INF/view/member/purchase_list.jsp");
		
//		HttpSession session = request.getSession();
//		String sessionUserid = (String) session.getAttribute("userid");
//		if (sessionUserid != null) {
//
//			String userid = request.getParameter("userid");
//
//			if (sessionUserid.equals(userid)) {
//
//				InterPurchaseListDAO pdao = new PurchaseListDAO();
//				PurchaseListDTO pdto = new PurchaseListDTO();
//				
//				List<PurchaseListDTO> purchaseList = pdao.allPurchaseList(userid);
//				
//				
//				request.setAttribute("pdto", pdto);
//
//				// super.setRedirect(false);
//				
//			}
//		}
//
//		else {
//			String message = "비정상적인 경로접근!!";
//			String loc = "javascript:history.back()";
//
//			request.setAttribute("message", message);
//			request.setAttribute("loc", loc);
//
//			// super.setRedirect(false);
//			super.setViewPage("/WEB-INF/msg.jsp");
//		}
//
	}

}
