<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	//
%>
    
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/ad_memberManage.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/ad_memberManage.js" ></script>



<%-- 회원관리페이지 코드 시작 --%>
<div class="Main d-flex flex-column">
  <table class="table table-hover">
     <thead>
       <tr>
         <th><h4 style="font-weight:bold;">공지사항</h4></th>
       </tr>
     </thead>
     <tbody>
       <c:forEach var="member" items="${requestScope.memberList}">
       <tr>
         <td onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream'" style="cursor:pointer"><span></span></td>
       </tr>
       </c:forEach>
     </tbody>
  </table>
</div>
<%-- 회원관리페이지 코드 끝 --%>