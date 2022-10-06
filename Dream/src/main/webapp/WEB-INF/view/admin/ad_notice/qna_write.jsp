<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%-- 관리자 전용 header 호출 --%>
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/memberDetail.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/memberDetail.js" ></script>



<%-- 글쓰기 페이지 시작 --%>
<form action="writerAction" method="post">
	<input type="text" name="bdTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" name="bdContent" placeholder="내용을 입력해주세요" required></textarea>
	</div>
	<div>
		<button type="submit" class="btn btn-secondary mb-3">등록</button>
		<button type="submit" class="btn btn-secondary mb-3">등록</button>
	</div>
</form>


<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />