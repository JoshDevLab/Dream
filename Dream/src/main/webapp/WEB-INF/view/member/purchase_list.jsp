<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="jjy.purchase.model.*"%>

<%
	String ctxPath = request.getContextPath();
%>

<%--header 호출 --%>
<jsp:include page="/WEB-INF/view/header.jsp" />


<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/css/purchase_list.css" />
<link rel="stylesheet" href="<%=ctxPath%>/css/sidebar.css">

<%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/purchase_list.js" ></script>





<div id="purchase_list" class="mt-4">
<%-- 내용물 시작 --%>

<%-------------------- 사이드바 시작 ----------------------%>

<script>
   $(document).ready(function(){
	   $("div#shipping_cnt_left").trigger("click"); 
   });// end of $(document).ready(function()----------------------------------
</script>
	   <%--  
      /* 사이드바 script 시작 */
      $("div.category-section > ul > li").click(function(e){
         //  클릭할 경우 글자 css 변경
         alert("클릭됨.");
         $("div.category-section > ul > li > a").css({"font-weight":"","color":""});
         $(e.target).css({"font-weight":"700","color":"black"});
      });
      /* 사이드바 script 끝  */


	   


	<!-- 내용물 시작 -->

	<!-- 사이드바 시작 
	<div id="sidebar" class="sidebar ml-5" style="width: 180px;">
		<div>
			<h4 class="mb-4" style="font-weight: bold;">
				<a href="<%=ctxPath%>/member/mypage.dream">마이 페이지</a>
			</h4>

		</div>

		<div class="category-section mb-5">
			<h5 class="category-title font-weight-bold">쇼핑 정보</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>/member/buylist.dream">구매 내역</a></li>
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>/cart/cart.dream">관심 상품</a></li>
			</ul>
		</div>

		<div class="category-section">
			<h5 class="category-title font-weight-bold">내 정보</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>/member/myInfo.dream">프로필 정보</a></li>
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>#####">주소록</a></li>
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>######">결제정보</a></li>
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>/member/point.dream">포인트</a></li>
				<li class="nav-item"><a class="nav-link pl-0 color_gray"
					href="<%=ctxPath%>/member/membership.dream">멤버십 정보</a></li>
			</ul>
		</div>
	</div>-->
	<!-- 사이드바 끝 -->

--%>



		<%-------------------- 사이드바 끝 ----------------------%>
		
		
	<%-------------------- 사이드바 시작 ----------------------%>

	<%-- sidebar 호출 --%>
	<jsp:include page="/WEB-INF/view/sidebar.jsp" />

	<%-------------------- 사이드바 끝 ----------------------%>
		
		


		<%-- 구매내역 시작  --%>
		<div id="purchase" class="container">
			<form name="purchaseFrm">
				<div id="content_title">
					<strong style="font-size: 24px;">구매 내역</strong>
				</div>


				<%-- 상단 진행중, 종료 버튼 시작 --%>
				<div id="status_button">
					<input type="hidden" id="input_shipping" name="input_shipping" value="0" /> 
					<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}" readonly />

					<div id="shipping_cnt_left" class="shipping_cnt">
						<div id="sipping_count" class="purchase_count">${requestScope.orderCntMap.shipping}</div>
						<div id="shipping" class="shipping_status">진행중</div>
					</div>

					<div id="shipping_cnt_right" class="shipping_cnt">
						<div id="shipping_end_count" class="purchase_count">${requestScope.orderCntMap.shipping_end}</div>
						<div id="shipping_completed" class="shipping_status">종료</div>
					</div>

				</div>
				<%-- 상단 진행중, 종료 버튼 끝 --%>


				<%-- 기간조회 시작 --%>
				<div id="date_button" style="display: flex">
					<button type="button" id="two_month" class="btn_month">최근 2개월</button>
					<button type="button" id="four_month" class="btn_month">4개월</button>
					<button type="button" id="six_month" class="btn_month">6개월</button>

					<div id="from_date" class="input_date">
						<input type="text" name="start_date" id="start_date" style="width: 120px;"value =""></input>~
					</div>

					<div id="to_date" class="input_date">
						<input type="text" name="end_date" id="end_date" style="width: 120px;" value="">
					</div>

					<button type="button" id="search_simple">조회</button>
					<button type="button" id="search_date">기간조회</button>

				</div>
				<%-- 기간조회 끝 --%>



				<%-- 모바일 화면에서 기간 선택 시작 --%>
				<select name="month" id="select_month" class="container" >
					<option value="기간선택">기간선택</option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
				</select>
				<%-- 모바일 화면에서 기간 선택 끝 --%>

				<hr style="background-color: #ebebeb;">

				<div id="result" class="my-4">
					<ul>
						<li class="result_notice">한 번에 조회 가능한 기간은 최대 6개월입니다.</li>
						<li class="result_notice">기간별 조회 결과는 입찰일 기준으로 노출됩니다.</li>
					</ul>

					<%-- 구매일, 상태 버튼 시작 --%>
					<div id="result_buttons">
						<%-- 전체버튼 일단 비활성화 --%>
						<%-- <button id="total">전체 <i class="fa-sharp fa-solid fa-caret-down"></i></button> --%>

						<div id="sort">
							<%-- 여기 input 태그 name 은 테이블의 컬럼? 오름차순, 내림차순 여부 , 진행중, 상태 --%>
							<button type="button" id="btn_purchaseDate" class="result_detail">
								<input id="sort_date" name="sort" type="hidden" value="" />구매일<i class="fas fa-duotone fa-sort-up"></i>
							</button>
							<%-- <button type="button" id="btn_purchaseStatus" class="result_detail"><input id="sort_status" name="status" type="hidden" value="진행중"/> 상태<i class="fas fa-duotone fa-sort-up"></i></button>--%>
						</div>
					</div>
			</form>
			<%-- 구매일, 상태 버튼 끝 --%>



			<%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력  --%>
			<div id="no_result" class="text-center my-5" style="color: #22222280; font-size: 13;"></div>
			<%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력 끝  --%>

			<%-- 진행중 클릭시 보여줄 div --%>
			<div id="show_shipping"></div>

			<%-- 종료 클릭시 보여줄 div --%>
			<div id="show_shipping_completed"></div>
			
		<%-- 더보기 버튼 넣기 시작  --%>
			<button type="button" id="btnMoreHIT" value="">더보기</button>
			<span id="totalHITCount"></span>
            <span id="countHIT">0</span>

		</div>
		<%-- 구매내역 끝  --%>
</div>
<%-- 내용물 끝 --%>
</div>



<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />