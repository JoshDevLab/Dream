<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	//
%>
    
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/memberDetail.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/memberDetail.js" ></script>

<%-- 회원관리상세보기페이지 코드 시작 --%>
<div class="container d-flex flex-column">
  <%---------------------------------------- 회원 상세보기 시작 -----------------------------------------%>
    <%-- 회원 DTO 한줄 뽑아오기 --%>
    <table class="table table-hover mt-4" id="member">
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold;">karina@gmail.com님 정보</h4></th>
       </tr>
       <tr class="bg-dark">
          <td class="text-center">아이디</td>
          <td class="text-center">회원명</td>
          <td class="text-center">핸드폰번호</td>
          <td class="text-center">가입일자</td>
          <td class="text-center">탈퇴유무</td>
          <td class="text-center">휴면유무</td>
          <td class="text-center">멤버쉽여부</td>
       </tr>
     </thead>
     <tbody>
       <tr>
         <td class="text-center">karina@gmail.com</td>
         <td class="text-center">장진영</td>
         <td class="text-center">01088665389</td>
         <td class="text-center">22/09/28</td>
         <td class="text-center">O</td>
         <td class="text-center">X</td>
         <td class="text-center">X</td>
       </tr>
     </tbody>
  </table>
  <%-- 회원 DTO 한줄 뽑아오기 끝 --%>
  
  
  <%-- 회원아이디를 가지고 구매내역 가져오기 시작 --%>
  <table class="table table-hover mt-4" id="buyList">
     <thead>
       <tr>
         <th colspan="5"><h6 style="font-weight:bold;">구매내역</h6></th>
       </tr>
       <tr class="bg-dark">
          <td class="text-center">주문번호</td>
          <td class="text-center">상품번호</td>
          <td class="text-center">주문수량</td>
          <td class="text-center">주문일자</td>
          <td class="text-center">배송현황</td>
       </tr>
     </thead>
     <tbody>
       <%-- 반복문 부분 --%>
       <tr>
         <td class="text-center">578</td>
         <td class="text-center">178</td>
         <td class="text-center">2</td>
         <td class="text-center">22/10/03</td>
         <td class="text-center">배송완료</td>
       </tr>
       <%-- 반복문 부분 --%>
       
       
       <%-- 2 --%>
       <tr>
         <td class="text-center">578</td>
         <td class="text-center">178</td>
         <td class="text-center">2</td>
         <td class="text-center">22/10/03</td>
         <td class="text-center">배송완료</td>
       </tr>
       
       
       
       <%-- 3 --%>
       <tr>
         <td class="text-center">578</td>
         <td class="text-center">178</td>
         <td class="text-center">2</td>
         <td class="text-center">22/10/03</td>
         <td class="text-center">배송완료</td>
       </tr>
       
       
       <%-- 4 --%>
       <tr>
         <td class="text-center">578</td>
         <td class="text-center">178</td>
         <td class="text-center">2</td>
         <td class="text-center">22/10/03</td>
         <td class="text-center">배송완료</td>
       </tr>
       <%-- 반복문 부분 --%>
     </tbody>
  </table>
  <%-- 회원아이디를 가지고 구매내역 가져오기 끝 --%>
  
  
  
  <%-- 회원아이디를 가지고 포인트 가져오기 시작 --%>
  <table class="table table-hover mt-4" id="buyList">
     <thead>
       <tr>
         <th colspan="5"><h6 style="font-weight:bold;">포인트 사용내역</h6></th>
       </tr>
       <tr class="bg-dark">
          <td class="text-center">잔여포인트</td>
          <td class="text-center">적립/차감</td>
          <td class="text-center">변동금액</td>
          <td class="text-center">포인트변동일자</td>
          <td class="text-center">변동여부</td>
       </tr>
     </thead>
     <tbody>
       <%-- 1 --%>
       <tr>
         <td class="text-center">200000</td>
         <td class="text-center">적립</td>
         <td class="text-center" style="color:blue;">+200000</td>
         <td class="text-center">22-01-04</td>
         <td class="text-center">신규가입</td>
       </tr>
       
       <%-- 2 --%>
       <tr>
         <td class="text-center">150000</td>
         <td class="text-center">차감</td>
         <td class="text-center" style="color:red;">-50000</td>
         <td class="text-center">22-01-05</td>
         <td class="text-center">구매</td>
       </tr>
       
       <%-- 3 --%>
       <tr>
         <td class="text-center">100000</td>
         <td class="text-center">차감</td>
         <td class="text-center" style="color:red;">-50000</td>
         <td class="text-center">22-01-06</td>
         <td class="text-center">구매</td>
       </tr>
       
       
       <%-- 4 --%>
       <tr>
         <td class="text-center">105000</td>
         <td class="text-center">적립</td>
         <td class="text-center" style="color:blue;">+5000</td>
         <td class="text-center">22-01-07</td>
         <td class="text-center">구매</td>
       </tr>
     </tbody>
  </table>
  <%-- 회원아이디를 가지고 포인트 가져오기 끝 --%>
  
  <div class="d-flex m-auto">
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom">수정</button>
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom">삭제</button>
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom">목록보기</button>
  </div>
  
  
  
  
  
  
  
  
  
  
    <%---------------------------------------- 회원 상세보기 끝 -----------------------------------------%>


</div>
<%-- 회원관리상세보기페이지 코드 끝 --%>








<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />