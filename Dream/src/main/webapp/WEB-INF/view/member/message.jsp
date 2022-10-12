<<<<<<< HEAD
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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/message.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/message.js" ></script>

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
      
      
      
      const check_length = $("input:checkbox[name='sub_check']").length;
      const Checkbox = $("input:checkbox[name='sub_check']");
      
      
      // 전체체크버튼 클릭
      $("input#checkAll").click(function (e) {
        
        const bool = $(e.target).prop("checked");
        Checkbox.prop("checked",bool);
        const checked_length = $("input:checkbox[name='sub_check']:checked").length;

        console.log(check_length);
        if(checked_length==check_length) {
         
          
        }
        else{
          
        }
      });
      
      
      
   // 그냥 버튼 체크시
      $("input#sub_check").click(function (e) {
         
        const checked_length = $("input:checkbox[name='sub_check']:checked").length;
               
        
        if(checked_length<check_length) {
          $("input#checkAll").prop("checked",false);
          
        }
        else if(checked_length==check_length) {
          $("input#checkAll").prop("checked",true);
          
        }
      });
      
   });
   
   
   
   
   
   
   
   
   
   


</script>





<%-- 회원관리페이지 코드 시작 --%>
<div class="container  d-flex">

   <jsp:include page="/WEB-INF/view/sidebar.jsp" />
   <div style="width:100%">
  <table class="table table-hover">
  
  
  
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold; margin-top: 12px;">받은메세지 목록</h4></th>
       </tr>
       <tr class="bg-dark">
          <td id="title_check"><input type="checkbox" id="checkAll"/></td>
           <td id="icon">
        <!-- 자리맞추기용 td 자리  -->
        </td>
          <td id="title"  colspan="7" style="margin-right: 40px;">제목</td>
         
          <td >받은날짜 </td>
         
          
       </tr>
     </thead>
     <tbody>
    
   <c:forEach var = "mvo"  items ="${printmessageList}"> 
    
        
        
        
        <tr>
        <td id="list_check" style="width:30px;">
        <input type="checkbox" id="sub_check" name="sub_check" style="margin-right: 10px;"/>        
        </td>
        <td id="icon" style="width: 30px;">
           <c:if test="${mvo.read_check==0}">
              <i class="fa-solid fa-envelope"></i>
           </c:if>
           
           <c:if test="${mvo.read_check==1}">
              <i class="fa-solid fa-envelope-open"></i>
           </c:if>
       
        </td>
        
        <td colspan="7" style=" font-weight: bold"  data-toggle="modal" data-target="#message_modal" data-dismiss="modal">
           ${mvo.title}         
          </td>
          <td>
             ${mvo.shipping}
             <input type="text" id="messageno" name="messageno" value="${mvo.messageno}"/> 
             <input type="text" id="fk_sender_userid" name="fk_sender_userid" value="${mvo.fk_sender_userid}"/>   
             <input type="text" id="fk_Recipient_userid" name="fk_Recipient_userid" value="${mvo.fk_Recipient_userid}"/>   
          </td>
       </tr>
     </c:forEach>
    
     </tbody>
  </table>
  
  
  
<%------------------------ 페이지바 시작 ------------------------%>
  <c:if test="${not empty requestScope.printmessageList}">
               
        <nav aria-label="...">
		    <ul class="my pagination pagination-md justify-content-center mt-5">
		    	<%-- 첫페이지로 이동버튼 --%>
		    	<c:if test="${requestScope.page > requestScope.display_page}">
		    	<li class="page-item">
			      <a class="page-link" onclick = "goPage(1)">
			      	<i class="fa-solid fa-angles-left"></i>
			      </a>
			    </li>
			    
			    
			    <%-- 전페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link"  onclick = "goPage(${requestScope.startPage-1})">
			      	<i class="fa-solid fa-angle-left"></i>
			      </a>
			    </li>
			    </c:if>
			    
			    <%-- 페이지번호 시작--%>
			    <c:forEach begin="${requestScope.startPage-1}" end="${requestScope.endPage-1}" varStatus="i">
                <c:if test="${requestScope.page == (requestScope.startPage+i.count-1)}">
                <li class="page-item active" aria-current="page">
			    	<a id = "firstPage" class="page-link" onclick = "goPage(${requestScope.startPage+i.count-1})" >${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                
                <c:if test="${requestScope.page != (requestScope.startPage+i.count-1)}">
                <li class="page-item">
			    	<a class="page-link" onclick = "goPage(${requestScope.startPage+i.count-1})">${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                </c:forEach>
                <%-- 페이지번호 끝 --%>
                
                
                
			    <%-- 다음페이지로 이동버튼 --%>
			    <c:if test="${!(requestScope.last_display_page)}">
			    <li class="page-item">
			      <a class="page-link" onclick = "goPage(${requestScope.startPage+requestScope.display_page})"><i class="fa-solid fa-angle-right"></i></a>
			    </li>
			    <%-- 맨 끝페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link" onclick = "goPage(${requestScope.totalPage})"><i class="fas fa-solid fa-angles-right"></i></a>
			    </li>
			    </c:if>
		  	</ul>
		</nav>
		
		
		</c:if>	
<%------------------------ 페이지바 끝 ------------------------%>
</div>

             
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
=======
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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/message.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/message.js" ></script>

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
      
      
      
      const check_length = $("input:checkbox[name='sub_check']").length;
      const Checkbox = $("input:checkbox[name='sub_check']");
      
      
      // 전체체크버튼 클릭
      $("input#checkAll").click(function (e) {
        
        const bool = $(e.target).prop("checked");
        Checkbox.prop("checked",bool);
        const checked_length = $("input:checkbox[name='sub_check']:checked").length;

        console.log(check_length);
        if(checked_length==check_length) {
         
          
        }
        else{
          
        }
      });
      
      
      
   // 그냥 버튼 체크시
      $("input#sub_check").click(function (e) {
         
        const checked_length = $("input:checkbox[name='sub_check']:checked").length;
               
        
        if(checked_length<check_length) {
          $("input#checkAll").prop("checked",false);
          
        }
        else if(checked_length==check_length) {
          $("input#checkAll").prop("checked",true);
          
        }
      });
      
   });
   
   
   
   
   
   
   
   
   
   


</script>





<%-- 회원관리페이지 코드 시작 --%>
<div class="container  d-flex">

   <jsp:include page="/WEB-INF/view/sidebar.jsp" />
   <div style="width:100%">
  <table class="table table-hover">
  
  
  
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold; margin-top: 12px;">받은메세지 목록</h4></th>
       </tr>
       <tr class="bg-dark">
          <td id="title_check"><input type="checkbox" id="checkAll"/></td>
           <td id="icon">
        <!-- 자리맞추기용 td 자리  -->
        </td>
          <td id="title"  colspan="7" style="margin-right: 40px;">제목</td>
         
          <td >받은날짜 </td>
         
          
       </tr>
     </thead>
     <tbody>
    
   <c:forEach var = "mvo"  items ="${printmessageList}"> 
    
        
        
        
        <tr>
        <td id="list_check" style="width:30px;">
        <input type="checkbox" id="sub_check" name="sub_check" style="margin-right: 10px;"/>        
        </td>
        <td id="icon" style="width: 30px;">
           <c:if test="${mvo.read_check==0}">
              <i class="fa-solid fa-envelope"></i>
           </c:if>
           
           <c:if test="${mvo.read_check==1}">
              <i class="fa-solid fa-envelope-open"></i>
           </c:if>
       
        </td>
        
        <td colspan="7" style=" font-weight: bold"  data-toggle="modal" data-target="#message_modal" data-dismiss="modal">
           ${mvo.title}         
          </td>
          <td>
             ${mvo.shipping}
             <input type="text" id="messageno" name="messageno" value="${mvo.messageno}"/> 
             <input type="text" id="fk_sender_userid" name="fk_sender_userid" value="${mvo.fk_sender_userid}"/>   
             <input type="text" id="fk_Recipient_userid" name="fk_Recipient_userid" value="${mvo.fk_Recipient_userid}"/>   
          </td>
       </tr>
     </c:forEach>
    
     </tbody>
  </table>
  
  
  
<%------------------------ 페이지바 시작 ------------------------%>
  <c:if test="${not empty requestScope.printmessageList}">
               
        <nav aria-label="...">
		    <ul class="my pagination pagination-md justify-content-center mt-5">
		    	<%-- 첫페이지로 이동버튼 --%>
		    	<c:if test="${requestScope.page > requestScope.display_page}">
		    	<li class="page-item">
			      <a class="page-link" onclick = "goPage(1)">
			      	<i class="fa-solid fa-angles-left"></i>
			      </a>
			    </li>
			    
			    
			    <%-- 전페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link"  onclick = "goPage(${requestScope.startPage-1})">
			      	<i class="fa-solid fa-angle-left"></i>
			      </a>
			    </li>
			    </c:if>
			    
			    <%-- 페이지번호 시작--%>
			    <c:forEach begin="${requestScope.startPage-1}" end="${requestScope.endPage-1}" varStatus="i">
                <c:if test="${requestScope.page == (requestScope.startPage+i.count-1)}">
                <li class="page-item active" aria-current="page">
			    	<a id = "firstPage" class="page-link" onclick = "goPage(${requestScope.startPage+i.count-1})" >${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                
                <c:if test="${requestScope.page != (requestScope.startPage+i.count-1)}">
                <li class="page-item">
			    	<a class="page-link" onclick = "goPage(${requestScope.startPage+i.count-1})">${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                </c:forEach>
                <%-- 페이지번호 끝 --%>
                
                
                
			    <%-- 다음페이지로 이동버튼 --%>
			    <c:if test="${!(requestScope.last_display_page)}">
			    <li class="page-item">
			      <a class="page-link" onclick = "goPage(${requestScope.startPage+requestScope.display_page})"><i class="fa-solid fa-angle-right"></i></a>
			    </li>
			    <%-- 맨 끝페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link" onclick = "goPage(${requestScope.totalPage})"><i class="fas fa-solid fa-angles-right"></i></a>
			    </li>
			    </c:if>
		  	</ul>
		</nav>
		
		
		</c:if>	
<%------------------------ 페이지바 끝 ------------------------%>
</div>

             
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
>>>>>>> branch 'main' of https://github.com/hyunwoocastle/Dream.git
<jsp:include page="/WEB-INF/view/footer.jsp" />