<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/add_payInfo.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/address.js" ></script>

<!-- 다음 주소검색  -->
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 컨테이너 시작  -->
<div class="container">



<!--------------------------------------------------- 사이드바 시작 --------------------------------------------------->
		 <%-- sidebar 호출 --%>
  		<jsp:include page="/WEB-INF/view/sidebar.jsp" />
<!--------------------------------------------------- 사이드바 끝 --------------------------------------------------->




<!--------------------------------------------------- 메인컨텐츠 시작 --------------------------------------------------->
<div class="content_area">
    <div class="my_addressbook">
      <div class="content_title">
					<div class="title">
						<h3>주소록</h3>						
					</div>
					 <div class="btn_box">
						<a href="#" data-toggle="modal" data-target="#add_address" id="add_btn" class="btn_add">							
							<span class="btn_txt" id="add_btn2" onclick="new_add()" >+ 새 배송지 추가</span>
						</a>
					</div>
</div>				
				
				
				<!------------------------------------------------------------- 주소정보 없을시 출력되는 부분 시작 ------------------------------------------------------------->
				
				
				
				
				<div class="empty_area" id="no_add_area">
					<p class="desc">
						배송지 정보가 없습니다.<br />새 배송지를 등록해주세요
					</p>
					<span href="#" id="add_btn2" class="btn_btn_add2" data-toggle="modal" data-target="#add_address" onclick="new_add()">새 배송지 추가 </span>
				</div>
				
				
				
				
				<!------------------------------------------------------------- 주소정보 없을시 출력되는 부분 끝 ------------------------------------------------------------->




                <!------------------------------------------------------------- 주소정보가 있을때 출력되는 부분 시작 ------------------------------------------------------------->
             
                <div class="my_list" id="yes_add_area">
                     		<div class="basic">
						<div class="my_item" default-mark="기본 배송지">
							<div class="info_bind">
								
								<div class="address_info">
									<div class="name_box">
										<span id="basic_text" class="name">ㄱ**</span>
										<span class="mark">기본 배송지</span>
									</div>
									<p id="basic_text" class="phone">
										010<span class="hyphen">-</span>9<span class="dot">*</span>
										<span class="dot">*</span>
										<span class="dot">*</span>
										<span class="hyphen">-</span><span
											class="dot">*</span>999
									</p>
									<div  class="address_box">
										<span id="basic_text"  class="zipcode">(06257)</span><span
											 id="basic_text" class="address">서울 강남구 도곡로23길 6
											(역삼동) ㄴㅇㄹㄴㄹㅇㄴㄹ</span>
									</div>
								</div>
							</div>
							<div  class="btn_bind">
								<!---->
								<a data-toggle="modal" data-target="#add_address" href="#"
									class="btn_outlinegrey_small" onclick="Revise_add()"> 수정 </a><a
								    href="#" class="btn_outlinegrey_small">
									삭제 </a>
							</div>
						</div>
					</div>






					<div class="other">
						<div class="other_list">
							<div class="my_item_is_active"
								style="">
								<div class="info_bind">
									<!---->
									<div class="address_info">
										<div id="basic_text" class="name_box" style="">
											<span class="name">ㅇ**</span>
											<!---->
										</div>
										<p id="basic_text" class="phone">010<span class="hyphen">-</span>
										1<span class="dot"></span><span
												class="dot"></span><span class="hyphen"></span><span
												class="dot"></span>312
										</p>
										<div class="address_box">
											<span class="zipcode" id="basic_text" >(05344)</span>
											<span class="address" id="basic_text" >서울 강동구 천중로56길 6 (길동) ㅇㄴㅁㅇㅇ</span>
										</div>
									</div>
								</div>
								<div id="basic_text" class="btn_bind">
									<a href="#" class="btn_outlinegrey_small"> 기본 배송지 </a>
										<a data-toggle="modal" data-target="#add_address" href="#" class="btn_outlinegrey_small" onclick="Revise_add()"> 수정 </a>
										<a href="#" class="btn_outlinegrey_small"> 삭제 </a>
								</div>
							</div>
							



				</div>
              
              
              
</div>


