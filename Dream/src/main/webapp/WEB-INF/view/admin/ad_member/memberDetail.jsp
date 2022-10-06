<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
 <c:if test="${not empty requestScope.mdto}">   
    <table class="table table-hover mt-4" id="member">
     <thead>
       <tr>
         <th colspan="7"><h4 style="font-weight:bold;">${requestScope.mdto.username}님 정보</h4></th>
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
         <td class="text-center">${requestScope.mdto.userid}</td>
         <td class="text-center">${requestScope.mdto.username}</td>
         <td class="text-center">${requestScope.mdto.mobile}</td>
         <td class="text-center">${requestScope.mdto.joindate}</td>
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
     </tbody>
  </table>
</c:if> 
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
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom" 
     data-toggle="modal" data-target="#info_edit" data-dismiss="modal" onclick="goEdit()">수정
    </button>
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom" onclick="delete_confirm()">삭제</button>
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom" onclick="delete_confirm()">탈퇴</button>
    <button type="button" class="btn btn-white border rounded mx-2 my-2 btn_bottom">목록보기</button>
  </div>
  
  
  
  
  
  
  
  
  
  
    <%---------------------------------------- 회원 상세보기 끝 -----------------------------------------%>


</div>
<%-- 회원관리상세보기페이지 코드 끝 --%>





<%-------------------------------------------------------------- 모달 시작 -----------------------------------------------------------%>
        
        
        
        
             
      <div class="modal modal_box layer lg" id="info_edit" >                 
        <div class="layer_container">                 
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
         <div class="layer_header">
            <h2 class="title1">ㅇㅇㅇ님 상세정보 수정</h2>                                                        
         </div>
         
         <div class="layer_content">
            <div class="delivery_bind">
               <form name="registerFrm" class="delivery_input">   
                                                         
                 <div class="input_box">                                          
                   <input type="hidden" id = "address_num_modal" name="address_num" value=""/>
                  <h4 id="id" class="input_title">아이디</h4>
                  <div class="input_item">
                     <input name="userid" class="input_txt" id="userid" type="text" autocomplete="off" readonly value="dddkdlel">
                  </div>                              
                </div>   
                
                           
               <div class="input_box">                                                                     
                  <h4 id="passwd" class="input_title">비밀번호</h4>
                  <div class="input_item">
                     <input name="passwd" class="input_txt" id="passwd" type="text" autocomplete="off" value="">
                  </div>                              
               </div>                                               
                          
                          
               <div class="input_box">                                                            
                  <h4 id="name" class="input_title">이름</h4>
                     <div class="input_item">
                       <input name="username" class="input_txt" id="username" type="text"  autocomplete="off" value="카리나">
                    </div>
                    <span class="name_error" style="color:red">올바른 이름을 입력해주세요. (2 - 50자)</span>
                </div>
                         
                         
               <div class="input_box">
                   <h4 id="mobile" class="input_title">휴대폰 번호</h4>
                  <div class="input_item">
                     <input id="mobile" name="mobile" type="text" autocomplete="off" class="input_txt" readonly value="01090209305">                        
                  </div>                  
                </div>                                                      
               
                           
               <div class="input_box">
                  <h4 class="input_title">가입일자</h4>
                  <div class="input_item" >
                     <input id="join_date" name="join_date" value="22/09/28" type="text" readonly>                  
                  </div>
               </div>
                           
                                                      
               <div class="input_box">
                  <h4 class="input_title" >탈퇴여부</h4>
                  <input type="radio" id="male" name="out" value="1" /><label for="male" style="margin-left: 2%;">O</label>
                       <input type="radio" id="female" name="out" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">X</label>
                  <h4 class="input_title" style="margin-top:10px;">휴면여부</h4>
                  <input type="radio" id="male" name="rest" value="1" /><label for="male" style="margin-left: 2%;">O</label>
                    <input type="radio" id="female" name="rest" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">X</label>
                  <h4 class="input_title" style="margin-top:10px;">멤버쉽여부</h4>
                  <input type="radio" id="male" name="membership" value="1" /><label for="male" style="margin-left: 2%;">O</label>
                       <input type="radio" id="female" name="membership" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">X</label>
               </div>   
                                    
             </form>                        
            </div>            
         </div>
         
         
         
         <div class="layer_btn">                                             
             <a href="#" class="btn btn_save solid medium" id="add_edit" onclick="goEdit()"> 수정하기 </a>
             <a href="#" class="btn btn_delete outlinegrey medium" id="cansleEdit" data-dismiss="modal">취소 </a>      
         </div>                                          
        </div>               
      </div>
                                        
                        
<%------------------------------------------------------------------ 모달 끝  --------------------------------------------------------------------%>





<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />