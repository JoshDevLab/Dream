<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
 
 
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/purchase_list.css" />
  <link rel="stylesheet" href="<%= ctxPath%>/css/sidebar.css">
  
   <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/purchase_list.js" ></script>

  


  <div id="purchase_list" class="mt-4">
<%-- 내용물 시작 --%>

   <%-- 사이드바 시작 --%>
   <div id="sidebar" class="sidebar ml-5" style="width: 180px;">
      <div>
         <h4 class="mb-4" style="font-weight:bold;">마이 페이지</h4>
      </div>    

      <div class="category-section mb-5">
         <h5 class="category-title font-weight-bold">쇼핑 정보</h5>
         <ul class="nav flex-column">
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">구매 내역</a>
            </li>
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">관심 상품</a>
            </li>
         </ul>
      </div>

      <div class="category-section">
         <h5 class="category-title font-weight-bold">내 정보</h5>
         <ul class="nav flex-column">
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">프로필 정보</a>
            </li>
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">주소록</a>
            </li>
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">결제정보</a>
            </li>
            <li class="nav-item">
                  <a class="nav-link pl-0 color_gray" href="#">포인트</a>
            </li>
         </ul>
      </div>
   </div>
   <%-- 사이드바 끝 --%>


   <%-- 구매내역 시작  --%>
   <div id="purchase" class="container">
   <form name="purchaseFrm">
      <div id="content_title">
         <strong style="font-size: 24px;">구매 내역</strong>
      </div>

      <%-- 상단 진행중, 종료 버튼 시작 --%>
      <div id="status_button">
            <input type="hidden" id="input_shipping" name="input_shipping" value="" />
            <input type="hidden" id="userid" name="userid" value="${sessionScope.userid}" readonly/>
			
         <div id="shipping_cnt_left" class="shipping_cnt" >
            <div class="purchase_count">0</div>
            <div id="shipping" class="shipping_status">진행중</div>
         </div>

         <div id="shipping_cnt_right" class="shipping_cnt">
            <div class="purchase_count">0</div>
            <div id="shipping_completed" class="shipping_status">종료</div>
         </div>

      </div>
      <%-- 상단 진행중, 종료 버튼 끝 --%>


      <%-- 기간조회 시작 --%>
      <div id="date_button">
         <button id="two_month" class="btn_month">최근 2개월</button>
         <button id="four_month" class="btn_month">4개월</button>
         <button id="six_month" class="btn_month">6개월</button>

         <div id="from_date" class="input_date">
            <input type="text" id="start_date" style="width: 120px;"></input>~
         </div>

         <div id="to_date" class="input_date">
            <input type="text" id="end_date" style="width: 120px;">
         </div>
         
         <button id="search_simple">조회</button>
         <button id="search_date">기간조회</button>
         
      </div>
      <%-- 기간조회 끝 --%>


      <%-- 모바일 화면에서 기간 선택 시작 --%>
      <select name="month" id="select_month" class="container" disabled="true">
         <option value="기간선택">기간선택</option>
         <option></option>
         <option></option>
         <option></option>
         <option></option>
         <option></option>
         <option></option>
         <option></option>
      </select>
      <%-- 모바일 화면에서 기간 선택 끝 --%>

      <hr style="background-color : #ebebeb;">

      <div id="result" class="my-4">
         <ul>
            <li class="result_notice">한 번에 조회 가능한 기간은 최대 6개월입니다.</li>
            <li class="result_notice">기간별 조회 결과는 입찰일 기준으로 노출됩니다.</li>
         </ul>

         <%-- 구매일, 상태 버튼 시작 --%>
         <div id="result_buttons">
            <%-- 전체버튼 일단 비활성화 --%>
            <%-- <button id="total">전체 <i class="fa-sharp fa-solid fa-caret-down"></i></button> --%>
            
            <div id="sort">  <%-- 여기 input 태그 name 은 테이블의 컬럼? 오름차순, 내림차순 여부 , 진행중, 상태 --%>
               <button type="button" id="btn_purchaseDate" class="result_detail"><input id="sort_date" name="sort" type="hidden" value="asc"/> 구매일<i class="fas fa-duotone fa-sort-up"></i></button>
               <%-- <button type="button" id="btn_purchaseStatus" class="result_detail"><input id="sort_status" name="status" type="hidden" value="진행중"/> 상태<i class="fas fa-duotone fa-sort-up"></i></button>--%>
            </div>
         </div>
         </form>
         <%-- 구매일, 상태 버튼 끝 --%>





            <%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력  --%>
            <div id="no_result" class="text-center my-5" style="color:#22222280; font-size: 13;">
               거래 내역이 없습니다.
            </div>
            <%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력 끝  --%>




            <%-- 진행중 클릭시 보여줄 div --%>
            <div id="show_shipping">
               <%-- 상품 한개 시작 --%>
               <div class="purchase_item my-3" style=" border-bottom: solid 1px gray; border-top: solid 1px gray;">
                     <div id="purchase_detail"  class="d-flex">
                        
                        <div class="image_box" style="line-height: 110px;">
                           <img id ="" class="product_img" src="" alt="...">
                        </div>   

                        <div id = "name_cnt">
                           <div class="item_name"> 진행중 div </div>
                           <div class="purchase_cnt"> 1개 </div>
                        </div>
                     </div>
                     <div id="date_status">
                        <div>
                           <span id="purchase_date">21/06/12</span><br>
                        </div>
                        <div>
                           <span id="purchase_status">배송완료</span>
                        </div>
                     </div>
               </div>
               <%-- 상품 한개 끝 --%>
            </div>
            <%-- 진행중 클릭시 보여줄 div 끝--%>





            <%-- 종료 클릭시 보여줄 div --%>
            <div id="show_shipping_completed">
               <%-- 상품 한개 시작 --%>
               <div class="purchase_item my-3" style=" border-bottom: solid 1px gray; border-top: solid 1px gray;">
                     <div id="purchase_detail"  class="d-flex">
                        
                        <div class="image_box" style="line-height: 110px;">
                           <img id ="product_img" class="product_img" src="" alt="...">
                        </div>   

                        <div id = "name_cnt">
                           <div class="item_name"> 종료 div </div>
                           <div class="purchase_cnt"> 100개 </div>
                        </div>
                     </div>
                     <div id="date_status">
                        <div>
                           <span id="purchase_date">21/06/12</span><br>
                        </div>
                        <div>
                           <span id="purchase_status">배송완료</span>
                        </div>
                     </div>
               </div>
               <%-- 상품 한개 끝 --%>
            </div>
            <%-- 종료 클릭시 보여줄 div 끝--%>



      </div>
      <%-- 구매내역 끝  --%>
   </div>
<%-- 내용물 끝 --%>
</div>

</body>
  
  
  
  
  <%--footer 호출 --%>
  <jsp:include page="/WEB-INF/view/footer.jsp" />