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
		
		 $("#date_button").hide();
		
         $("select#searchType").val("${requestScope.searchType}");
         $("input#searchWord").val("${requestScope.searchWord}"); 
	    
		
		if("${requestScope.searchType}" == "joindate" ) {
			$("#start_date").val("${requestScope.start_date}");
			$("#end_date").val("${requestScope.end_date}");
			$("#date_button").show();
		}
		
		if("${requestScope.searchType}" == "secession" || "${requestScope.searchType}" == "rest_member" 
		  || "${requestScope.searchType}" == "membership" ) {
			$("input#searchWord").css({'placeholder':'찾으시는 회원ID 입력'});
		}
		
		
		$("#searchType").change(function() {
			const searchType = $("#searchType").val();
			
			if(searchType == 'joindate') {
				$("#end_date").val(new Date().toISOString().substring(0, 10));
				$("#date_button").show();
			}
			else {
				$("#date_button").hide();
			}
		});
		
	});
	
	function goSearch() {
		
		const searchType = $("#searchType").val();
		
		if(searchType == 'joindate') {
			if( $("#start_date").val() == '' || $("#end_date").val() == '' ) {
				alert("시작날짜와 마지막날짜는 둘다 입력해야 합니다.");
				return;
			}
			if($("#start_date").val() > new Date().toISOString().substring(0, 10)) {
				alert("시작날짜가 오늘날짜보다 작아야 합니다.");
				$("#start_date").val('');
				$("#start_date").focus();
				return;
			}
			if($("#start_date").val() > $("#end_date").val()) {
				alert("마지막 날짜가 시작날짜보다 빠를 수 없습니다.");
				return;
			}
		}
		
		const frm = document.memberFrm;
		frm.action = "memberManage.dream";
		frm.method = "GET";
		frm.submit();
	}

</script>

<div>



<%-- 회원관리페이지 코드 시작 --%>
<div class="container d-flex flex-column">



  <table class="table table-hover">
  
  <jsp:include page="/WEB-INF/view/sidebar.jsp" />
  
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold;">받은메세지 목록</h4></th>
       </tr>
       <tr class="bg-dark">
          <td ><input type="checkbox" style="margin-right: 10px;"/>제목</td>
          <td >받은날짜</td>
         
          
       </tr>
     </thead>
     <tbody>
     <c:if test="${not empty requestScope.memberList}">
	     <c:forEach var="mdto" items="${requestScope.memberList}" >
		     <tr onclick="location.href='<%= ctxPath%>/admin/memberDetail.dream?userid=${mdto.userid}'" style="cursor:pointer">
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
	 	<tr>
	 	 <td id="check">
	 	 <input type="checkbox"  style="margin-right: 10px;"/>
	 	 </td>
	 	 <td colspan="7" style=" font-weight: bold"  data-toggle="modal" data-target="#message_modal" data-dismiss="modal">조건에 맞는 회원이 없습니다.	 	   
	 	</td>
	 	 </tr>
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


 
  
  <%-- 검색부분 끝 --%>
</div>
<%-- 회원관리페이지 코드 끝 --%>


</div>






  <div class="modal" id="message_modal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div >
          <h2 class="modal-title">기본결제로<br>변경하시겠습니까?</h4>          
        </div>
        
        <!-- Modal body -->
        <div >
          <div id="basic_check">
          	 이미 진행 중인 거래를 포함하여 앞으로<br> 모든 거래의 결제가 해당카드로 변경됩니다.
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="layer_btn" id="pay_button">
           <button type="button" id="pay_btn" class="basic_cancel" data-dismiss="modal"> 취소 </button>
           <button type="button" id="pay_btn" class="basic_change"> 계속 변경 </button>
         </div>
      </div>
      
    </div>
  </div>  


<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />