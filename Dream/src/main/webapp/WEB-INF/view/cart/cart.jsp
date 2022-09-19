<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/cart.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/cart.js" ></script>
  
    <div class="container my lg" style="display: flex;">

        <div class="sidebar mr-5 mt-4" style="width: 180px;">
            <div>
                <h4 class="mb-4" style="font-weight:bold;">마이 페이지</h4>
            </div>    

            <div class="category-section mb-5">
                <h5 class="category-title font-weight-bold">쇼핑 정보</h5>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">구매 내역</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">관심 상품</a>
                    </li>
                </ul>
            </div>

            <div class="category-section">
                <h5 class="category-title font-weight-bold">내 정보</h5>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">프로필 정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">주소록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">결제정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-0 text-muted" href="#">포인트</a>
                    </li>
                </ul>
            </div>
        </div>

        <div id="right-content" style="width: 100%;" class="mt-4">
            <div id="content_title border">
                <h4 class="mb-4 pb-3" style="font-weight:bold; border-bottom: solid 3px black;">장바구니</h4>
            </div>
            <div class="table-responsive table_div" style="width: 930px;">
                <table class="table border" id="tbl_cart" style="width: 100%;">
                    <thead>
                        <tr>
                            <th scope="col">전체<span class="total_cnt"></span>개</th> <%-- span 태그안에 전체갯수 넣기 --%>
                            <th scope="col" style="cursor:pointer">
                                <input type="checkbox" id="chk_all" name="chk_all" class="chk_all" title="전체 상품 선택"> 
                            </th>
                            <th scope="col" style="width:35%; text-align: center;">상품명(옵션)</th>
                            <th scope="col">판매가</th>
                            <th scope="col">수량</th>
                            <th scope="col">
                                주문금액
                                <br>
                                (적립예정)
                            </th>
                            <th scope="col">주문관리</th>
                            <th scope="col">배송비/배송 형태</th>
                        </tr>
                    </thead>

                        <tbody class="cart_list_1"> <%-- 하나 상품에 대한 묶음 --%>  <%-- 클래스 이름 뒤에 인덱스 값들어오게 할것 --%>
                            <tr>
                                <th scope="row" style ='vertical-align : middle; text-align: center;'>1</th>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <input type="checkbox" class="check_1" name="prd_check"> <%-- 반복문 넣을때  class 에 뒤에 index값 넣어주기--%>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <div class="product_name" style="display: flex;">
                                        <div class="image_box" style="width: 30%;">
                                                <img class="product_img" src="<%=ctxPath %>/images/Koala.jpg"/>
                                        </div>
                                        <div class="prd_info" style="margin-left: auto; width: 70%;">
                                            <p class="prd_name font-weight-bold mb-0">귀여운 코알라</p>
                                            <p class="prd_content mb-0">코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?</p>
                                            <p class="text-muted mb-0" class="size_jaego">옵션: M / 재고 5개 이상</p>
                                        </div>
                                    </div>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;' class="price_td"><span class="price">59,250</span></td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <div class="prd_count" style="display: flex;">
                                        <button class="btn btn-outline-secondary btn-sm minus1" onclick="minus('minus1')">-</button>
                                        <input name="cart_qty" class="text" size="1" value="1"/> <%-- DB에 있는 수량들어가기 --%>
                                        <button class="btn btn-outline-secondary btn-sm plus1" onclick="plus('plus1')">+</button>
                                    </div>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'><span class="total_price"></span></td> <%-- 반복문으로 넣을때 db에서 받아온 수량이랑 가격 곱해서 넣음 --%>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <button class="remove_cart_list btn btn-outline-dark outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">삭제하기</button>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    택배배송
                                    <br>
                                    <span>배송비무료</span>
                                    <br>
                                    0원 이상 무료
                                </td>
                            </tr>
                        </tbody> <%-- 장바구니 하나 묶음 --%>

                        <tbody class="cart_list_2"> 
                            <tr>
                                <th scope="row" style ='vertical-align : middle; text-align: center;'>1</th>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <input type="checkbox"  class="check_2" name="prd_check">
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <div class="product_name" style="display: flex;">
                                        <div class="image_box" style="width: 30%;">
                                                <img class="product_img" src="<%=ctxPath %>/images/Koala.jpg"/>
                                        </div>
                                        <div class="prd_info" style="margin-left: auto; width: 70%;">
                                            <p class="prd_name font-weight-bold mb-0">귀여운 코알라</p>
                                            <p class="prd_content mb-0">코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?</p>
                                            <p class="text-muted mb-0" class="size_jaego">옵션: M / 재고 5개 이상</p>
                                        </div>
                                    </div>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;' class="price_td"><span class="price">35,000</span></td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <div class="prd_count" style="display: flex;">
                                        <button class="btn btn-outline-secondary btn-sm minus2" onclick="minus('minus2')">-</button>
                                        <input name="cart_qty" class="text" size="1" value="1"/> <%-- DB에 있는 수량들어가기 --%>
                                        <button class="btn btn-outline-secondary btn-sm plus2" onclick="plus('plus2')">+</button>
                                    </div>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'><span class="total_price"></span></td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    <button class="remove_cart_list btn btn-outline-dark outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">삭제하기</button>
                                </td>
                                <td style ='vertical-align : middle; text-align: center;'>
                                    택배배송
                                    <br>
                                    <span>배송비무료</span>
                                    <br>
                                    0원 이상 무료
                                </td>
                            </tr>
                        </tbody> <%-- 장바구니 하나 묶음 --%>
                </table>
            </div>

            <div class="mobile_cart" style="width: 100%;"> <%-- 모바일 장바구니 div 시작 --%> <%-- class 이름 맨뒤에 인덱스 번호 추가--%>
                <div class="top_mobile_cart" style="display: flex;">
                    <input type="checkbox" class="chk_all" name="chk_all" id="mobile_chk_all"/>
                    <p class="ml-3 pt-3" style="vertical-align: middle; text-align: center; font-weight: bold;">전체 <span class="total_cnt"></span>개</p> <%-- 장바구니에 들어있는 상품들의 총 개수 --%>
                </div>

                <div class="cart_list_1 card moblie_cart_list border-left-0 border-right-0 py-2 mb-3"> <%-- 모바일 화면에 장바구니 한개 상품 묶음 div --%>
                    <div class="top_moblie_cart_list" style="display: flex; position: relative;">
                        <div class="align-top mr-3">
                            <input type="checkbox" class="check_1" name="prd_check"/> <%-- 반복문 넣어줄때 class에 index해서 넣어주기 --%>
                        </div>
                        <img src="<%=ctxPath %>/images/Koala.jpg" class="card-img-top mr-3" alt="코알라" style="width: 30%; height: 140px;"/>
                        <div class="card-img-top-font" style="width: 70%; flex-direction: column;">
                            <p class="prd_name font-weight-bold">귀여운 코알라</p>
                            <p class="prd_content">코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?</p>
                            <p class="text-muted">옵션: M / 재고 5개 이상</p>
                            <div class="prd_count" style="display: flex;">
                                <button type="button" class="minus1" onclick="minus('minus1')">-</button>
                                <input type="text" size="1" value="0"/> <%-- value 값으로 DB에 있는 수량 가져오기 --%>
                                <button type ="button" class="plus1" onclick="plus('plus1')">+</button>
                            </div>
                        </div>
                    </div> <%-- top_moblie_cart_list --%>
                    <div class="bottom_moblie_cart_list mt-3">
                        <div style="display: flex;">
                            <p>할인 금액 예상</p><span style="margin-left: auto;">-8,296원</span> <%-- span 태그에 할인금액 받아와서 넣을것 --%>
                        </div>
                        <div style="display: flex;">
                            <p>쿠폰 사용</p><span style="margin-left: auto;"><button class="btn btn-sm btn-dark">사용</button></span> <%-- span 태그에 쿠폰 받아와서 넣을것 --%>
                        </div>    
                    </div> <%-- bottom_moblie_cart_list --%>
                </div> <%-- moblie_cart_list --%>

                <div class="cart_list_2"> <%-- 모바일 화면에 장바구니 한개 상품 묶음 div --%>
                    <div class="top_moblie_cart_list" style="display: flex; position: relative;">
                        <div class="align-top mr-3">
                            <input type="checkbox" class="check_2" name="prd_check"/>
                        </div>  
                        <img src="<%=ctxPath %>/images/Koala.jpg" class="card-img-top mr-3" alt="코알라" style="width: 30%; height: 140px;"/>
                        <div class="card-img-top-font" style="width: 70%; flex-direction: column;">
                            <p class="prd_name font-weight-bold">귀여운 코알라</p>
                            <p class="prd_content">코알라 팝니다 귀엽쥬우?코알라 팝니다 귀엽쥬우?</p>
                            <p class="text-muted">옵션: M / 재고 5개 이상</p>
                            <div class="prd_count" style="display: flex;">
                                <button type="button" class="minus2" onclick="minus('minus2')">-</button>
                                <input type="text" size="1" value="0"/> <%-- value 값으로 DB에 있는 수량 가져오기 --%>
                                <button type ="button" class="plus2" onclick="plus('plus2')">+</button>
                            </div>
                        </div>
                    </div> <%-- top_moblie_cart_list --%>
                    <div class="bottom_moblie_cart_list mt-3">
                        <div style="display: flex;">
                            <p>할인 금액 예상</p><span style="margin-left: auto;">-8,296원</span> <%-- span 태그에 할인금액 받아와서 넣을것 --%>
                        </div>
                        <div style="display: flex;">
                            <p>쿠폰 사용</p><span style="margin-left: auto;"><button class="btn btn-sm btn-dark">사용</button></span> <%-- span 태그에 쿠폰 받아와서 넣을것 --%>
                        </div>    
                    </div> <%-- bottom_moblie_cart_list --%>
                </div> <%-- moblie_cart_list --%>

            </div>    



            <button id="remove_check" class="btn btn-outline-dark outline-secondary btn-sm mb-5" style="font-size: 10pt; margin-left: auto;">선택삭제</button>

            <div id="discount_div" style="width: 100%;"> <%-- 쿠폰할인 테이블 시작 --%>

                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th colspan="2" style="text-align: left;">할인금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style="width:40%;">상품 할인</td>
                        <td>1000원</td>
                      </tr>
                      <tr>
                        <td>등급할인</td>
                        <td>0원</td>
                      </tr>
                      <tr>
                        <td>포인트할인</td>
                        <td>0원</td>
                      </tr>
                      <tr>
                        <td>쿠폰 할인</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm">쿠폰조회 및 적용</button>
                        </td>
                      </tr>
                      <tr>
                        <td>할인합계</td>
                        <td>50,785원</td>
                      </tr>
                    </tbody>
                  </table>
            </div> <%-- 쿠폰할인 테이블 끝 --%>
            <div id="cart_footer" class="mt-5" style="width: 100%;"> <%-- 최종가격 div 시작 --%>
                <div id="full_price" class="justify-content-lg-center" style="margin: auto; display: flex;">
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> <%-- 상품금액 --%>
                        <p class="text-muted" style="font-size: 10pt;">상품금액</p>
                        <p style="font-weight: bold; margin-left: auto;"><span id="prd_price">203,000</span>원</p>
                    </div>
                    <div class="mr-5"> ㅡ </div>
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> 
                        <p class="text-muted" style="font-size: 10pt;">할인합계</p>
                        <p style="font-weight: bold; margin-left: auto;"><span id="prd_discount_price">59,000</span>원</p>
                    </div>
                    <div class="mr-5"> = </div>
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> 
                        <p class="text-muted" style="font-size: 10pt;">최종 결제 금액</p>
                        <p style="font-weight: bold; margin-left: auto;"><span class="payment_price">59,000</span>원</p>
                    </div>
                </div> <%-- full_price div 끝 --%>
            </div> <%-- 최종가격 div 끝 --%>
            <div id="payment_div" class="text-center mt-5">
                <button class="btn btn-lg btn-primary" type="submit"><span class="payment_price">152,215</span>원 결제하기</button> <%--  --%>
            </div>
        </div> <%-- right-content --%>
    </div>
    
    
  <%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />
