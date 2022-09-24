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
              <span id="date">${requestScope.write_date}</span>
              <p id="title">${requestScope.notice_title}</p>
            </td>
          </tr>
          <tr>
            <td id="noticeContent">
              ${requestScope.notice_content}
            </td>
          </tr>
        </tbody>
        <tfoot>
          <td class="d-flex justify-content-center">
            <button id="btn_close" class="btn btn-white border" onclick="location.href='<%= ctxPath%>/notice/notice.dream'" style="cursor:pointer">목록보기</button>
          </td>
        </tfoot>
      </table>
    </div>
    <%---------------------------------------- 공지사항 상세보기 끝 -----------------------------------------%>
  </div><%-- end of Main --%>

  
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />