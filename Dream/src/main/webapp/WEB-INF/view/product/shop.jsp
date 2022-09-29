<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/shop.css" />
  
  <script type="text/javascript">
  if("${requestScope.currentURL}" != "") {
	const URL = decodeURI("${requestScope.currentURL}");
	sessionStorage.setItem("currentURL",URL);
	sessionStorage.setItem("category",'${requestScope.category}');
	sessionStorage.setItem("detail_category",'${requestScope.detail_category}');
	sessionStorage.setItem("bestyn",'${requestScope.bestyn}');
	sessionStorage.setItem("gender",'${requestScope.gender}');
	sessionStorage.setItem("start_price",'${requestScope.start_price}');
	sessionStorage.setItem("end_price",'${requestScope.end_price}');
	sessionStorage.setItem("sort",'${requestScope.sort}');
	<%-- 
	sessionStorage.setItem("display_cnt", '${requestScope.display_cnt}');
	sessionStorage.setItem("display_page", '${requestScope.display_page}');
	sessionStorage.setItem("page", '${requestScope.page}');
	sessionStorage.setItem("total_cnt", '${requestScope.total_cnt}');	
	sessionStorage.setItem("totalPage", '${requestScope.totalPage}');	
	sessionStorage.setItem("startPage", '${requestScope.startPage)}';	
	sessionStorage.setItem("endPage", '${requestScope.endPage}');
	sessionStorage.setItem("last_display_page",'${requestScope.last_display_page}');
	--%>
  }
  </script>
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/shop.js" ></script>
  
  
  
  <%-- container 시작 --%>
  <div id="container">
    <%-- menu 시작 --%>
	    <div class="menu">
	      <div id="menu_title">
	        <h2 id="menu_title" class="text-center">SHOP</h2>
	      </div>
	      <div id="btn_category">
	        <button id="btn_fillter_all" type="button" class="btn_fillter btn rounded-pill border">전체</button>
	        <button id="btn_fillter_bedding" type="button" class="btn_fillter btn rounded-pill border">침구류</button>
	        <button id="btn_fillter_light" type="button" class="btn_fillter btn rounded-pill border">조명</button>
	        <button id="btn_fillter_pajamas" type="button" class="btn_fillter btn rounded-pill border">파자마</button>
	        <button id="btn_fillter_sleep_supplies" type="button" class="btn_fillter btn rounded-pill border">수면용품</button>
	      </div>
	    </div>
	    <div class="details_category my-4 pt-2 d-flex flex-nowrap">
	    
	    
	    </div>
	    <%-- menu 끝 --%>
	
	
	
	    <%-- Main 시작 --%>
	    <div class="Main d-flex m-auto">
	      <%-- Main > 사이드필터 시작 --%>
	      <div class="sidefilter">
	
	        <div class="filter_status pt-4" style="font-size:medium; font-weight: bold;">
	          필터
	        </div>
	
	        <div class="filter_title pt-4 d-flex justify-content-between align-items-center border-bottom">
	          <div class="title_box d-flex flex-column">
	            <span id="main_title">카테고리</span>
	            <span id="place_holder">카테고리 필터</span>
	          </div>
	          <a type="button" class="btn_toggle_filter">
	            <i class="plus_icon fa-solid fa-plus" style="color:black;"></i>
	            <i class="minus_icon fa-solid fa-minus" style="color:black;"></i>
	          </a>
	        </div>
	
	        <%-- 카테고리 토글부분 --%>
	        <form class="togglebox" action="">
	          <div class="d-flex flex-column mt-3">
	            <div>
	              <input type="radio" name="category" id="all">
	              <label for="all" class="category_radio">전체</label>
	            </div>
	            <div>
	              <input type="radio" name="category" id="bad">
	              <label for="bad" class="category_radio">침구류</label>
	            </div>
	            <div>
	              <input type="radio" name="category" id="light">
	              <label for="light" class="category_radio">조명</label>
	            </div>
	            <div>
	              <input type="radio" name="category" id="pajama">
	              <label for="pajama" class="category_radio">파자마</label>
	            </div>
	            <div>
	              <input type="radio" name="category" id="sleep_product">
	              <label for="sleep_product" class="category_radio">수면용품</label>
	            </div>
	          </div>
	        </form>
	        <%-- 카테고리 토글부분 끝 --%>
	
	
	
	        <div class="filter_title pt-4 d-flex justify-content-between align-items-center border-bottom">
	          <div class="title_box d-flex flex-column">
	            <span id="main_title">BEST상품</span>
	            <span id="place_holder">BEST상품 필터</span>
	          </div>
	          <a type="button" class=btn_toggle_filter >
	            <i class="plus_icon fa-solid fa-plus" style="color:black;"></i>
	            <i class="minus_icon fa-solid fa-minus" style="color:black;"></i>
	          </a>
	        </div>
	
	        <%-- BEST상품 토글부분 --%>
	        <form class="togglebox" action="">
	          <div class="d-flex flex-column mt-3">
	            <div>
	              <input type="checkbox" name="bestyn" id="bestyn">
	              <label for="bestyn" class="best_chkbox">베스트상품</label>
	            </div>
	          </div>
	        </form>
	        <%-- BEST상품 토글부분 끝 --%>
	
	
	
	        <div class="filter_title pt-4 d-flex justify-content-between align-items-center border-bottom">
	          <div class="title_box d-flex flex-column">
	            <span id="main_title">성별</span>
	            <span id="place_holder">성별 필터</span>
	          </div>
	          <a type="button" class="btn_toggle_filter">
	            <i class="plus_icon fa-solid fa-plus" style="color:black;"></i>
	            <i class="minus_icon fa-solid fa-minus" style="color:black;"></i>
	          </a>
	        </div>
	
	        <%-- 성별 토글부분 --%>
	        <form class="togglebox" action="">
	          <div class="d-flex flex-column mt-3">
	            <div>
	              <input type="radio" name="gender" id="man">
	              <label for="man" class="gender_radio">남</label>
	            </div>
	            <div>
	              <input type="radio" name="gender" id="women">
	              <label for="women" class="gender_radio">여</label>
	            </div>
	            <div>
	              <input type="radio" name="gender" id="no_gender">
	              <label for="no_gender" class="gender_radio">없음</label>
	            </div>
	          </div>
	        </form>
	        <%-- 성별 토글부분 끝 --%>
	
	
	
	        <div class="filter_title pt-4 d-flex justify-content-between align-items-center border-bottom">
	          <div class="title_box d-flex flex-column">
	            <span id="main_title">가격</span>
	            <span id="place_holder">모든 가격</span>
	          </div>
	          <a type="button" class="btn_toggle_filter">
	            <i class="plus_icon fa-solid fa-plus" style="color:black;"></i>
	            <i class="minus_icon fa-solid fa-minus" style="color:black;"></i>
	          </a>
	        </div>
	
	
	        <%-- 가격 토글부분 --%>
	        <form class="togglebox" action="">
	          <div class="d-flex flex-column mt-3">
	            <div>
	              <p style="font-size:13px;"><i class="fa-solid fa-circle-info mr-1"></i>  가격대를 입력해주세요</p>
	            </div>
	            <div>
	              <input type="text" name="start_price" id="start_price" placeholder="최저가격(숫자만입력)">
	              <label for="start_price" class="price_input"></label>
	            </div>
	
	            <div>
	              <input type="text" name="end_price" id="end_price" placeholder="최고가격(숫자만입력)">
	              <label for="end_price" class="price_input"></label>
	            </div>
	            <div class="d-flex">
	              <button type="button" id="btn_price_search" class="price btn border rounded">검색</button>
	              <button type="button" id="btn_price_clear" class="price btn border rounded ml-3">지우기</button>
	            </div>
	          </div>
	        </form>
	        <%-- 가격 토글부분 끝 --%>
	
	
	      </div>
	      <%-- Main > 사이드필터 끝 --%>
	
	
	
	      <%-- Main > productList 시작 --%>
	      <div class="productList pl-md-4">
	        <%-- 정렬옵션 --%>
	        <div class="sort_option text-right">
	          <select name="sort_option" id="sort_option" class="border rounded">
	            <option value="정렬옵션">정렬옵션</option>
	            <option>인기순</option>
	            <option>신제품</option>
	            <option>최저가순</option>
	          </select>
	          <%-- select 쓰지말고 버튼으로 한다음에 모달로 할지 고민중임!!!!!!!!!!!!! --%>
	        </div>
	        <%-- 정렬옵션 끝 --%>
	
	        <%-- item box 시작 --%>
	        <div class="item_box row mt-4 pb-5">
	
	
	
	
	          <%-- 상품 셀렉트 해와서 반복문 돌릴 곳 --%>
	
			  
	          <%-- 게시물 시작 --%>
	          
          	  <c:forEach var="product" items="${requestScope.productList}">
		          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
		            <a id="${product.product_num}" class="product" href="<%=ctxPath %>/product/detail.dream?num=${product.product_num}"><%-- id값에 제품번호 넣기!!!!*** --%>
		              <div class="product">
		                <div class="product_imgbox border">
		                  <%-- <img src="<%=ctxPath %>/images/${product.product_image}"> --%>
		                </div>
		                <div id="product_simple_explain">
		                  <%-- 상품 카테고리 넣을 곳 --%>
		                  <div id="product_division">${product.category}</div>
		                  <%-- 상품이름 넣을 곳 --%>
		                  <div id="product_name" class="my-2">${product.product_name }</div>
		                  <%-- 상품가격 넣을 곳 --%>
		                  <div id="product_price" class="d-flex justify-content-between">
		                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
		                    <c:if test="${empty product.discount_rate || product.discount_rate == 0}">
		                    <span id="product_price">&#8361;${product.price}원</span>
							</c:if>
		                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
		                    <c:if test="${not empty product.discount_rate && product.discount_rate != 0}">
			                    <span id="product_price" style="text-decoration: line-through;">&#8361;${product.price}원</span>
			                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳 --%>
			                    <div id="discount_mark">
			                      <%-- 할인율 넣을 곳 --%>
			                      <span id="discount_percent">${product.discount_rate * 100}%</span>
			                      <button id="discount" class="rounded"><span id="discount">discount</span></button>
			                    </div> 
		                    </c:if>
		                  </div>
		                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
		                  <c:if test="${not empty product.discount_rate && product.discount_rate != 0}">
		                  	<div id="product_sale_price">&#8361;${product.price - product.price * product.discount_rate}<span>원</span></div>
		                  </c:if>
		                </div>
		              </div>
		            </a>
		          </div>
	          </c:forEach>
	          
              <%-- 게시물 끝 --%>
	
	        </div>
	        <%-- item box 끝--%>
	      </div>
	      <%-- Main > productList 끝 --%>
	    </div>
	    <%-- Main 끝 --%>
	    
	    <%----------------------------------------------------------- 페이지 바 시작 ---------------------------------------------%>
          <nav aria-label="...">
		    <ul class="my pagination pagination-md justify-content-center">
		    	<%-- 첫페이지로 이동버튼 --%>
		    	<c:if test="${requestScope.page > requestScope.display_page}">
		    	<li class="page-item">
			      <a class="page-link" href="?p=1">
			      	<i class="fa-solid fa-angles-left"></i>
			      </a>
			    </li>
			    
			    
			    <%-- 전페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link" href="?p=${requestScope.startPage-1}">
			      	<i class="fa-solid fa-angle-left"></i>
			      </a>
			    </li>
			    </c:if>
			    
			    <%-- 페이지번호 시작--%>
			    <c:forEach begin="${requestScope.startPage-1}" end="${requestScope.endPage-1}" varStatus="i">
                <c:if test="${requestScope.page == (requestScope.startPage+i.count-1)}">
                <li class="page-item active" aria-current="page">
			    	<a class="page-link" href="?p=${requestScope.startPage+i.count-1}">${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                
                <c:if test="${requestScope.page != (requestScope.startPage+i.count-1)}">
                <li class="page-item">
			    	<a class="page-link" href="?p=${requestScope.startPage+i.count-1}">${requestScope.startPage+i.count-1}</a>
			    </li>
                </c:if>
                </c:forEach>
                <%-- 페이지번호 끝 --%>
                
                
                
			    <%-- 다음페이지로 이동버튼 --%>
			    <c:if test="${!(requestScope.last_display_page)}">
			    <li class="page-item">
			      <a class="page-link" href="?p=${requestScope.startPage+requestScope.display_page}"><i class="fa-solid fa-angle-right"></i></a>
			    </li>
			    <%-- 맨 끝페이지로 이동버튼 --%>
			    <li class="page-item">
			      <a class="page-link" href="?p=${requestScope.totalPage}"><i class="fas fa-solid fa-angles-right"></i></a>
			    </li>
			    </c:if>
		  	</ul>
		</nav>
		<%----------------------------------------------------------- 페이지 바 끝 ---------------------------------------------%>
    </div>
    <%-- container 끝 --%>
  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />