<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath();
	//
%>


<style type="text/css">
div.modal-footer>button {
	width: 70px;
	border: none;
	height: 40px;
	border-radius: 10px;
	background-color: black;
	color:white;
}

div.modal-content {
	border-radius: 10px;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width:30%;
}

td#icon {
  padding:0;
}


input[type="checkbox"]{

width: 20px; /*Desired width*/

height: 20px; /*Desired height*/

cursor: pointer;


}
</style>
    
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





<%-- 회원관리페이지 코드 시작 --%>
<div class="container  d-flex">

   <jsp:include page="/WEB-INF/view/sidebar.jsp" />

  <table class="table table-hover">
  
  
  
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold; margin-top: 12px;">받은메세지 목록</h4></th>
       </tr>
       <tr class="bg-dark">
          <td id="title_check"><input type="checkbox"/></td>
           <td id="icon">
	 	 <!-- 자리맞추기용 td 자리  -->
	 	 </td>
          <td id="title"  style="margin-right: 40px;">제목</td>
         
          <td >받은날짜</td>
         
          
       </tr>
     </thead>
     <tbody>
    
	 
	 	<tr>
	 	 <td id="list_check" style="width:30px;">
	 	 <input type="checkbox"  style="margin-right: 10px;"/>	 	 
	 	 </td>
	 	 <td id="icon">
	 	  <!-- 아이콘 들어올 자리 --> 아이콘
	 	 </td>
	 	 
	 	 <td colspan="7" style=" font-weight: bold"  data-toggle="modal" data-target="#message_modal" data-dismiss="modal">조건에 맞는 회원이 없습니다.	 	   
	 	</td>
	 	 </tr>
	 
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









  <div class="modal" id="message_modal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title">받은메세지</h4>          
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="basic_check">
          	 제목 : 김진석 그는 신인가 ...<br><br>
          	 내용 : 김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!
          	 김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!김진석은 신이야!!!
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer layer_btn" id="pay_button">
           <button type="button" id="reply"  > 답장 </button>
           <button type="button" id="bye_modal"  data-dismiss="modal"> 닫기 </button>           
         </div>
      </div>
      
    </div>
  </div>  


<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />