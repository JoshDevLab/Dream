<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<%--header 호출 --%>
<jsp:include page="/WEB-INF/view/header.jsp" />
<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/findPwd.css" />
<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/findPwd.js" ></script>

<%-- fullpage 라이브러리 --%>
<link href="<%= ctxPath%>/fullpagelib/jquery.fullPage.css" rel="stylesheet"> 
<script type="text/javascript" src="<%= ctxPath%>/fullpagelib/jquery.fullPage.js"></script>


<div id="container">

      <%-- 비밀번호 찾기 제목 --%>
      <div class="find_title">
         <h2 id="find_pwd_title">비밀번호 찾기</h2>
      </div>
      <%-- 비밀번호 찾기 제목 --%>
      

      <%-- 안내 문구 --%>
      <div class="find_notice">
         <p id="p_notice">
            가입 시 등록하신 휴대폰 번호와 이메일을 입력하시면,<br>
            휴대폰으로 임시 비밀번호를 전송해 드립니다.
         </p>
      </div>
      <%-- 안내 문구 --%>
      

      <%-- 아이디 찾기 입력창 --%>
      <div class="find_inputbox">
         <div class= "input_title" id="div_mobile">휴대폰 번호</div>
         <input class="input_info" id="mobile" name="mobile" type="text" placeholder="가입하신 휴대폰 번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
         <div class="warning" id="mobile_warning">
            휴대폰 번호를 정확히 입력해주세요.
         </div>
         
         
         <div class= "input_title" id="div_email">이메일 주소</div>
         <input class="input_info" id="email" name="email" type="text" placeholder="예) dream@dream.co.kr"/>
         <div class="warning" id="email_warning">
            이메일 주소를 정확히 입력해주세요.
         </div>
      
      </div>
      <%-- 아이디 찾기 입력창 --%>


      <%-- 이메일 아이디찾기 버튼 부분  --%>
      <div class="find_buttonbox">
         <a  href="#" class="btn_find">문자 발송하기</a>
      </div>
      <%-- 이메일 아이디찾기 버튼 부분  --%>

   </div>
   
   
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />     