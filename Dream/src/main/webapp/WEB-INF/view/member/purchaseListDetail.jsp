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
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/purchaseListDetail.css" />
<link rel="stylesheet" href="<%=ctxPath%>/css/sidebar.css">

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%=ctxPath%>/js/purchaseListDetail.js"></script>



<div id="div_purchaseListDetail" class="mt-4">
	<%-- 내용물 시작 --%>

	<%-------------------- 사이드바 시작 ----------------------%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("div#shipping_cnt_left").trigger("click");

			/* 사이드바 script 시작 */
			$("div.category-section > ul > li").click(function(e) {
				//  클릭할 경우 글자 css 변경
				alert("클릭됨.");
				$("div.category-section > ul > li > a").css({
					"font-weight" : "",
					"color" : ""
				});
				$(e.target).css({
					"font-weight" : "700",
					"color" : "black"
				});
			});
			/* 사이드바 script 끝  */

		});// end of $(document).ready(function()----------------------------------
	</script>


	</head>
	<body>

		<%-- 내용물 시작 --%>

		<%-------------------- 사이드바 시작 ----------------------%>
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
		</div>
		<%-------------------- 사이드바 끝 ----------------------%>
	<body>
		<div id="content" class="container">


			<%-- 구매내역 상세보기 제목 시작 --%>
			<div id="detail_title">
				<button type="button">뒤로가기 버튼</button>
				<h2>구매내역</h2>
				<button type="button">목록보기 버튼</button>
			</div>
			<%-- 구매내역 상세보기 제목 끝 --%>


			<%-- 구매내역 상세보기 제품 시작 --%>
			<div id="product_info">
				<img class="product_img" src="./title-icon.png" alt="..." />
				<div id="product" style="margin-left: 10px;">
					<div id="div_product_name">침대는 영어로 bed침대는 영어로 bed침대는 영어로
						bed침대는 영어로 bed침대는 영어로 bed</div>
					<div id="div_purchase_cnt">구매 수량 : 300개</div>
				</div>
			</div>
			<button type="button" id="product_detail">상품 상세보기</button>
			<%-- 구매내역 상세보기 제품 끝 --%>


			<%-- 진행상황 시작 --%>
			<div id="progress">
				<div id="progress_title">진행 상황</div>
				<div id="progressDetail">
					<div id="shipping_ready">배송준비중</div>
					<div id="shipping_now">배송중</div>
					<div id="shipping_end">배송완료</div>
				</div>
			</div>
			<%-- 진행상황 끝 --%>

			<div id="price">
				<div id="price_title">총 정산금액</div>
				<div id="div_price">369,000원</div>
			</div>

			<div id="price_detail">
				<table id="table_detail">
					<tr>
						<%-- 첫번째 줄 시작 --%>
						<td class="td_title">판매가</td>
						<td class="td_content">369,000원</td>
					</tr>
					<%-- 첫번째 줄 끝 --%>
					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">배송비</td>
						<td class="td_content">3,000원</td>
					</tr>
					<%-- 두번째 줄 끝 --%>
					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">적립포인트</td>
						<td class="td_content">1000 point</td>
					</tr>
					<%-- 두번째 줄 끝 --%>
				</table>
			</div>


			<div id="price_detail">
				<table id="table_detail">

					<tr>
						<%-- 첫번째 줄 시작 --%>
						<td class="td_title">거래일시</td>
						<td class="td_content">20/08/12 17:35</td>
					</tr>
					<%-- 첫번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">받는사람</td>
						<td class="td_content">3,000원</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">휴대폰번호</td>
						<td class="td_content">010-9***-*305</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">주소</td>
						<td class="td_content">주소는 address + detail_addressasdfasdf</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

				</table>
			</div>
		</div>

	</body>


	<%--footer 호출 --%>
	<jsp:include page="/WEB-INF/view/footer.jsp" />