package jjy.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jjy.purchase.model.InterPurchaseListDAO;
import jjy.purchase.model.PurchaseListDAO;
import jjy.purchase.model.PurchaseListDTO;

public class ShippingManagementUpdate extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String shipping = request.getParameter("shipping");
		String orderNum = request.getParameter("ordernum");
		
		System.out.println("확인용 +++ shipping" + shipping);
		orderNum = orderNum.replace("]", "");
		orderNum = orderNum.replace("[", "");
		orderNum = orderNum.replaceAll("\"", "");
		orderNum = orderNum.replaceAll("null", "");
		
		System.out.println("확인용 +++ ordernum" + orderNum);
		
		
		String[] orderNumList = orderNum.split(",");
		System.out.println(orderNumList.length);
		
		InterPurchaseListDAO pdao = new PurchaseListDAO();
		
		int result = pdao.updateShipping(shipping,orderNumList);
		
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result); // {n : 1}
		
		String json = jsonObj.toString();// "{n : 1}"
		request.setAttribute("json", json);
		
		/*
		for(int i = 0; i < orderNumList.length; i++) {
			System.out.println(" 확인용i " + orderNumList[i]);
		}
		*/
		
		super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");

	}

}
