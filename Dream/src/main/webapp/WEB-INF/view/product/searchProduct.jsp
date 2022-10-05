<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
  <%--header 호출 --%>
  <c:if test="${sessionScope.userid != 'admin'}">
	<jsp:include page="/WEB-INF/view/header.jsp" />
  </c:if>
  <c:if test="${sessionScope.userid == 'admin'}">
	<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />
  </c:if>
  
  
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/searchProduct.css" />
  
  <script type="text/javascript" src="<%= ctxPath%>/js/searchProduct.js"></script>
  
  
  <div class="Main mt-4">
  
  
    <%-- 검색부분 시작 --%>
   <div id="search_area" class="d-flex m-auto rounded">
      <div id="productSearch" class="d-flex justify-content-between">
         <div id="input_keyword">
           <input type="text" placeholder="제품번호,제품명,카테고리,상세카테고리 등" id="keyword" class="pl-3" name="keyword">
         </div>
         <div id="search_btn">
           <button type="button" class="btn btn-white" id="btn_search"><i class="fas fa-xl fa-thin fa-magnifying-glass"></i></button>
         </div>
       </div>
    </div>
    <%-- 검색부분 끝 --%>
    
  <br>
  <br>
  <p class="title">추천검색어</p>
  <%-- 추천검색어 시작 --%>
  <div id="recommend" class="d-flex">
    <%-- div.recommend_keyword 클릭이벤트 잡아서 처리하기 --%>
    <div class="recommend_keyword mx-2 px-2 border rounded"><span class="recommend_keyword">조명</span></div>
    <div class="recommend_keyword mx-2 px-2 border rounded"><span class="recommend_keyword">안대</span></div>
    <div class="recommend_keyword mx-2 px-2 border rounded"><span class="recommend_keyword">필로우미스트</span></div>
    <div class="recommend_keyword mx-2 px-2 border rounded"><span class="recommend_keyword">남자</span></div>
  </div>
  <%-- 추천검색어 끝 --%>
  
  <br>
  <br>
  
  <p class="title">인기검색어 <span id="date">10/05 10:00 기준</span>
  <%-- span#reload 클릭이벤트 잡아서 처리하기 --%>
    <span id="reload" class="px-1 py-1 border rounded"><i class="fa-solid fa-rotate-right"></i></span>
  </p>
  <%-- 인기검색어 시작 --%>
  <div class="d-flex">
    <%-- 1~5위 --%>
    <div class="w-50 d-flex flex-column">
      <ul class="best_keyword">
        <%-- span.span_best_keyword 클릭이벤트 잡아서 처리하기 --%>
        <li><span class="span_best_keyword"><strong class="mr-2">1</strong>침대</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">2</strong>조명</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">3</strong>안대</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">4</strong>인기</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">5</strong>수면안대</span></li>
      </ul>
    </div>
    
    <%-- 6~10위 --%>
    <div class="w-50 d-flex flex-column">
      <ul class="best_keyword">
      
        <%-- span.span_best_keyword 클릭이벤트 잡아서 처리하기 --%>
        <li><span class="span_best_keyword"><strong class="mr-2">6</strong>침대</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">7</strong>조명</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">8</strong>안대</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">9</strong>수면안대</span></li>
        <li><span class="span_best_keyword"><strong class="mr-2">10</strong>인기</span></li>
      </ul>
    </div>
  </div>
  <%-- 인기검색어 끝 --%>
  
  <br>
  <p class="title">카테고리</p>
  <%-- 카테고리 시작 --%>
  <div id="search_category_area" class="d-flex justify-content-between">
    <%-- div.category_item 클릭이벤트 잡아서 처리하기 --%>
    <div class="category_item d-flex flex-column">
      <div class="category_img_box"><img class="category_img rounded" src="<%= ctxPath%>/images/디테일카테고리/카테고리침대.PNG"/></div>
      <p class="category_title m-auto">침구류</p>
    </div>
    
    <div class="category_item d-flex flex-column">
      <div class="category_img_box"><img class="category_img rounded" src="<%= ctxPath%>/images/디테일카테고리/카테고리무드등.PNG"/></div>
      <p class="category_title m-auto">조명</p>
    </div>
    
    <div class="category_item d-flex flex-column">
      <div class="category_img_box"><img class="category_img rounded" src="<%= ctxPath%>/images/디테일카테고리/카테고리커플파자마.PNG"/></div>
      <p class="category_title m-auto">파자마</p>
    </div>
    
    <div class="category_item d-flex flex-column">
      <div class="category_img_box"><img class="category_img rounded" src="<%= ctxPath%>/images/디테일카테고리/카테고리필로우미스트.PNG"/></div>
      <p class="category_title m-auto">수면용품</p>
    </div>
    
  </div>
  
  <%-- 카테고리 끝 --%>
  
  
</div>
  
  
  
  
  
  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />