package jjy.purchaseList.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import jjy.purchase.model.InterPurchaseListDAO;
import jjy.purchase.model.PurchaseListDAO;
import jjy.purchase.model.PurchaseListDTO;

public class PurchaseListView extends AbstractController {

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

			String userid = (String) session.getAttribute("userid");

//			if (sessionUserid.equals(userid)) {

				InterPurchaseListDAO pdao = new PurchaseListDAO();
				
				// 전달할 시작일, 종료일, 배송상태, 정렬, userid 를 넣는 map
				Map<String,String> purchaseMap = new HashMap<>();

				String start_date =  request.getParameter("start_date");
				String end_date = request.getParameter("end_date");
				String input_shipping = request.getParameter("input_shipping");
				String sort = request.getParameter("sort");
				String currentShowPageNo = request.getParameter("currentShowPageNo");
				
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
					System.out.println("확인용 view 시작일: "+start_date);
					System.out.println("확인용 view 종료일: "+end_date);
					System.out.println("확인용 view 배송상태: "+input_shipping);
					System.out.println("확인용 view 사용자 아이디: "+userid);
					System.out.println("확인용 view 정렬방식: "+sort);
					System.out.println("확인용 viewcurrentShowPageNo1: "+ currentShowPageNo);
					System.out.println("=================================");
					System.out.println("");
				// 확인용 ///////////////////////////////////////////////////
				
				
				// 페이징처리 시작 ###############################################################################
				
				// 페이징 처리를위한 총 페이지 수 알아오기
				int totalPage = pdao.getTotalPage(purchaseMap);
				System.out.println("확인용 조회해온 totalPage => "+totalPage);
				
				if(currentShowPageNo == null) {
					currentShowPageNo = "1";
				}
				
				// === "GET" 방식이므로 사용자가 주소창에서 currentShowPageNo에 
			    //     totalPageNo 보다 큰 값을 입력하여 장난친 경우에는 1페이지로 이동시키기 시작 ===//
			   if( Integer.parseInt(currentShowPageNo) > totalPage ) {
				   currentShowPageNo = "1"; // 값을 초기화 한 다음 Map 에 다시 넣어줘야 한다.
			   }
			   
			   System.out.println("확인용 currentShowPageNo2: "+ currentShowPageNo);
			   purchaseMap.put("currentShowPageNo", currentShowPageNo);
				
				// 페이징처리 끝 ###############################################################################
				
				
//				List<PurchaseListDTO> purchaseList = pdao.allPurchaseList(purchaseMap);
				// 페이징처리를 위한 구매내역 페이지 구해오기 
				List<PurchaseListDTO> pagingPurchaseList = pdao.selectPagingPurchaseList(purchaseMap);
				
				System.out.println("확인용 => "+ pagingPurchaseList);
				
						String pageBar = ""; // 21 22 23 24 25 26 27 28 29 30
						   
						int blockSize = 10; 
						// blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다.
						// 페이지바에 들어갈 페이지 개수 =>  1 2 3 4 5 6 7 8 9 10 (10개)
						   
						int loop = 1;
						// loop 는 1 부터 증가하여 1개 블럭을 이루는 페이지번호의 개수 ( 지금은 10개 )까지만 증가하는 용도이다. 증가 횟수
						   
						// !!!!! 다음은 pageNo(해당 페이지의 시작값) 를 구하는 공식이다. !!!! 
						// pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
						int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1 )/blockSize ) * blockSize + 1 ;
						
						////////////////////////////////////////////////////////////////////////////////////////
					
					
						
						// *** [맨처음][이전] 만들기 *** //
					   if(pageNo != 1) { //21이 마지막페이지인 경우 while문을 빠져나오고 22가 되면 다음을 붙이면 안된다.
						   pageBar += "<li class='page-item'><a class='page-link' href='buylist.dream?sizePerPage=10&currentShowPageNo=1'>[맨처음]</a></li>";
						   pageBar += "<li class='page-item'><a class='page-link' href='buylist.dream?sizePerPage=10&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
					   }
					   
					   
					   while( !(loop > blockSize || pageNo > totalPage ) ) { // loop가 11이 되면 탈출
						   // 마지막 페이지에서는 21페이지 하나만 찍어줘야 하므로 pageNo > totalPage 조건을 추가한다. 22가 되면 탈출
						   
						   if( pageNo == Integer.parseInt(currentShowPageNo) ) { // 찍어주는 페이지와 보고자하는 페이지가 같다면
							   pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>";
							   // page-item , page-link 는 bootstrap.
						   }
						   else {
							   pageBar += "<li class='page-item'><a class='page-link' href='buylist.dream?sizePerPage=10&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
						   }
						   loop++;   // 1 2 3 4 5 6 7 8 9 10
						   
						   pageNo++; //  1  2  3  4  5  6  7  8  9 10
						   			 // 11 12 13 14 15 16 17 18 19 20
						   			 // 21 
						   			 // sizePerPage가 10일때 페이지바 이다. 
					   }// end of while---------------------------------
					   
					   
					   // *** [다음][마지막] 만들기 *** //
					   // while문을 빠져나올 때 
					   // 첫번째 블럭인(1  2  3  4  5  6  7  8  9 10 ) 경우 pageNo가 11 이고 
					   // 두번째 블럭인(11 12 13 14 15 16 17 18 19 20 ) 경우 pageNo가 21 이고 
					   // 세번째 블럭인(21 ) 경우 pageNo가 22 가 된다. 
					   
					   if( pageNo <= totalPage) { 
						   pageBar += "<li class='page-item'><a class='page-link' href='buylist.dream?sizePerPage=10&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
						   pageBar += "<li class='page-item'><a class='page-link' href='buylist.dream?sizePerPage=10&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
					   }
					   
					   
					// System.out.println("~~~~~~~~~~~~~~~~~~확인용 totalPage => "+totalPage);
					   // ~~~~~~~~~~~~~~~~~~확인용 totalPage => 21
					   System.out.println("pageBar : "+ pageBar);
					   request.setAttribute("pageBar", pageBar);
					
					   super.setViewPage("/WEB-INF/view/member/purchase_list.jsp");
					
		}
		
		
		
	}

}
