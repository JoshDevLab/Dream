<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/noticeDetail.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/noticeDetail.js" ></script>
  
  
  
  
  <div class="Main d-flex">
  
  
    <%---------------------------------------- 사이드 바 시작 -----------------------------------------%>
    <div class="sidebar ml-5 mt-4">
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
    <%---------------------------------------- 사이드 바 끝 -----------------------------------------%>
	
	
	
	
	
	
    <%---------------------------------------- 공지사항 상세보기 시작 -----------------------------------------%>
    <div id="noticeDetail" class="d-flex flex-column">
      <table class="table">
        <thead>
          <tr>
            <th><h5 style="font-weight:bold;">공지사항</h5></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <span id="date">2022-09-15</span>
              <p id="title">[이벤트발표] LUCKY DRAW - 루이비통 x 나이키 에어포스 1 로우 바이 버질 아블로 화이트 짐 그린</p>
            </td>
          </tr>
          <tr>
            <td id="noticeContent">
              안녕하세요 DREAM 입니다.<br><br>

              Lorem ipsum, dolor sit amet consectetur <br>
              adipisicing elit. Iusto laboriosam earum exercitationem aperiam, <br>
              rerum aspernatur eius, ducimus totam distinctio magnam iure <br>
              voluptas iste sit a! Vitae quod at quisquam perferendis?<br>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. <br>
              Obcaecati incidunt consectetur quidem et accusamus ab natus ea alias,<br>
              itaque necessitatibus eum sequi enim? Molestias, quia temporibus quod numquam sequi velit!<br>
              Laborum explicabo non pariatur molestiae inventore error illo. <br>
              Totam sit ducimus laboriosam libero ex aliquid, optio porro maiores eius <br>
              fuga recusandae doloribus explicabo similique velit in quam debitis, unde enim!<br>
              Maiores, dolorum illum, qui ratione ea mollitia id quod facilis asperiores est <br>
              accusamus hic libero quisquam. Accusantium, tempore voluptatem rem, alias quasi <br>
              beatae natus consequatur repellat quis pariatur incidunt facere?<br>
              Porro perspiciatis iure placeat quas esse accusantium asperiores totam sapiente, <br>
              tempora pariatur cum at commodi? Enim id nostrum animi saepe quaerat amet aspernatur <br>
              eligendi, sint, nulla temporibus illo dolorum beatae.<br>
              Quibusdam vitae praesentium quo sit est maiores natus doloribus quos rerum labore. <br>
              Exercitationem vero illo quasi asperiores, totam delectus adipisci dolor amet nesciunt <br>
              accusantium obcaecati magnam animi, omnis, quo voluptatibus?<br>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <td class="d-flex justify-content-center">
            <button class="btn btn-white border">목록보기</button>
          </td>
        </tfoot>
      </table>
    </div>
    <%---------------------------------------- 공지사항 상세보기 끝 -----------------------------------------%>
  </div><%-- end of Main --%>

  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />