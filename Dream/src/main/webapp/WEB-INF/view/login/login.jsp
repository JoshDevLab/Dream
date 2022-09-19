<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/login.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/login.js" ></script>

</head>
<body>
   <div id = "container"> 
      <img src="<%=ctxPath %>/images/logo.png" alt="...">
      <form action="joinFrm">
         <fieldset>
            <div id="div_userid">
               <label for="userid">이메일 주소</label>
               <input id="input_userid" name="userid" class ="userinfo" type="text" placeholder="예)dream@dream.co.kr" >
            </div>

            <div id="div_passwd">
               <label for="passwd">비밀번호</label>
               <input id="input_passwd" name="passwd" class ="userinfo" type="password" >
            </div>

            <button id="login" class="button">로그인</button>
            
            <ul class = "login_ul">
               <li><a class="login_a" href="#">이메일 가입</a></li>
               <li><a class="login_a" href="#">이메일 찾기</a></li>
               <li><a class="login_a" href="#">비밀번호 찾기</a></li>
            </ul>

            <button id="login_naver" class="button social"><i class="fa-sharp fa-solid fa-n"></i>네이버로 로그인</button>
            
            <button id="login_apple" class="button social"><i class="fa-brands fa-apple fa-lg"></i>Apple로 로그인</button>
            
         </fieldset>
      </form>
   </div>
   
<%--footer 호출 --%>
  <jsp:include page="/WEB-INF/view/footer.jsp" />

