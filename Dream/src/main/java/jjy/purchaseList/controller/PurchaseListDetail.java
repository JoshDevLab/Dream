package jjy.purchaseList.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jjy.purchase.model.*;

public class PurchaseListDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid"); // 사용자 아이디 
		
		String order_num = request.getParameter("ordernum"); // 주문번호
//		String fk_address_num  = request.getParameter("fk_address_num "); // 배송지 일련번호
		
//		System.out.println("확인용 로그인된 사용자 =>"+ userid);
//		System.out.println("확인용 order_num => "+ order_num);
		
		InterPurchaseListDAO purchaseDAO = new PurchaseListDAO();  // tbl_purchaseList
		PurchaseListDTO purchaseDTO = new PurchaseListDTO();       // tbl_purchaseList
		
		
		Map<String, String> purchaseMap = new HashMap<>();
		purchaseMap.put("userid", userid); // 사용자아이디
		purchaseMap.put("order_num", order_num); // 주문일련번호
//		purchaseMap.put("fk_address_num", fk_address_num); // 배송지일련번호 
		
		// 배송지 일련번호 넘겨서 주소, 상세주소 알아오기
		purchaseDTO = purchaseDAO.getDetailPurchaseList(order_num);
		
		int buy_cnt = purchaseDTO.getBuy_cnt(); // 구매수량
		int shipping = purchaseDTO.getShipping(); // 배송상태
		String buy_date = purchaseDTO.getBuy_date(); // 구매일자 
		
		int product_num = purchaseDTO.getProdDTO().getProduct_num(); // 제품번호
		
		String product_name = purchaseDTO.getProdDTO().getProduct_name(); // 제품명 
		String product_image = purchaseDTO.getProdDTO().getProduct_image(); //제품 이미지 
		float discount_rate = purchaseDTO.getProdDTO().getDiscount_rate(); // 할인율
		int price = purchaseDTO.getProdDTO().getPrice(); // 제품 가격 
		
		String order_name = purchaseDTO.getAddressDTO().getOrder_name(); // 주문자 명
		String mobile = purchaseDTO.getAddressDTO().getMobile(); // 핸드폰번호 
		String address = purchaseDTO.getAddressDTO().getAddress(); // 주소
		String detail_address = purchaseDTO.getAddressDTO().getDetail_address(); // 상세주소

		address += detail_address;
		
		
		int sale_price = (int)(price - (price * discount_rate));
		int discount_price = (int)(price * discount_rate);
		int point = (int)(price*0.05);
		
		// 확인용 ///
		/*
		
		System.out.println("### 확인용 purchaseDTO 주문수량 => " + buy_cnt );
		System.out.println("### 확인용 purchaseDTO 배송상태 => " + shipping );
		System.out.println("### 확인용 purchaseDTO 구매일자 => " + buy_date );

		System.out.println("### 확인용 purchaseDTO 제품이름 => " + product_name );
		System.out.println("### 확인용 purchaseDTO 제품이미지 => " + product_image );
		System.out.println("### 확인용 purchaseDTO 할인율 => " + discount_rate );
		System.out.println("### 확인용 purchaseDTO 판매가 => " +  price);
		
		System.out.println("### 확인용 purchaseDTO 받는사람 => " + order_name );
		System.out.println("### 확인용 purchaseDTO 휴대폰번호 => " + mobile );
		System.out.println("### 확인용 purchaseDTO 주소 => " + address );
		System.out.println("### 확인용 purchaseDTO 상세주소 => " + detail_address );
		
		System.out.println("확인용 판매가 : "+  sale_price );
		System.out.println("확인용 포인트 : "+ point);
		
		*/
		
		request.setAttribute("buy_cnt", buy_cnt);
		request.setAttribute("shipping", shipping);
		request.setAttribute("buy_date", buy_date);
		
		System.out.println("product_num : "+product_num);
		
		request.setAttribute("product_num", product_num);
		request.setAttribute("product_name", product_name);
		request.setAttribute("product_image", product_image);
		request.setAttribute("discount_rate", discount_rate);
		request.setAttribute("discount_price", discount_price);
		request.setAttribute("price", price);
		
		
		request.setAttribute("point", point);
		request.setAttribute("sale_price", sale_price);
		
		request.setAttribute("order_name", order_name);
		request.setAttribute("mobile", mobile);
		request.setAttribute("address", address);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/view/member/purchaseListDetail.jsp");
		

	}

}
