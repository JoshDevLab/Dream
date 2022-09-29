<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="hgb.address.model.*" %> 
<%@ page import="java.util.*" %>

<%

String ctxPath = request.getContextPath();

   List<AddressDTO> addressList = (List)request.getAttribute("addressList");
%>





  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/add_payInfo.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/address.js" ></script>

<%-- 다음 주소검색  --%>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 


<%-- 컨테이너 시작  --%>
<div class="container">



<%--------------------------------------------------- 사이드바 시작 ---------------------------------------------------%>
		<div class="sidebar mr-5" style="width: 180px;">
			<div>
				<h4 class="mb-4" style="font-weight: bold;">마이 페이지</h4>
			</div>
			<div class="category-section mb-5">
				<h5 class="category-title font-weight-bold">쇼핑 정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">구매 내역</a></li>
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">관심 상품</a></li>
				</ul>
			</div>

			<div class="category-section">
				<h5 class="category-title font-weight-bold">내 정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">프로필 정보</a></li>
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">주소록</a></li>
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">결제정보</a></li>
					<li class="nav-item"><a class="nav-link pl-0 text-muted"
						href="#">포인트</a></li>
				</ul>
			</div>
		</div>
<%--------------------------------------------------- 사이드바 끝 ---------------------------------------------------%>




<%--------------------------------------------------- 메인컨텐츠 시작 ---------------------------------------------------%>
<div class="content_area">
    <div class="my_addressbook">
      <div class="content_title">
					<div class="title">
						<h3>주소록</h3>						
					</div>
					 <div class="btn_box">
						<a href="#" data-toggle="modal" data-target="#add_address" id="add_btn" class="btn_add" onclick="new_add()">							
							<span class="btn_txt" id="add_btn3"  >+ 새 배송지 추가</span>
						</a>
					</div>
</div>				
				
				
				<%------------------------------------------------------------- 주소정보 없을시 출력되는 부분 시작 -------------------------------------------------------------%>
				
				
				
				
				<div class="empty_area" id="no_add_area">
					<p class="desc">
						배송지 정보가 없습니다.<br />새 배송지를 등록해주세요
					</p>
					<span href="#" id="add_btn2" class="btn_btn_add2" data-toggle="modal" data-target="#add_address" onclick="new_add()">새 배송지 추가 </span>
				</div>
				
				
				
				
				<%------------------------------------------------------------- 주소정보 없을시 출력되는 부분 끝 -------------------------------------------------------------%>




                <%------------------------------------------------------------- 주소정보가 있을때 출력되는 부분 시작 -------------------------------------------------------------%>
             
                <div class="my_list" id="yes_add_area">
                     		<div class="basic">
						<div class="my_item" default-mark="기본 배송지">
							<div class="info_bind">
								
								<div class="address_info">
									<div class="name_box">
										<span id="basic_text" class="name">${requestScope.basic_adto.order_name} </span>
										<span class="mark">기본 배송지</span>
									</div>
									<p id="basic_text" class="phone">
										${requestScope.basic_first_mobile}-${requestScope.basic_second_mobile}-${requestScope.basic_third_mobile}
									</p>
									<div  class="address_box">
										(<span id="basic_text"  class="zipcode">${requestScope.basic_adto.post_code }</span>)
										 <span id="basic_text" class="address">${requestScope.basic_adto.address} ${requestScope.basic_adto.detail_address}</span>
									</div>
								</div>
							</div>
							<div  class="btn_bind">
								<%----%>
								<a data-toggle="modal" data-target="#add_address" href="#"
									class="btn_outlinegrey_small"  onclick="Revise_add()"> 수정 </a><a
								    href="#"  class="btn_outlinegrey_small" id="basic_delete">
									삭제 </a>
							</div>
						</div>
					</div>






					<div class="other">
						<div class="other_list">
						
						
						<c:forEach var="adao" items="${requestScope.addressList}"> 
							<%--for문 반복횟수는 태그라이브러리를 써서 하는데 var='리스트안에 들어있는 한개아이템' items='리스트이름' --%>
							<%-- <c:forEach var="" items="${requestScope.addressList}"> --%>
							<div class="my_item_is_active" id="active"
								style="">
							
								<div class="info_bind">
						  
								<div class="address_info">
									<div class="name_box">
										<span id="basic_text" class="name">${adao.order_name}</span>
										
									</div>
									<p id="basic_text" class="phone">
										${adao.first_mobile}-${adao.second_mobile}-${adao.third_mobile}
									</p>
									<div  class="address_box">
										(<span id="basic_text"  class="zipcode">${adao.post_code}</span>)
										 <span id="basic_text" class="address">${adao.address} ${adao.detail_address}</span>
									</div>
								</div>
							</div>
							 	 
								<div id="basic_text" class="btn_bind">
									<a href="/member/basic_address.dream?address_num=" class="btn_outlinegrey_small"> 기본 배송지 </a>
										<a data-toggle="modal" data-target="#add_address" href="#" class="btn_outlinegrey_small" onclick="Revise_add()"> 수정 </a>
										<a href="#"  id="delete" class="btn_outlinegrey_small" > 삭제 </a>
								</div>
						 	  
							</div>
							</c:forEach>	
							<%--for문 --%>
							
							
							
							
							
							
							
							
							
							
							



				</div>
              
              
              
</div>


<%-------------------------------------------------------- 페이지번호 시작 ----------------------------------------------------------%>


					<div class="pagination">
						<div class="pagination_box_first_last">
						
						<%---------------------첫 페이지 버튼 시작  -----------------------%>
							<%-- <div data-v-1f9de2f0="" class="prev_btn_box">
								<a data-v-1f9de2f0="" href="/my/address?page=1" class="btn_arr"
									aria-label="첫 페이지"><svg data-v-1f9de2f0=""
										xmlns="http://www.w3.org/2000/svg"
										class="arr-page-first icon sprite-icons">
										<use data-v-1f9de2f0=""
											href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-first"
											xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-first"></use></svg></a><a
									data-v-1f9de2f0="" href="/my/address?page=0" class="btn_arr"
									aria-label="이전 페이지"><svg data-v-1f9de2f0=""
										xmlns="http://www.w3.org/2000/svg"
										class="arr-page-prev icon sprite-icons">
										<use data-v-1f9de2f0=""
											href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-prev"
											xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-prev"></use></svg></a>
							</div> --%>
							<%---------------------첫 페이지 버튼 끝  -----------------------%>
							
							
							<div class="page_bind">
								<a  href="/my/address?page=1"
									class="btn_page_active" aria-label="1페이지"> 1 </a>
							</div>
							
							
							
							<%---------------------마지막 페이지 버튼 시작  -----------------------%>
							<%-- <div data-v-1f9de2f0="" class="next_btn_box">
								<a data-v-1f9de2f0="" href="/my/address?page=2" class="btn_arr"
									aria-label="다음 페이지"><svg data-v-1f9de2f0=""
										xmlns="http://www.w3.org/2000/svg"
										class="arr-page-next icon sprite-icons">
										<use data-v-1f9de2f0=""
											href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-next"
											xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-next"></use></svg></a><a
									data-v-1f9de2f0="" href="/my/address?page=1" class="btn_arr"
									aria-label="마지막 페이지"><svg data-v-1f9de2f0=""
										xmlns="http://www.w3.org/2000/svg"
										class="arr-page-last icon sprite-icons">
										<use data-v-1f9de2f0=""
											href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-last"
											xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-last"></use></svg></a>
							</div> --%>
							<%---------------------마지막 페이지 버튼 끝  -----------------------%>
							
						</div>
					</div>



					<%-------------------------------------------------------- 페이지번호 끝 ----------------------------------------------------------%>






</div>				
<%------------------------------------------------------------- 주소정보가 있을때 출력되는 부분 끝 -------------------------------------------------------------%>			
 
 
              

  <%-------------------------------------------------------------- 모달 시작 -----------------------------------------------------------%>
        


 
             
				<div class="modal modal_box layer lg " id="add_address" >
				      
					<div class="layer_container">
					  
					  <button type="button" class="close passwdFindClose" data-dismiss="modal" >&times;</button>
						<div class="layer_header">
						    <h2 class="title1">새 주소 추가</h2> 
						    <h2 class="title2">배송지 수정</h2> 
				
							
						</div>
						<div class="layer_content">
							<div class="delivery_bind">
								<form name="registerFrm" class="delivery_input">
								
								  
								  
									<div class="input_box has_error">
										<h4 id="name" class="input_title">이름</h4>
										<div class="input_item">
											<input name="order_name" class="input_txt" id="recipient_name" type="text" placeholder="수령인의 이름" autocomplete="off" >
										</div>
										<span class="name_error" style="color:red">올바른 이름을 입력해주세요. (2 - 50자)</span>
									</div>
									
									<div class="input_box">
										<h4 id="mobile" class="input_title">휴대폰 번호</h4>
										<div class="input_item">
											<input id="mobile" name="mobile" type="text" placeholder=" '010' 으로 시작하는 11자리 번호, - 제외 " autocomplete="off"
												class="input_txt">
												
												<span class="mobile_error" style="color:red">정확한 휴대폰 번호를 입력해주세요 (- 제외).</span>
										</div>
										
									</div>
									
									<div class="input_box">
										<h4 class="input_title">우편번호</h4>
										<div class="input_item">
										<a href="#"  id="zipcodeSearch" class="btn btn_zipcode outline small;" onclick="openDaumPOST();"> 우편번호 </a>
										<input type="text" id="postcode" value="우편번호밸류" name="post_code" size="6" maxlength="5" placeholder="우편 번호를 검색하세요" readonly/><br/>
											<%-- <input type="text" placeholder="우편 번호를 검색하세요"
												readonly="readonly" autocomplete="off" class="input_txt"> --%>
												
												
												
										</div>
									</div>
									
									<div class="input_box">
										<h4 class="input_title">주소</h4>
										<div class="input_item" >
										<input id="address" name="address" value="주소밸류" type="text" placeholder="우편 번호 검색 후,자동입력 됩니다." readonly>
										
										</div>
									</div>
									
									
									
									<div class="input_box">
										<h4 class="input_title">상세 주소</h4>
										<div class="input_item">
											<input name="detail_address" id="detailAddress" value="상세주소밸류" type="text" placeholder="건물, 아파트, 동/호수 입력"	 autocomplete="off" class="input_txt">
										</div>
									</div>
									
									
									<div class="input_box">
										<input type="checkbox" id="basic_address" name="basic_address"/>
										<label for="basic_address" class="ml-2">기본배송지로 설정</label>
									</div>
									
								</form>
								
							</div>
							
						</div>
							<div class="layer_btn">
								<a href="#" class="btn btn_delete outlinegrey medium" data-dismiss="modal">
									취소 </a>
									<a href="#" class="btn btn_save solid medium" onclick="goRegister()"> 저장하기 </a>
							</div>
							
							
						</div>
						
						
					</div>
			     
				
				  
				
				
				<%------------------------------------------------------------------ 모달 끝  --------------------------------------------------------------------%>
				            
              





 


</div> 


</div>
<%--------------------------------------------------- 메인컨텐츠 끝 ---------------------------------------------------%>



</div>
<%-- 컨테이너 끝  --%>


<%--footer 호출 --%>
 <jsp:include page="/WEB-INF/view/footer.jsp" />
 
 



