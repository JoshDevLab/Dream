<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/qna.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/qna.js" ></script>
  
  
  
  
  
  <div class="Main d-flex">
    <%-- 사이드 바 시작 --%>
    <div class="sidebar ml-5 mt-4" style="width: 300px;">
      <div>
          <h4 class="mb-4" style="font-weight:bold;">고객센터</h4>
      </div>    
      <div class="category-section mb-5">
          <ul class="nav flex-column">
              <li class="nav-item">
                  <a class="nav-link pl-0 text-muted" href="#">공지사항</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link pl-0 text-muted" href="#">자주 묻는 질문</a>
              </li>
          </ul>
      </div>
    </div>
    <%-- 사이드 바 끝 --%>

    <%-- 자주묻는질문 시작 --%>
    <div id="qna" class="d-flex flex-column">
      <table class="table table">
        <thead>
          <tr>
            <th colspan="3"><h4 style="font-weight:bold;">자주묻는질문</h4></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="3" class="selectTag">
              <select style="height:50px; font-weight: bold;" name="" id="" class="border rounded">
                <option>전체</option>
                <option>이용정책</option>
                <option>공통</option>
                <option>구매</option>
              </select>
            </td>
            <td colspan="3" class="button">
              <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_all();" >전체</button>
              <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_policy();">이용정책</button>
              <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_common();">공통</button>
              <button type="button" class="btn_fillter btn rounded-pill border" onclick="select_buy();">구매</button>
            </td>
          </tr>

          <%-- 1 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              페널티 정책
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                <p>최종 수정일  2022년 7월 1일</p>
                <br>
                <p>판매자와 구매자의 건전한 거래를 위하여 아래 사유에 따라 페널티가 부과됩니다. </p>
                <br>
                <p>결제정보 오류로 페널티 결제 실패 시, 이용약관 제24조("서비스수수료")에 따라 별도의 고지없이 재결제를 시도합니다.</p>
                <br>
                <p>* 발송 정보 입력 시 지원하지 않는 배송 수단의 경우, 운송장 추적 불가, 도착 상품의 식별 곤란 등의 사유로 인해 입고가 불가하며 이에 해당하는 상품은 반송 처리됩니다.</p>
                <br>
                <p>* 반송 처리 등 정상적이지 않은 배송 방법을 통해 상품을 검수센터로 전달할 경우 상품 입고가 불가능합니다.</p>
                <br>
                <p>* 단, 부득이한 경우 발송 정보 입력 기한 이내에 고객센터를 통한 협의 및 KREAM의 사전 승인 하에 상품 동일성 식별이 가능하도록 조치한 경우에 한하여 상품 입고가 가능한 점 참고 부탁드립니다. </p>
                <br>
              </div>
            </td>
          </tr>
          <%-- 1 끝 --%>



          <%-- 2 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              세금계산서 관련 안내
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                두번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 2 끝 --%>



          <%-- 3 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              가품º중고품 판매에 대한 제제
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                테스트테스트셑ㄹ늘ㄴ으라느란ㅇㄹㄴㅇㄹㄴㅇㄹ
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolor doloremque id, natus voluptatem laboriosam, adipisci consectetur minus dolorum nesciunt nihil quos neque modi animi voluptate tempore iusto quod sequi.
                Est dolorum, quam corporis accusamus atque quasi placeat voluptatum vero perferendis dicta fugit facilis quibusdam delectus porro reprehenderit nobis sequi sint dolor tenetur repudiandae nisi dolore adipisci! Rem, nostrum eligendi?
                Sapiente odit animi voluptatibus autem in aspernatur aperiam esse deleniti? Modi quisquam perspiciatis culpa similique dolores vel iure facilis, quas, accusantium saepe architecto consequuntur? Eos, natus praesentium. Rem, laudantium assumenda.
                Quod nobis dolores tempora impedit nihil facilis pariatur dignissimos at consequuntur ad accusantium quas, totam corporis exercitationem, magni quibusdam consequatur, quasi blanditiis vitae eaque? Fugit nulla aliquid est? Laudantium, porro.
                Facilis error a dignissimos dolore possimus officia voluptatibus vitae quia! Ratione tenetur sed laudantium ad eligendi et earum labore, veritatis quam ea quas animi soluta suscipit cumque. Libero, cum error.
                Qui saepe culpa quasi amet eos exercitationem reprehenderit at, quae odit dolore voluptatibus ab velit quisquam doloremque est laudantium distinctio recusandae architecto laborum vel! Voluptatem repudiandae placeat minima eos saepe.
                Repellendus, blanditiis reiciendis doloremque laborum hic ad in culpa harum atque consequuntur velit maxime voluptates qui sint sit nulla! Autem qui dolores officiis ratione impedit. Incidunt officia quae a impedit.
                Hic, dolore quas nobis quo velit sint asperiores sed non accusamus delectus nulla excepturi dolorum mollitia placeat totam, cupiditate quisquam dolores accusantium ratione quidem facilis iure laboriosam harum sunt! Voluptates!
                Laborum nam consectetur quod vel, unde dolore voluptate ut veniam exercitationem cupiditate quidem labore aliquid laboriosam distinctio sed nisi dolor earum illum omnis nostrum amet sunt facilis. Minima, nemo repellat?
                Sint reprehenderit labore excepturi praesentium nam, nostrum officiis ipsum cumque. Voluptatem enim eos nobis inventore amet cupiditate, dolor quos, eaque dolorem nesciunt laudantium consequatur aliquam velit possimus laboriosam sint quidem?
              </div>
            </td>
          </tr>
          <%-- 3 끝 --%>

          <%-- 4 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              4번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                4번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>praesentium nam, nostrum officiis ipsum cumque. Voluptatem enim eos nobis inventore amet cupiditate, dolor quos, eaque dolorem nesciunt laudantium consequatur aliquam velit possimus laboriosam sint quidem?
              </div>
            </td>
          </tr>
          <%-- 4 끝 --%>

          <%-- 5 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              5번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                5번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 5 끝 --%>

          <%-- 6 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              6번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                6번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 6 끝 --%>

          <%-- 7 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              7번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                7번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 7 끝 --%>

          <%-- 8 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              8번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                8번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 8 끝 --%>


          <%-- 9 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              9번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                9번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 9 끝 --%>


          <%-- 10 --%>
          <tr style="cursor:pointer;" class="headline">
            <td class="title">
              <strong>이용정책</strong>
            </td>
            <td class="subject">
              10번째임
            </td>
            <td class="downIcon">
              <i class="fas fa-thin fa-caret-down" style="background-color: white;"></i>
            </td>
            <td class="upIcon">
              <i class="fas fa-regular fa-caret-up" style="background-color: white;"></i>
            </td>
          </tr>
          <tr class="content">
            <td colspan="3">
              <div id="content">
                10번째임
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              </div>
            </td>
          </tr>
          <%-- 10 끝 --%>
          
        </tbody>


        <tfoot>
          <td colspan="3">
            <%-- 페이지아이템 시작 --%>
            <div class="page-item d-flex justify-content-between">
              <div id="btn_start" type="button" onclick="">
                <i class="fa-solid fa-angles-left"></i>
              </div>
              <div id="btn_prev" type="button" class="ml-md-3" onclick="">
                <i class="fa-solid fa-angle-left"></i>
              </div>
              <ul class="pageNum d-flex justify-content-start list-unstyled m-auto">
                <li><a class="pagination" href="" >1</a></li>
                <li><a class="pagination" href="" >2</a></li>
                <li><a class="pagination" href="" >3</a></li>
                <li><a class="pagination" href="" >4</a></li>
                <li><a class="pagination" href="" >5</a></li>
              </ul>
              <div id="btn_end" type="button" class="mr-md-3" onclick="">
                <i class="fa-solid fa-angle-right"></i>
              </div>
              <div id="btn_next" type="button" onclick="">
                <i class="fas fa-solid fa-angles-right"></i>
              </div>
            </div>
            <%-- 페이지아이템 끝 --%>
          </td>
        </tfoot>
      </table>
    </div>
    <%-- 자주묻는질문 끝 --%>
  </div>
  <%-- Main 끝 --%>

  
  
  
  <%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />