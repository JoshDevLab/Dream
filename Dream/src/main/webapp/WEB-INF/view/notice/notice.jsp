<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <c:forEach var="notice" items="${requestScope.noticeList}">
          <tr class="border-bottom">
            <td onclick="location.href='<%= ctxPath%>/notice/noticeDetail.dream?num=${notice.notice_num}'" style="cursor:pointer"><span>${notice.notice_title}</span></td>
          </tr>
          </c:forEach>
        </tbody>
        <tfoot>
          <td>
            <%-- 페이지아이템 시작 --%>
            <div class="page-item d-flex justify-content-between">
              <%--<c:set var="page" value="${(empty param.p)?1:param.p}"/>
			  <c:set var="StartNum" value="${page-(page-1)%5}"/>
			  <c:set var="LastNum" value="23"/>--%>
              <div id="btn_start" type="button" onclick="">
                <i class="fa-solid fa-angles-left"></i>
              </div>
              <div id="btn_prev" type="button" class="ml-md-3" onclick="">
                <i class="fa-solid fa-angle-left"></i>
              </div>
              <ul class="pageNum d-flex justify-content-start list-unstyled m-auto">
                <c:forEach var="i" begin="0" end="4">
                <li><a class="pagination" href="" >${StartNum+i}</a></li>
                </c:forEach>
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