<!-------------------------------------------------------- 페이지번호 시작 ---------------------------------------------------------->


					<div class="pagination">
						<div class="pagination_box_first_last">
						
						<!---------------------첫 페이지 버튼 시작  ----------------------->
							<!-- <div data-v-1f9de2f0="" class="prev_btn_box">
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
							</div> -->
							<!---------------------첫 페이지 버튼 끝  ----------------------->
							
							
							<div class="page_bind">
								<a  href="/my/address?page=1"
									class="btn_page_active" aria-label="1페이지"> 1 </a>
							</div>
							
							
							
							<!---------------------마지막 페이지 버튼 시작  ----------------------->
							<!-- <div data-v-1f9de2f0="" class="next_btn_box">
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
							</div> -->
							<!---------------------마지막 페이지 버튼 끝  ----------------------->
							
						</div>
					</div>



					<!-------------------------------------------------------- 페이지번호 끝 ---------------------------------------------------------->






</div>				
<!------------------------------------------------------------- 주소정보가 있을때 출력되는 부분 끝 ------------------------------------------------------------->			
 
 
              

  <!-------------------------------------------------------------- 모달 시작 ----------------------------------------------------------->
        


 

				<div class="modal modal_box layer lg" id="add_address">
					<div class="layer_container">
					  <button type="button" class="close passwdFindClose" data-dismiss="modal">&times;</button>
						<div class="layer_header">
						    <h2 class="title1">새 주소 추가</h2> 
						    <h2 class="title2">배송지 수정</h2> 
				
							
						</div>
						<div class="layer_content">
							<div class="delivery_bind">
								<form class="delivery_input">
								
								  
								  
									<div class="input_box has_error">
										<h4 id="name" class="input_title">이름</h4>
										<div class="input_item">
											<input class="input_txt" id="recipient_name" type="text" placeholder="수령인의 이름" autocomplete="off" >
										</div>
										<span class="name_error" style="color:red">올바른 이름을 입력해주세요. (2 - 50자)</span>
									</div>
									
									<div class="input_box">
										<h4 id="mobile" class="input_title">휴대폰 번호</h4>
										<div class="input_item">
											<input id="mobile" type="text" placeholder=" '010' 으로 시작하는 11자리 번호, - 제외 " autocomplete="off"
												class="input_txt">
												
												<span class="mobile_error" style="color:red">정확한 휴대폰 번호를 입력해주세요 (- 제외).</span>
										</div>
										
									</div>
									
									<div class="input_box">
										<h4 class="input_title">우편번호</h4>
										<div class="input_item">
										<a href="#"  id="zipcodeSearch" class="btn btn_zipcode outline small;" onclick="openDaumPOST();"> 우편번호 </a>
										<input type="text" id="postcode" value="우편번호밸류" name="postcode" size="6" maxlength="5" placeholder="우편 번호를 검색하세요" readonly/><br/>
											<!-- <input type="text" placeholder="우편 번호를 검색하세요"
												readonly="readonly" autocomplete="off" class="input_txt"> -->
												
												
												
										</div>
									</div>
									
									<div class="input_box">
										<h4 class="input_title">주소</h4>
										<div class="input_item" >
										<input id="address" value="주소밸류" type="text" placeholder="우편 번호 검색 후,자동입력 됩니다." readonly>
										
										</div>
									</div>
									
									<div class="input_box">
										<h4 class="input_title">참고항목</h4>
										<div class="input_item" >
										<input id=extraAddress value="참고항목밸류" type="text" required >
										
										</div>
									</div>
									
									<div class="input_box">
										<h4 class="input_title">상세 주소</h4>
										<div class="input_item">
											<input id="detailAddress" value="상세주소밸류" type="text" placeholder="건물, 아파트, 동/호수 입력"	 autocomplete="off" class="input_txt">
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
				</div>
				
				
				
				<!------------------------------------------------------------------ 모달 끝  -------------------------------------------------------------------->
				            
              





 


</div> 


</div>
<!--------------------------------------------------- 메인컨텐츠 끝 --------------------------------------------------->



</div>
<!-- 컨테이너 끝  -->

<%--footer 호출 --%>
 <jsp:include page="/WEB-INF/view/footer.jsp" />



