<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath();
	//
%>
    
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/memberManage.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/memberManage.js" ></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		if("${requestScope.searchWord}" != "" ){
	         $("select#searchType").val("${requestScope.searchType}");
	         $("input#searchWord").val("${requestScope.searchWord}"); 
	    }
		
		if("${requestScope.searchType}" == "secession" || "${requestScope.searchType}" == "rest_member" 
		  || "${requestScope.searchType}" == "membership" ) {
			$("input#searchWord").css({'placeholder':'찾으시는 회원ID 입력'});
		}
		
	});
	
	function goSearch() {
		
		const frm = document.memberFrm;
		frm.action = "memberManage.dream";
		frm.method = "GET";
		frm.submit();
	}

</script>



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
     <c:if test="${not empty requestScope.memberList}">
	     <c:forEach var="mdto" items="${requestScope.memberList}" >
		     <tr onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream?userid='" style="cursor:pointer">
		         <td class="text-center">${mdto.userid}</td>
		         <td class="text-center">${mdto.username}</td>
		         <td class="text-center">${mdto.mobile}</td>
		         <td class="text-center">${mdto.joindate}</td>
		         <c:choose>
		         	<c:when test="${mdto.secession == 0}">
						<td class="text-center">X</td>
					</c:when>
		         	<c:otherwise>
		         		<td class="text-center">O</td>
		         	</c:otherwise>
		         </c:choose>
		         <c:choose>
		         	<c:when test="${mdto.rest_member == 0}">
						<td class="text-center">X</td>
					</c:when>
		         	<c:otherwise>
		         		<td class="text-center">O</td>
		         	</c:otherwise>
		         </c:choose>
		         <c:choose>
		         	<c:when test="${mdto.membership == 0}">
						<td class="text-center">X</td>
					</c:when>
		         	<c:otherwise>
		         		<td class="text-center">O</td>
		         	</c:otherwise>
		         </c:choose>
		      </tr>
	     </c:forEach>
	 </c:if>
	 <c:if test="${empty requestScope.memberList}">
	 	<tr> <td colspan="7" style="text-align: center; font-weight: bold">조건에 맞는 회원이 없습니다.</td> </tr>
	 </c:if>
     </tbody>
  </table>
  
  
  
<%------------------------ 페이지바 시작 ------------------------%>
  <nav aria-label="..." class="m-auto pt-2" id="section_page_bar">
	  <div style="display: flex; width: 80%">
		 <ul class="pagination" style="margin: auto">${requestScope.pageBar}</ul>
	  </div>
  </nav>
<%------------------------ 페이지바 끝 ------------------------%>


 <%-- 검색부분 시작 --%>
 <form name="memberFrm">
   <div id="search_area" class="d-flex m-auto pt-2">
     <select id="searchType" name="searchType">
       <option value="userid">아이디</option>
       <option value="username">회원명</option>
       <option value="mobile">핸드폰번호</option>
       <option value="joindate">가입일자</option>
       <option value="secession">탈퇴유무</option>
       <option value="membership">멤버쉽여부</option>
       <option value="rest_member">휴면여부</option>
     </select>
    <div id="memberIdSearch" class="d-flex ml-3">
      <div id="input_id">
        <input type="text" placeholder="검색어" id="searchWord" name="searchWord" class="rounded">
      </div>
      <div id="search_btn">
        <button type="button" class="btn btn-white" id="btn_search" onclick="goSearch();">
        		<i class="fas fa-xl fa-thin fa-magnifying-glass" style="" ></i>
        </button>
      </div>
    </div>
   </div>
 </form>
  
  
  <%-- 검색부분 끝 --%>
</div>
<%-- 회원관리페이지 코드 끝 --%>


<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />