<%@page import="org.eclipse.jdt.internal.compiler.ast.PrefixExpression"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    

  <%-- header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/product_detail.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/product_detail.js" >

  
  </script>
<%-- sessionScope 값 넣기용 나중에 지워야댐 --%>
<% String productName = "제품이름"; session.setAttribute("productName", productName);%>




<body>


  <div class="container">
  <%-- header footer 사이 모든것 --%>
    <div class="content">

      <div class="column_bind">
        <%-- 왼쪽 오른쪽 칼럼 합친 --%>
        <div id="column_3" >
          <div id = "fixed-absolute" class="productImage">
            <%-- <div id = "fixed-absolute" class="productImage" style="width: 38vw; position: fixed ; right:52%; margin-right: 1.117%;"> --%>
            <%-- 768(태블릿 크기) 부터는 column 1,2 1줄로 나오도록 display 속성 변경 --%>
            <%-- 왼쪽  칼럼 제품이미지 상단 fixed footer 까지 내려가면 class="column is_absolute" 로 변경되도록--%>
            <%-- 왜있는지 모름 나중에 변동형 만들때 기준되나 --%>
            

            <div id = "column_1">
              <div id="productImage" class="carousel slide" data-ride="carousel" data-interval="false">
                <%-- 제품 이미지 carousel slide --%>
                <%-- Indicators --%>
                <ul class="carousel-indicators">
                  <li data-target="#productImage" data-slide-to="0" class="active"></li>
                  <li data-target="#productImage" data-slide-to="1"></li>
                </ul>
              
                <%-- The slideshow --%>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="images/Koala.jpg" class = "d-block w-100 pdimage" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="images/logo2.png" class = "d-block w-100 pdimage" alt="...">
                  </div>   
                  <%-- Left and right controls --%>
                  <a class="carousel-control-prev" href="#productImage" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                  </a>
                  <a class="carousel-control-next" href="#productImage" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                  </a>
  
                </div>
              </div>

              
            </div>
            
          </div>

        </div>
        <div id="column_2">
          <div class="main_title">
            <a href="#" class="brand" value ="{sessionScope.productName}">  </a>
            <p class="title" value = "{sessionScope.product.product_name}"></p>
            <p class="sub_title" value = "{sessionScope.product.product_name}">살로몬 스피드벌스 PRG 블랙 님버스 클라우드 알로이</p>
          </div>
          <div class="product_figure">
            <div class = "detail_size">
              <div class="title">
                <%-- 이 부분은 차후 모바일크기로 줄어들시<div class = "title"> 사라짐 구현시 없애기 !!!!!!!!!!!!! --%>
                <span class="title_txt">옵션</span>
              </div>  
              <%-- size div 는 의류처럼 사이즈 있는 애들한테만 노출되게 할 예정 --%>
              <div class ="size">
                
                
                <div class="dropdown">

				
				  <a id="selectOption" href="#" class="dropdown-toggle" data-toggle="dropdown">
       				선택해주세요!
                  </a>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" >Link 1</a>
				    <a class="dropdown-item" >Link 2</a>
				    <a class="dropdown-item" >Link 3</a>
				    
				    <%-- 사이즈(옵션이) 존재한다면 --%>
					<%-- 			    
						<c:if test="!empty ${pd.size}">
				    
				    	<c:set var="splitSize" value="${fn:split(${pd.size},',')}" />
				    	<c:forEach var="size" items="${splitSize}">
				    		<a class="dropdown-item" val="${size}">${size}</a>
		             	</c:forEach>
			            </c:if>	 	
			            
			            <c:if test="empty ${pd.size}">
			            </c:if>
		             --%>
				  </div>
				</div>
				
				
				
				
              </div>

            </div>
            
            <%-- 옵션 선택시 생기는 목록표 --%>
			<div id="optionSelected">
			
			
			</div>
            
            
            
            
            
            <div class = "detail_price">
              <div class="title">
                <span class="title_txt">가격</span>
              </div>
              <div class="price">
                <div  class="amount">
                  <span class="num" value = "{sessionScope.product.price}"></span>
                  <%-- 나중에는 데이터 받아와야해서 나눠둠 --%>
                  <span class="won">원</span>
                </div>
                <div class="fluctuation">
                  <p >0원 (0%)</p>
                </div>
              </div>
            </div>
            <div class="btn_box">
              <a href="../member/purchasePage.dream" class="btn_buy">
                <strong class="title">구매</strong>
                <div  class="price">
                  <span  class="amount">
                    <em  class="num" value = "{sessionScope.product.price}"></em>
                    <span  class="won">원</span>
                  </span>
                  <span  class="desc">즉시 구매가</span>
                </div>
              </a>
            </div>

            <a href="#" id="column2_btn_wish" class="btn btn_wish" aria-label="관심상품">
              <img style="height: 20px; width: 20px;"/>
              <%-- 즐겨찾기 아이콘 들어갈 예정 --%>
              <span class="btn_text">관심상품</span>
              <span class="wish_count_num">111</span>
              <%-- 여기 숫자는 제품 관심상품 등록된 횟수 카운트해줘야하니 나중에 제품자체에 관심등록 칼럼 추가해줘서 관리하는게 편할듯 --%>
            </a>

          </div>

          <%-- 제품정보 시작 --%>
          <div  class="product_info_wrap">
            <h3   class="detail_title info_title"> 상품 정보 </h3>
            <div   class="detail_product_wrap">
              <dl  class="detail_product">
                <%-- 여기 하위 내용들은 전부 제품테이블에 필수적으로 들어가야할 내용들 or 빼야댐 --%>
                <div  class="detail_box model_num">
                  <dt  class="product_title"> 제품번호 </dt>
                  <dd  class="product_info"> L41672000 </dd>
                </div>
                <div  class="detail_box">
                  <dt  class="product_title"> 출시일 </dt>
                  <dd  class="product_info"> 22/09/15 </dd>
                </div>
                <div  class="detail_box">
                  <dt  class="product_title"> 컬러 </dt>
                  <dd  class="product_info"> BLACK/NIMBUS CLOUD/ALLOY </dd>
                </div>
                <div  class="detail_box">
                  <dt  class="product_title"> 발매가 </dt>
                  <dd  class="product_info"> 210,000원 </dd>
                </div>
              </dl>
            </div>
          </div>
          <%-- 제품정보 끝 --%>

          <%-- 배송방법 보여주기 시작 --%>
          <div class="delivery_way_wrap">
            <h3 class="detail_title lg"> 배송 정보 </h3>
            <div class="delivery_way">
              <div class="way_info">
                <div class="way_status_thumb">
                  <img src="https://kream-phinf.pstatic.net/MjAyMTExMjlfMTQ4/MDAxNjM4MTc4MjI5NTk3.2phJLPtRvFqViNfhZu06HzNRiUBlT4cmZR4_Ukqsyesg.ikrfWOrL7WXCVO0Rqy5kMvOn3B2YpjLUj6RuJqosPX0g.PNG/a_8b54cbca40e945f4abf1ee24bdd031f7.png" alt="3,000원" class="way_img">
                </div>
                <div class="way_desc">
                  <p class="company">
                    <span class="badge_title">일반배송 </span>
                    <span class="title">3,000원</span>
                    <%--제품 배송시 일반배송 말고 빠른배송 추가되면 그거 추가될 수 있도록 제품마다 빠른배송 가능여부 체크하는 거 만들어줘야하고 나중에 여기도 반영해줘야하는데 진짜 개빡치네--%>
                  </p>
                  <p class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</p>
                </div>
              </div>
              <%----%>
            </div>
          </div>
          <%-- 배송방법 보여주기 끝 --%>

          <%-- 배너박스 1.멤버십 가입 페이지로 연결 or 삭제 --%>
          <div  class="banner_box" style="padding-top: 20px;">
            <img src="images/Koala.jpg" style="width:100%; height: 80px;"/> 
          </div>
          <%-- 배너박스 끝 --%>

          <%-- 구매 전 꼭 확인해주세요! 배너 시작 --%>
          <div class = "confirm_wrap" style="padding-top: 39px;">

            
            <h3 class="confirm_title">구매 전 꼭 확인해주세요! 현우 게시판에서 훔쳐올 예정</h3>
            <%-- 기능, 모양 전부 동일하게 가져다 써도 될거같음 --%>
            
          </div>  
          <%-- 구매 전 꼭 확인해주세요! 배너 끝  --%>

          <%-- 알림 가이드 시작--%>
          <div class="point_guide">
            <ul  class="guide_list">
              <li  class="guide_item">
                <div  class="thumb_area">
                  <img src="images/Koala.jpg" alt="" class="img">
                </div>
                <div class="text_area">
                  <strong  class="title">100% 정품 보증</strong>
                  <p class="desc">DREAM에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</p>
                </div>
              </li>
              <li class="guide_item">
                <div  class="thumb_area">
                  <img  src="images/Koala.jpg" alt="" class="img">
                </div>
                <div  class="text_area">
                  <strong  class="title">엄격한 다중 검수</strong>
                  <p class="desc">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</p>
                </div>
              </li>
              <li  class="guide_item">
                <div  class="thumb_area">
                  <img  src="images/Koala.jpg" alt="" class="img">
                </div>
                <div  class="text_area">
                  <strong  class="title">정품 인증 패키지</strong>
                  <p class="desc">검수에 합격한 경우에 한하여 DREAM의 정품 인증 패키지가 포함된 상품이 배송됩니다.</p>
                </div>
              </li>
            </ul>
          </div>
          <%-- 알림 가이드 끝--%>


          <p class="meditaion_notice_product"> 드림(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 드림(주)에 있습니다. </p>
          <p></p>
          

        </div>
 
      </div>

    </div>

  </div>

  <%-- 가격, 즐겨찾기 안보이면 나오는 상단 구매탭 시작--%>
  <div class="floating_price">
    <div class="inner_box">
      <div class="product_area">
        <div class="product_thumb" style="background-color: rgb(244, 244, 244);">
          <img alt="상품 이미지" src="images/Koala.jpg" class="image">
        </div>
        <div class="product_info">
          <p class="name">Stussy 8 Ball Sherpa Jacket Natural</p>
          <p class="translated_name">스투시 8볼 쉐르파 자켓 내츄럴</p>
        </div>
      </div>
        
      <div class="btn_area">
        <a href="#" class="btn outlinegrey btn_wish " aria-label="관심상품">
          <img style="height: 20px; width: 20px;"/>
          <span data-v-2d0ab5c1="" class="wish_count_num">176</span>
        </a>
        <div class="division_btn_box">
          <a  href="#" class="btn_buy">
            <strong  class="title">구매</strong>
            <div  class="price">
              <span  class="amount">
                <em  class="num">530,000</em>
                <span  class="won">원</span>
              </span>
              <span  class="desc">즉시 구매가</span>
            </div>
          </a>
        </div>
      	</div>
      
    </div>
  <%-- 가격, 즐겨찾기 안보이면 나오는 상단 구매탭 끝--%>
  </div>
  <%-- banner_bottom 시작  --%>
  <div class="banner_bottom" style="margin-top: 80px;">
    <a href="#" class="banner_box">
      <div class="banner_info">
        <strong class="info_subtitle">service guide</strong>
        <p class="info_title">DREAM은 처음이지? <br>서비스 소개를 확인해보세요.</p>
        <span class="info_txt">서비스 안내</span>
      </div>
    </a>
  </div>
  <%-- banner_bottom 끝  --%>

  <%-- 멈춰! 실험용 --%>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>1<br><br>

  <%-- footer 예정 --%>



  
   
  
  
</body>