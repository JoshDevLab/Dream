<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="jjy.purchase.model.*"%>

<%
String ctxPath = request.getContextPath();
%>

<%--header 호출 --%>
<jsp:include page="/WEB-INF/view/header.jsp" />


<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/css/purchaseListDetail.css" />
<link rel="stylesheet" href="<%=ctxPath%>/css/sidebar.css">

<%-- 직접만든 javascript --%>
<script type="text/javascript"
	src="<%=ctxPath%>/js/purchaseListDetail.js"></script>



<div id="div_purchaseListDetail" class="mt-4">
<script type="text/javascript">
${requestScope.shipping}

</script>



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

	<%-- 내용물 시작 --%>




	<div id="content" class="container" style="display: flex">
		<%--header 호출 --%>
		<jsp:include page="/WEB-INF/view/sidebar.jsp" />

		<div>
			<%-- 구매내역 상세보기 제목 시작 --%>
			<div id="detail_title">
				<button type="button">뒤로가기 버튼</button>
				<h2>구매내역</h2>
				<button type="button">목록보기 버튼</button>
			</div>
			<%-- 구매내역 상세보기 제목 끝 --%>


			<%-- 구매내역 상세보기 제품 시작 --%>
			<div id="product_info">
				<img class="product_img" src="<%=ctxPath %>/images/제품이미지/${requestScope.product_image}" alt="..." />
				<div id="product" style="margin-left: 10px;">
					<div id="div_product_name">${requestScope.product_name}</div>
					<div id="div_purchase_cnt">구매 수량 : ${requestScope.buy_cnt} 개</div>
				</div>
			</div>
			<button type="button" id="product_detail">상품 상세보기</button>
			<%-- 구매내역 상세보기 제품 끝 --%>


			<%-- 진행상황 시작 --%>
			<div id="progress">
				<div id="progress_title">진행 상황</div>
				<div id="progressDetail">
				
				<c:if test="${requestScope.shipping == 0}">
					<div id="shipping_ready" style="border-top: solid 3px black;">배송준비중</div>
					<div id="shipping_now" style="border-top: solid 3px #ebebeb;">배송중</div>
					<div id="shipping_end" style="border-top: solid 3px #ebebeb;">배송완료</div>
				</c:if>
				<c:if test="${requestScope.shipping == 1}">
					<div id="shipping_ready" style="border-top: solid 3px black;">배송준비중</div>
					<div id="shipping_now" style="border-top: solid 3px black;">배송중</div>
					<div id="shipping_end" style="border-top: solid 3px #ebebeb;">배송완료</div>
				
				</c:if>
				<c:if test="${requestScope.shipping == 2}">
					<div id="shipping_ready" style="border-top: solid 3px black;">배송준비중</div>
					<div id="shipping_now" style="border-top: solid 3px black;">배송중</div>
					<div id="shipping_end" style="border-top: solid 3px black;">배송완료</div>
				</c:if>
				<%-- 
					<div id="shipping_ready">배송준비중</div>
					<div id="shipping_now">배송중</div>
					<div id="shipping_end">배송완료</div>
					 --%>
				</div>
			</div>
			<%-- 진행상황 끝 --%>
			
			<div id="price">
				<div id="price_title">총 정산금액</div>
				<div id="div_price"><fmt:formatNumber value="${requestScope.price}" pattern="#,###"/>원</div>
			</div>

			<div id="price_detail">
				<table id="table_detail">
					<tr>
						<%-- 첫번째 줄 시작 --%>
						<td class="td_title">판매가</td>
						<td class="td_content"><fmt:formatNumber value="${requestScope.sale_price}" pattern="#,###"/>원</td>
					</tr>
					<%-- 첫번째 줄 끝 --%>
					<%--<tr>
						 두번째 줄 시작 
						<td class="td_title">배송비</td>
						<td class="td_content">3,000원</td>
					</tr>--%>
					<%-- 두번째 줄 끝 --%>
					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">적립포인트</td>
						<td class="td_content"><fmt:formatNumber value="${requestScope.point}" pattern="#,###"/> point</td>
					</tr>
					<%-- 두번째 줄 끝 --%>
				</table>
			</div>


			<div id="price_detail">
				<table id="table_detail">

					<tr>
						<%-- 첫번째 줄 시작 --%>
						<td class="td_title">거래일시</td>
						<td class="td_content">${requestScope.buy_date}</td>
					</tr>
					<%-- 첫번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">받는사람</td>
						<td class="td_content">${requestScope.order_name}</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">휴대폰번호</td>
						<td class="td_content">${requestScope.mobile}</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

					<tr>
						<%-- 두번째 줄 시작 --%>
						<td class="td_title">주소</td>
						<td class="td_content">${requestScope.address}</td>
					</tr>
					<%-- 두번째 줄 끝 --%>

				</table>
			</div>
		</div>
	</div>



	<%--footer 호출 --%>
	<jsp:include page="/WEB-INF/view/footer.jsp" />