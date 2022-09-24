<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String ctxPath = request.getContextPath();
%>
  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/mypage.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/mypage.js" ></script>
  
  <div class="container my lg" style="display: flex;">
  
  
  		<%-------------------- 사이드바 시작 ----------------------%>
  		
        
        <%-- sidebar 호출 --%>
  		<jsp:include page="/WEB-INF/view/sidebar.jsp" />
        
        
        
        <%-------------------- 사이드바 끝 ----------------------%>

        <div id="right-content" style="width: 90%;" class="mt-4">
            <div id="user-membership" style="display: flex;" class="border rounded mb-5">
                <div id="user-detail" style="display:flex;" class="ml-3 mt-3">
                    <div id="user-image" class="mr-3">
                        <i class="fas fa-thin fa-circle-user fa-6x"></i> 
                    </div>
                    <div id="user-info">
                        <div id="user-name">
                            <p style="font-weight:bold; font-size: 14pt;" class="pt-1 mb-0">조상운</p> <%-- 데이터베이스에서 값 가져옴  --%>
                        </div>
                        <div id="user-email" style="font-size:10pt;">
                            <p>tkddns6621@naver.com</p> <%-- 데이터베이스에서 값 가져옴  --%>
                        </div>  
                        <button type="button" class="btn btn-light outline-secondary btn-sm" style="font-size: 9pt;">프로필 수정</button>
                        <button type="button" class="btn btn-light outline-secondary btn-sm" style="font-size: 9pt;">내 스타일</button>
                    </div>
                </div>
                <div id="user-membership-detail" style="margin-left: auto; display: flex; width: 200px;">
                    <div class="mr-4 align-self-center out">
                        <div class="font-weight-bold">일반회원</div> <%-- 데이터베이스에서 값 가져옴  --%>
                        <p style="font-size: 10pt; text-align: center;">회원등급</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                    <div class="align-self-center out">
                        <div class="font-weight-bold text-center">0p</div> <%-- 데이터베이스에서 값 가져옴  --%>
                        <p style="font-size: 10pt;">포인트</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                </div>
            </div>
            <div id="my-home-title" style="display: flex;">
                <p class="font-weight-bold" style="font-size: 14pt;">구매내역</p>
                <a style="margin-left: auto;  text-decoration:none; color: gray; " href="#" >더보기 > </a>
            </div>
            <div id="recent_purchase">
                <div id="purchase_list_tab" class="row rounded bg-light">
                    <div class="col-3 border-right">
                        <div class="font-weight-bold text-center">전체</div>
                        <p style="font-size: 10pt; text-align: center;">0</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                    <div class="col-3">
                        <div class="font-weight-bold text-center">입찰 중</div>
                        <p style="font-size: 10pt; text-align: center;">0</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                    <div class="col-3">
                        <div class="font-weight-bold text-center">진행 중</div>
                        <p style="font-size: 10pt; text-align: center;">0</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                    <div class="col-3">
                        <div class="font-weight-bold text-center">종료</div>
                        <p style="font-size: 10pt; text-align: center;">0</p> <%-- 데이터베이스에서 값 가져옴  --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
   <%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />
  
  