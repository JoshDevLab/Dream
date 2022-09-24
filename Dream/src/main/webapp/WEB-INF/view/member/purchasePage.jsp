<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/purchasePage.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/purchasePage.js" ></script>


  <div class="container">

    <div class="content">

      <%-- 제품 이미지 + 상품 디테일 --%>
      <div class="product_info_area">
        <div class="product_info">
          <div class="product" style="background-color: rgb(246, 238, 237);">
            <img  alt="상품 이미지" src="images/Koala.jpg" class="image">
          </div>
          <div class="product_detail">
            <strong class="model_numbe-r">JYJ-8426-527</strong>
            <p class="model_title">Jordan 1 Mid Dark Concord Taxi</p>
            <p class="model_ko">조던 1 미드 다크 콩코드 택시</p>
            <div class="model_desc">
              <p class="size_txt">280</p>
            </div>
          </div>
        </div>  
      </div>


      <%-- 제품 주소 && 배송 섹션--%>
      <section>
        <div class="section_unit">
          <div class="section_title">
            <h3 class="title_txt">배송 주소</h3>
            <a href="#" class="add_more_btn">+ 새 주소 추가</a>
          </div>
          <div class="section_content">
            <a href="#" class="empty_delivery_info">
              <span class="guide_txt">주소를 추가해주세요.</span>
            </a>
          </div>
        </div>
        <div class="section_unit">
          <div class="section_title">
            <h3 class="title_txt">배송 방법</h3>
          </div>
          <div class="section_content">
            <div class="delivery_service">
              <div class="delivery_way">
                <div class="way_info">
                  <div class="way_status_thumb">
                    <img src="https://kream-phinf.pstatic.net/MjAyMTExMjlfMTQ4/MDAxNjM4MTc4MjI5NTk3.2phJLPtRvFqViNfhZu06HzNRiUBlT4cmZR4_Ukqsyesg.ikrfWOrL7WXCVO0Rqy5kMvOn3B2YpjLUj6RuJqosPX0g.PNG/a_8b54cbca40e945f4abf1ee24bdd031f7.png" alt="3,000원" class="way_img">
                  </div>
                  <div class="way_desc">
                    <p class="company">
                      <span class="badge_title">일반배송 </span>
                      <span class="title">3,000원</span>
                    </p>
                    <p class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</p>
                  </div>
                </div>
              </div>
            </div>  
      </section>

      <%-- 포인트 섹션 --%>
      <section>
        <div class="section_title">
          <h3 class="title_txt">포인트</h3>
        </div>
        <div class="section_content">
          <div class="section_input">
            <input placeholder="0" disabled="disabled" class="input_credit">
            <button class="btn_use_credit disabled"> 모두 사용 </button>
          </div>
          <div class="info_point">
            <div>
              <span class="text_current">보유 포인트</span>
              <button class="btn_question">
                <i class="fa-regular fa-circle-question"></i>
              </button>
              <div class="value_current">
                <span class="point">0</span>
                <span class="unit">P</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section>
      <div id="final_order_info">
        <div id="final_order_title">
           최종 주문 정보
        </div>
        <div id="mini_title">
           총 결제금액
        </div>
        <div id="total_price">
           <span id="amount">-</span>
        </div>

        <div id="pirce_list">
           <ul>
              <li>
                 <span class="product_price" >상품금액</span>
                 <span style="font-weight: 700;">-</span>
              </li>
              <li>
                 <span id="span_point" class="span_title">포인트</span>
                 <span>-</span>
              </li>
              <li>
                 <span id="span_ship_price" class="span_title">배송비</span>
                 <span>-</span>
              </li>
           </ul>
        </div>


        <ul id="check_ul">
           <li>
              <div class="check_content">
                 <label class="no_margin" for="checkbox_1"><p class="content_1">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.</p></label>
                 <label class="no_margin" for="checkbox_1"><p class="content_2">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</p></label>
              </div>
              <input class = "aaaa" name="li_check" id="checkbox_1" type="checkbox" />
           </li>
           <li>
              <div class="check_content">
                 <label class="no_margin" for="checkbox_2"><p class="content_1">'바로 결제하기' 를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.</p></label>
                 <label class="no_margin" for="checkbox_2"><p class="content_2">본 거래는 개인간 거래로 전자상거래법(제17조)에 따른 청약철회(환불, 교환) 규정이 적용되지 않습니다.</p></label>
              </div>
              <input class = "aaaa" name="li_check" id="checkbox_2" type="checkbox" />
           </li>
           <li>
              <div class="check_content">
                 <label class="no_margin" for="checkbox_3"><p class="boldtext">구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</p></label>
              </div>
              <input class = "aaaa" name="li_check" id="checkbox_3" type="checkbox" />
           </li>
           <li>
              <span class="total_amount">총결제금액</span><span>-</span>
           </li>
           <li>
              <a id="payment" href="#">결제하기</a>
           </li>
        </ul>

     </div>
     

    </section>

    </div>



  </div>






