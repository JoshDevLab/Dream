<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>
	
  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/shop.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/shop.js" ></script>

    <%-- menu 시작 --%>
    <div class="menu">
      <div id="menu_title">
        <h2 id="menu_title" class="text-center">SHOP</h2>
      </div>
      <div id="btn_category">
        <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_all();" >전체</button>
        <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_policy();">침구류</button>
        <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_common();">조명</button>
        <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_buy();">파자마</button>
        <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_buy();">숙면용품</button>
      </div>
    </div>
    <div class="details_category my-4 pt-2 d-flex flex-nowrap justify-content-between">
      <%-- 1 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG" class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>

      <%-- 2 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG " class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>


      <%-- 3 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG" class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>


      <%-- 4 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG" class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>

      <%-- 5 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG" class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>

      <%-- 6 --%>
      <a class="category_link" href="">
        <div class="d-flex flex-column">
          <div class="category_img">
            <img src="<%=ctxPath %>/images/안대.PNG" class="rounded-circle">
          </div>
          <p class="details_category_name text-center">
            안대
          </p>
        </div>
      </a>
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
              <input type="checkbox" name="bad" id="bad">
              <label for="bad" class="category_chkbox">침구류</label>
            </div>
            <div>
              <input type="checkbox" name="light" id="light">
              <label for="light" class="category_chkbox">조명</label>
            </div>
            <div>
              <input type="checkbox" name="pajama" id="pajama">
              <label for="pajama" class="category_chkbox">파자마</label>
            </div>
            <div>
              <input type="checkbox" name="sleep_product" id="sleep_product">
              <label for="sleep_product" class="category_chkbox">수면 용품</label>
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
              <input type="checkbox" name="best_bad" id="best_bad">
              <label for="best_bad" class="best_chkbox">침구류</label>
            </div>
            <div>
              <input type="checkbox" name="best_light" id="best_light">
              <label for="best_light" class="best_chkbox">조명</label>
            </div>
            <div>
              <input type="checkbox" name="best_pajama" id="best_pajama">
              <label for="best_pajama" class="best_chkbox">파자마</label>
            </div>
            <div>
              <input type="checkbox" name="best_sleep_product" id="best_sleep_product">
              <label for="best_sleep_product" class="best_chkbox">수면 용품</label>
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
              <input type="checkbox" name="man" id="man">
              <label for="man" class="gender_chkbox">남</label>
            </div>
            <div>
              <input type="checkbox" name="women" id="women">
              <label for="women" class="gender_chkbox">여</label>
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
            <p style="font-size:13px;">가격대를 입력해주세요</p>
            <div>
              <input type="text" name="start_price" id="start_price" placeholder="최저가격" class="border rounded">
              <label for="start_price" class="price_input"></label>
            </div>

            <div>
              <input type="text" name="end_price" id="end_price" placeholder="최고가격" class="border rounded">
              <label for="end_price" class="price_input"></label>
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


          <%-- 1 --%>
          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="<%=ctxPath %>/images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <span id="product_price">&#8361;5,000원</span>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <%-- <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span> --%>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <%-- <div id="discount_mark"> --%>
                      <%-- 할인율 넣을 곳 --%>
                      <%-- <span id="discount_percent">30%</span> --%>
                      <%-- <button id="discount" class="rounded"><span id="discount">discount</span></button> --%>
                    <%-- </div> --%>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <%-- <div id="product_sale_price">&#8361;3,500<span>원</span></div> --%>
                </div>
              </div>
            </a>
          </div>


          <%-- 2 --%>
          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="<%=ctxPath %>/images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <%-- <span id="product_price">&#8361;5,000원</span> --%>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <div id="discount_mark">
                      <%-- 할인율 넣을 곳 --%>
                      <span id="discount_percent">30%</span>
                      <button id="discount" class="rounded"><span id="discount">discount</span></button>
                    </div>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳 --%>
                  <div id="product_sale_price">&#8361;3,500<span>원</span></div>
                </div>
              </div>
            </a>
          </div>



          <%-- 3 --%>
          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="<%=ctxPath %>/images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <span id="product_price">&#8361;5,000원</span>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <%-- <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span> --%>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <%-- <div id="discount_mark"> --%>
                      <%-- 할인율 넣을 곳 --%>
                      <%-- <span id="discount_percent">30%</span> --%>
                      <%-- <button id="discount" class="rounded"><span id="discount">discount</span></button> --%>
                    <%-- </div> --%>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <%-- <div id="product_sale_price">&#8361;3,500<span>원</span></div> --%>
                </div>
              </div>
            </a>
          </div>
          
          
          
          <%-- 4 --%>
          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="<%=ctxPath %>/images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <%-- <span id="product_price">&#8361;5,000원</span> --%>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <div id="discount_mark">
                      <%-- 할인율 넣을 곳 --%>
                      <span id="discount_percent">30%</span>
                      <button id="discount" class="rounded"><span id="discount">discount</span></button>
                    </div>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳 --%>
                  <div id="product_sale_price">&#8361;3,500<span>원</span></div>
                </div>
              </div>
            </a>
          </div>



          <%-- 5 --%>
          <div class="item col-6 col-md-4 col-lg-3 d-flex flex-column px-3 py-3 px-lg-4">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="<%=ctxPath %>/images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <%-- <span id="product_price">&#8361;5,000원</span> --%>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <div id="discount_mark">
                      <%-- 할인율 넣을 곳 --%>
                      <span id="discount_percent">30%</span>
                      <button id="discount" class="rounded"><span id="discount">discount</span></button>
                    </div>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳 --%>
                  <div id="product_sale_price">&#8361;3,500<span>원</span></div>
                </div>
              </div>
            </a>
          </div>

          

          

        </div>
        <%-- item box 끝--%>
      </div>
      <%-- Main > productList 끝 --%>
    </div>
    <%-- Main 끝 --%>
  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />