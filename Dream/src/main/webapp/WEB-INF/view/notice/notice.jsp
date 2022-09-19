<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ctxPath = request.getContextPath();
%>
  <%-- header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/notice.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/notice.js" ></script>
  
  
  
<%-- 공지사항 코드 시작 --%>
  <div class="Main d-flex">
  
    <%-- 사이드 바 시작 --%>
    <div class="sidebar ml-5">
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


    
    <%-- 공지사항 테이블 시작 --%>
    <div class="notice d-flex flex-column">
      <table class="table table-hover">
        <thead>
          <tr>
            <th><h5 style="font-weight:bold;">공지사항</h5></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><span type="button" onclick="">[공지] 5월 거래 혜택 이벤트 안내</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] LUCKY DRAW - 뉴발란스 x JJJ자운드 990v3 & 자크뮈스 르 치키토 미니백</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] 드림 첫 게시물</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] 드림 게시판 더미게시글</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[공지] 세미프로젝트 시작</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] 게시글 열개 채우기 이벤트</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[공지] 세미프로젝트 게시글 존나 귀찮</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[공지] 쌍용강북교육센터 화이팅</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] 깃허브 어떻게 하지</span></td>
          </tr>
          <tr>
            <td><span type="button" onclick="">[이벤트 발표] 제목 존나길게 하기 제목 존나길게 하기제목</span></td>
          </tr>
        </tbody>
        <tfoot>
          <td>
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
    <%--공지사항 끝  --%>
  </div>
  <%--Main 끝  --%> 

  
  
  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />