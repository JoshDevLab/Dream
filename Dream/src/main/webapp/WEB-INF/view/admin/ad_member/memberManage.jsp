<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	//
%>
    
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/memberManage.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/memberManage.js" ></script>



<%-- 회원관리페이지 코드 시작 --%>
<div class="container d-flex flex-column">
  <table class="table table-hover">
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold;">회원목록</h4></th>
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
       <%-- 1 --%>
       <tr onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream?userid='" style="cursor:pointer">
         <td class="text-center">karina@gmail.com</td>
         <td class="text-center">장진영</td>
         <td class="text-center">01088665389</td>
         <td class="text-center">22/09/28</td>
         <td class="text-center">O</td>
         <td class="text-center">X</td>
         <td class="text-center">X</td>
       </tr>
       
       
       <%-- 2 --%>
       <tr onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream?userid='" style="cursor:pointer">
         <td class="text-center">karina@gmail.com</td>
         <td class="text-center">장진영</td>
         <td class="text-center">01088665389</td>
         <td class="text-center">22/09/28</td>
         <td class="text-center">O</td>
         <td class="text-center">X</td>
         <td class="text-center">X</td>
       </tr>
       
       <%-- 3 --%>
       <tr onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream?userid='" style="cursor:pointer">
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
  
  
  <nav aria-label="..." class="m-auto pt-2">
  <ul class="my pagination">
    <%-- 첫페이지로 이동버튼 --%>
    <li class="page-item">
      <a class="page-link" href="#">
      	<i class="fa-solid fa-angles-left"></i>
      </a>
    </li>
    
    <%-- 전페이지로 이동버튼 --%>
    <li class="page-item">
      <a class="page-link" href="#">
      	<i class="fa-solid fa-angle-left"></i>
      </a>
    </li>
    
    <%-- 페이지번호 시작--%>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <%-- 페이지번호 끝 --%>
    
    
    
    <%-- 다음페이지로 이동버튼 --%>
    <li class="page-item">
      <a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a>
    </li>
    
    
    
    <%-- 맨 끝페이지로 이동버튼 --%>
    <li class="page-item">
      <a class="page-link" href="#"><i class="fas fa-solid fa-angles-right"></i></a>
    </li>
  </ul>
</nav>


 <%-- 검색부분 시작 --%>
   <div id="search_area" class="d-flex m-auto pt-2">
     <select id="filter">
       <option>아이디</option>
       <option>회원명</option>
       <option>핸드폰번호</option>
       <option>가입일자</option>
       <option>탈퇴유무</option>
       <option>멤버쉽여부</option>
     </select>
    <div id="memberIdSearch" class="d-flex ml-3">
      <div id="input_id">
        <input type="text" placeholder="회원아이디" id="userid" name="userid" class="rounded">
      </div>
      <div id="search_btn">
        <button type="button" class="btn btn-white" id="btn_search"><i class="fas fa-xl fa-thin fa-magnifying-glass" style=""></i></button>
      </div>
    </div>
   </div>
 
  
  
  <%-- 검색부분 끝 --%>
</div>
<%-- 회원관리페이지 코드 끝 --%>