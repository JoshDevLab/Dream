package jjy.purchaseList.controller;

import java.util.Calendar;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;

import common.controller.AbstractController;
import jjy.member.model.*;
import jjy.purchase.model.*;

public class PurchaseListJsonController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String sessionUserid = (String) session.getAttribute("userid");
		
		// 현재 날짜와 시간 구하기
		Calendar currentDate = Calendar.getInstance();
		
		int currentYear = currentDate.get(Calendar.YEAR);
		int currentMonth = currentDate.get(Calendar.MONTH)+1;
		int currentDay = currentDate.get(Calendar.DATE);
		
//		System.out.println("확인용 년/월/일" +currentYear+" "+currentMonth+" "+currentDay);
		

		if (sessionUserid != null) {

			String userid = request.getParameter("userid");

//			if (sessionUserid.equals(userid)) {

				InterPurchaseListDAO pdao = new PurchaseListDAO();
				
				// 전달할 시작일, 종료일, 배송상태, 정렬, userid 를 넣는 map
				Map<String,String> purchaseMap = new HashMap<>();

				userid = request.getParameter("userid");
				String start_date =  request.getParameter("start_date");
				String end_date = request.getParameter("end_date");
				String input_shipping = request.getParameter("input_shipping");
				String sort = request.getParameter("sort");
				
				// 맨처음 기본값 지정 //================================================= 
				if(start_date == null || start_date=="") {
					//2022/09/27
					start_date = currentYear+"/"+currentMonth+"/"+currentDay;
				}
				
				if(end_date == null || end_date=="") {
					end_date = currentYear+"/"+(currentMonth-2)+"/"+currentDay;
				}
				
				if(input_shipping == null|| input_shipping =="") {
					input_shipping="0";
				}
				
				if(sort == null || sort == "") {
					sort = "asc";
				}
				
				// 맨처음 기본값 지정 끝 //===============================================
				
				purchaseMap.put("userid", userid);
				purchaseMap.put("start_date", start_date);
				purchaseMap.put("end_date", end_date);
				purchaseMap.put("input_shipping", input_shipping);
				purchaseMap.put("sort", sort);
				
				// 확인용 ///////////////////////////////////////////////////
				System.out.println("================================");
				System.out.println("확인용"+start_date);
				System.out.println("확인용"+end_date);
				System.out.println("확인용"+input_shipping);
				System.out.println("확인용"+userid);
				System.out.println("확인용"+sort);
				System.out.println("=================================");
				// 확인용 ///////////////////////////////////////////////////
				
				
				List<PurchaseListDTO> purchaseList = pdao.allPurchaseList(purchaseMap);
				JSONArray jsonArray = new JSONArray(); // 배열로 선언 
				
				if( purchaseList.size() > 0) { // 조회한 구매내역이 있경우
					// select order_num, userid, B.product_num, buy_cnt , buy_date , shipping, product_name, product_image
					for( PurchaseListDTO pdto : purchaseList ) { // 구매내역 list의 개수만큼 반복
						JSONObject jsonObj = new JSONObject();   //  { }
						
						jsonObj.put("order_num",pdto.getOrder_num()); //주문일련번호
						jsonObj.put("product_num", pdto.getProduct_num() ); //제품번호
						jsonObj.put("buy_cnt", pdto.getBuy_cnt() ); //구매수량
						jsonObj.put("buy_date", pdto.getBuy_date() ); //구매일자
						jsonObj.put("shipping", pdto.getShipping() ); //배송상태
						jsonObj.put("product_name", pdto.getProdDTO().getProduct_name() ); //제품명
						jsonObj.put("product_image", pdto.getProdDTO().getProduct_image() ); //제품이미지
						
						jsonArray.put(jsonObj);
						
					}// end of for()--------------------------------
//					String json = jsonArray.toString(); 
					
					System.out.println(">> 확인용 json => " + jsonArray);
					request.setAttribute("json", jsonArray);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
					
				}
				else { // 조회된 구매내역이 없는경우
					String json = jsonArray.toString(); 
					
					request.setAttribute("json", json);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/jjyjsonview.jsp");
					
				}
				
				
				
		}
//			 super.setViewPage("/WEB-INF/view/member/purchase_list.jsp");

	}

}
