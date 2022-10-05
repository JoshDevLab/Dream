<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%
   String ctxPath = request.getContextPath();
%>


<%--header 호출 --%>
<jsp:include page="/WEB-INF/view/header.jsp" />
<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/cart.css" />
<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/cart.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">


	$(document).ready(function() {
		
		$("button.remove_cart_list").click(function(e) { // 삭제하기 버튼

	        const target = $(e.target);

	        const cart_num = target.parent().parent().find('span#cart_num').text()

	        $.ajax({
		        url : "<%= ctxPath %>/cart/cartDelete.dream",
		        type: "GET",
		        data: {"cart_num" : cart_num},
		        dataType:'json',
		        success: function(json) {
			        	
		        		const n = json.n;
		            	
		        		if(n == 1) {
		        			location.reload();
		        		}
		        		else {
		        			alert('백엔드 에러 잡아라');
		        		}
		            
		        },
		        error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });

	    });// end of $("button.remove_cart_list").click(function() ------------------



	    $("button#remove_check").click(function (e) { // 선택삭제 버튼 이벤트 처리
	        
	        let param = []
	        let cart_num = "";
	        
	        $("input:checkbox[id='purchase_check']:checked").each(function(index,item) {
	        	
		        	let data = {
		        		cart_num : $(item).parent().parent().find('span#cart_num').text()
		        	};
		        	
		        	param.push(data);
		        	
	        });
	        
	        const jsonData = JSON.stringify(param);
	        
	        $.ajax({
		        url : "<%= ctxPath %>/cart/cartSelectDelete.dream",
		        traditional: true,
		        type: "GET",
		        data: {"jsonData" : jsonData},
		        dataType:'json',
		        success: function(json) {
			        	
		        		const n = json.n;
		        		const count_n = param.length
		        		
		        		console.log("확인용 n => " + n);
		        		console.log("확인용 count_n => " + count_n);
		            	
		        		if(n == count_n) {
		        			location.reload();
		        		}
		        		else {
		        			alert('백엔드 에러 잡아라');
		        		}
		            
		        },
		        error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });
	        
	    });// end of $("button#remove_check").click(function (e)
		
	});


function goCoinPurchaseEnd() {
	 
	 let price = $("span#payment_price").text();
	 price = price.split(",").join("");
	
	if(price == 0) {
		alert("상품을 체크 한 후에 결제버튼을 눌러주세요");
		return;
	} 
 	
  //여기 링크를 꼭 참고하세용 http://www.iamport.kr/getstarted
  var IMP = window.IMP;     // 생략가능
  IMP.init('imp05287073');  // 중요!!  아임포트에 가입시 부여받은 "가맹점 식별코드". 
	
  // 결제요청하기
  IMP.request_pay({
      pg : 'html5_inicis', // 결제방식 PG사 구분
      pay_method : 'card',	// 결제 수단
      merchant_uid : 'merchant_josh' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
      name : '드림 상품',  // 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
      amount : 100,	      //  $("span#payment_price").text().split(",").join("") 결제 금액 number 타입. 필수항목. 
      buyer_email : '${sessionScope.userid}', // 구매자 email
      buyer_name : '${user.username}',	  // 구매자 이름 
      buyer_tel : '${user.mobile}',  // 구매자 전화번호 (필수항목)
      buyer_addr : '',  
      buyer_postcode : '',
      m_redirect_url : ''  // 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!
  }, function(rsp) {
	   
		if ( rsp.success ) { // PC 데스크탑용
		//	alert("진입성공");
			
			let param = []; 
			
			$("input:checkbox[id='purchase_check']:checked").each(function(index,item) {
				
				 let data = {
					            product_num : $(item).parent().parent().find('span#product_num').text(),
					            cart_num : $(item).parent().parent().find('span#cart_num').text(),
					            product_size : $(item).parent().parent().find('span#product_size').text(),
					            cart_cnt : $(item).parent().parent().find("input[name='cart_qty']").val()
				        		};
				 
				 param.push(data);
			});
			
			const jsonData = JSON.stringify(param);
			 
		    $.ajax({
		        url : "<%= ctxPath %>/cart/cartPurchaseUpdate.dream",
		        traditional: true,
		        type: "POST",
		        data: {"jsonData" : jsonData, 
		        		   "plusPoint" : Number( $("span#payment_price").text().split(",").join("") ) *0.1,
		        		   "minusPoint" : $("span#point_sale").text() },
		        dataType:'json',
		        success: function(json) {
			        	let pointCount = 1;
			        	
			        	if( Number($("span#point_sale").text()) > 0) {
			        		pointCount = 2;
			        	}
		        		const n = json.n;
		        		const count_n = (param.length*3)+pointCount
		        			
		        		console.log("확인용 param.length =>" + param.length);
		        		console.log("확인용 n =>" + n);
		        		console.log("확인용 count_n =>" + count_n);
		            	
		        		if(n == count_n) {
		        			alert('구매가 완료되었습니다.');
		        			location.reload();
		        		}
		        		else {
		        			alert('백엔드 에러 잡아라');
		        		}
		            
		        },
		        error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });
			
			
       } else {
           location.href="<%= request.getContextPath()%>/index.dream";
           alert("결제에 실패하였습니다.");
      }

  }); // end of IMP.request_pay()----------------------------
}// end of function goCoinPurchaseEnd()
 
</script>
  
    <div class="container my lg" style="display: flex;">
	
	<jsp:include page="../sidebar.jsp"/>
        
        <div id="right-content" style="width: 100%;" class="mt-4">
            <div id="content_title border">
                <h4 class="mb-4 pb-3" style="font-weight:bold; border-bottom: solid 3px black;">장바구니</h4>
            </div>
            <div class="table-responsive table_div" style="width: 100%;">
            <c:if test="${not empty requestScope.cartList}">
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
	                    <c:forEach var="cartList" items="${requestScope.cartList}" varStatus="status">
	                    		<tbody class="cart_list_${status.index}">
	                    			<tr>
	                                <th scope="row" style ='vertical-align : middle; text-align: center;'>${status.count}
	                                		<span id="product_num" style="display: none">${cartList.product_num}</span>
	                                		<span id="cart_num" style="display: none">${cartList.cart_num}</span>
	                                		<span id="discount_rate" style="display: none">${cartList.discount_rate}</span>
	                                	</th>
	                                <td style ='vertical-align : middle; text-align: center;'>
	                                <c:if test="${cartList.size_cnt > 0}">
	                                    <input type="checkbox" id="purchase_check" class="check_${status.index}" name="prd_check"><%-- 반복문 넣을때  class 에 뒤에 index값 넣어주기 --%>
	                                </c:if>
	                                <c:if test="${cartList.size_cnt <= 0}">
	                                    X<%-- 반복문 넣을때  class 에 뒤에 index값 넣어주기 --%>
	                                </c:if>
	                                </td>
	                                <td style ='vertical-align : middle; text-align: center;'>
	                                    <div class="product_name" style="display: flex;">
	                                        <div class="image_box" style="width: 30%;">
	                                                <img class="product_img" src="<%= ctxPath %>/images/제품이미지/${cartList.product_image}"/>
	                                        </div>
	                                        <div class="prd_info" style="margin-left: auto; width: 70%;">
	                                            <a class="prd_name font-weight-bold mb-0" href="<%= ctxPath %>/product/detail.dream?num=${cartList.product_num}">${cartList.product_name}</a>
	                                            <p class="prd_content mb-0">${cartList.product_content}</p>
	                                            <p class="text-muted mb-0" class="size_jaego">옵션: <span id="product_size">${cartList.product_size}</span> / 재고: <span id="size_cnt">${cartList.size_cnt}</span>개</p>
	                                        </div>
	                                    </div>
	                                </td>
	                                <td style ='vertical-align : middle; text-align: center;' class="price_td">
		                                <span class="price">
			                                <c:choose>
				                                <c:when test="${cartList.discount_rate == 0}">
				                                		<fmt:formatNumber value="${cartList.price}" pattern="#,###"/>
				                                </c:when>
				                                	<c:otherwise>
				                                		<fmt:formatNumber value="${cartList.discount_price}" pattern="#,###"/>
				                                	</c:otherwise>
				                            </c:choose>
		                                	</span>
										<div style="font-weight: bold" class="discount_rate">		                                	
			                                	<c:choose>
					                                <c:when test="${cartList.discount_rate == 0}">
					                                		할인없음
					                                </c:when>
					                                	<c:otherwise>
					                                		 <fmt:formatNumber type="number" maxFractionDigits="0" value="${cartList.discount_rate * 100}" />% <br>할인상품
					                                	</c:otherwise>
					                         </c:choose>
				                         </div>
	                                	</td>
	                                <td style ='vertical-align : middle; text-align: center;'>
	                                    <div class="prd_count" style="display: flex;">
	                                    <c:if test="${cartList.size_cnt > 0}">
	                                        <button class="btn btn-outline-secondary btn-sm minus${status.index}" onclick="minus('minus${status.index}')">-</button> <%-- 클래스뒤에 index --%>
	                                        <input name="cart_qty" class="text" size="1" value="${cartList.cart_cnt}"/> <%-- value 로 DB에 있는 수량들어가기 --%> 
	                                        <button class="btn btn-outline-secondary btn-sm plus${status.index}" onclick="plus('plus${status.index}')">+</button> <%-- 클래스뒤에 index --%>
	                                    </c:if>
	                                    <c:if test="${cartList.size_cnt <= 0}">
	                                    		재고없음
	                                	   </c:if>
	                                    </div>
	                                </td>
	                                <td style ='vertical-align : middle; text-align: center;'>
	                                <span class="total_price">
		                                <c:choose>
			                                <c:when test="${cartList.discount_rate == 0}">
			                                		<fmt:formatNumber value="${cartList.price*cartList.cart_cnt}" pattern="#,###"/>
			                                		<div class="plus_point"></div>
			                                </c:when>
			                                <c:otherwise>
			                                		<fmt:formatNumber value="${cartList.discount_price*cartList.cart_cnt}" pattern="#,###"/>
			                                		<div class="plus_point"></div>
			                                </c:otherwise>
		                                </c:choose>
	                                </span>
	                                </td> <%-- 반복문으로 넣을때 db에서 받아온 수량이랑 가격 곱해서 넣음 --%>
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
	                        </tbody>
	                        
	                    </c:forEach>
                </table>
                </c:if>
                <c:if test="${empty requestScope.cartList}">
					<h4 class="text-muted text-center mt-5">장바구니 구매 내역이 없습니다.</h4>
				</c:if>
            </div>

            <div class="mobile_cart" style="width: 100%;"> <%-- 모바일 장바구니 div 시작 --%> <%-- class 이름 맨뒤에 인덱스 번호 추가--%>
	            <c:if test="${not empty requestScope.cartList}">
	                <div class="top_mobile_cart" style="display: flex;">
	                    <input type="checkbox" class="chk_all" name="chk_all" id="mobile_chk_all"/>
	                    <p class="ml-3 pt-3" style="vertical-align: middle; text-align: center; font-weight: bold;">전체 <span class="total_cnt"></span>개</p> <%-- 장바구니에 들어있는 상품들의 총 개수 --%>
	                </div>
	                <c:forEach var="cartList" items="${requestScope.cartList}" varStatus="status">
	                <div class="cart_list_${status.index} card moblie_cart_list border-left-0 border-right-0 py-2 mb-3"> 
	                    <div class="top_moblie_cart_list" style="display: flex; position: relative;">
	                        <div class="align-top mr-3">
	                            <input type="checkbox" class="check_${status.index}" name="prd_check"/>
	                        </div>
	                        <img class="product_img" src="<%= ctxPath %>/images/제품이미지/${cartList.product_image}" style="width: 30%; height: 140px;" />
	                        <div class="card-img-top-font" style="width: 70%; flex-direction: column;">
	                            <p class="prd_name font-weight-bold">${cartList.product_name}</p>
	                            <p class="prd_content">${cartList.product_content}</p>
	                            <p class="text-muted">옵션: ${cartList.product_size} / 재고: ${cartList.size_cnt}개</p>
	                            <div class="prd_count" style="display: flex;">
	                            <c:choose>
	                            <c:when test="${cartList.cart_cnt>cartList.size_cnt}">
	                                <button type="button" class="btn btn-outline-secondary btn-sm minus${status.index}" onclick="minus('minus${status.index}')">-</button>
	                                		<input type="text" size="1" value="${cartList.size_cnt}"/> 
	                                <button type ="button" class="btn btn-outline-secondary btn-sm plus${status.index}" onclick="plus('plus${status.index}')">+</button>
	                            </c:when>
	                            <c:otherwise>
	                            		<button type="button" class="btn btn-outline-secondary btn-sm minus${status.index}" onclick="minus('minus${status.index}')">-</button>
	                                		<input type="text" size="1" value="${cartList.cart_cnt}"/> 
	                                <button type ="button" class="btn btn-outline-secondary btn-sm plus${status.index}" onclick="plus('plus${status.index}')">+</button>
	                            </c:otherwise>
	                            </c:choose>
	                            </div>
	                        </div>
	                    </div> <!-- top_moblie_cart_list -->
	                    <div class="bottom_moblie_cart_list mt-3">
	                        <div style="display: flex;">
	                            <p>할인 금액 예상</p><span style="margin-left: auto;">-8,296원</span> <!-- span 태그에 할인금액 받아와서 넣을것 -->
	                        </div>
	                        <div style="display: flex;">
	                            <p>쿠폰 사용</p><span style="margin-left: auto;"><button class="btn btn-sm btn-dark">사용</button></span> <!-- span 태그에 쿠폰 받아와서 넣을것 -->
	                        </div>    
	                    </div> <!-- bottom_moblie_cart_list -->
	                </div> <!-- moblie_cart_list -->
	                </c:forEach>
				</c:if>
				<c:if test="${empty requestScope.cartList}">
					<h3 class="text-muted text-center">장바구니 구매 내역이 없습니다.</h3> 
				</c:if>
            </div>    


		<c:if test="${not empty requestScope.cartList}">
            <button id="remove_check" class="btn btn-outline-dark outline-secondary btn-sm mb-5" style="font-size: 10pt; margin-left: auto;">선택삭제</button>
		</c:if>
		<c:if test="${empty requestScope.cartList}">
			<hr class="my-5" style="border: solid 2px black; background-color: black;">
		</c:if>
		
		  <%-- 포인트 섹션 --%>
	      <section>
	        <div class="section_title">
	          <h3 class="title_txt">포인트</h3>
	        </div>
	        <div class="section_content">
	          <div class="section_input">
	            <input placeholder="0" id="point" class="input_credit"></input>
	            <button  id="pointAlluse" class="btn_use_credit disabled"> 모두 사용 </button>
	          </div>
	          <div class="info_point">
	            <div>
	              <span class="text_current">보유 포인트</span>
	              <button class="btn_question">
	                <i class="fa-regular fa-circle-question"></i>
	              </button>
	              <div class="value_current">
	                <span class="user_point">${user.point}</span>
	                <span class="unit">P</span>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
		
            <div id="discount_div" style="width: 100%;"> <%-- 쿠폰할인 테이블 시작 --%>

                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th colspan="2" style="text-align: left;">할인금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>포인트할인</td>
                        <td><span class="sale_point" id="point_sale">0</span>원</td>
                      </tr>
                      <tr>
                        <td>쿠폰 할인</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm">쿠폰조회 및 적용</button>
                        </td>
                      </tr>
                      <tr>
                        <td>할인합계</td>
                        <td><span class="sale_point">0</span>원</td>
                      </tr>
                    </tbody>
                  </table>
            </div> <%-- 쿠폰할인 테이블 끝 --%>
            <div id="cart_footer" class="mt-5" style="width: 100%;"> <%-- 최종가격 div 시작 --%>
                <div id="full_price" class="justify-content-lg-center" style="margin: auto; display: flex;">
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> <%-- 상품금액 --%>
                        <p class="text-muted" style="font-size: 10pt;">상품금액</p>
                        <p style="font-weight: bold; margin-left: auto;"><span id="prd_price">0</span>원</p>
                    </div>
                    <div class="mr-5"> ㅡ </div>
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> 
                        <p class="text-muted" style="font-size: 10pt;">할인합계</p>
                        <p style="font-weight: bold; margin-left: auto;"><span class="sale_point">0</span>원</p>
                    </div>
                    <div class="mr-5"> = </div>
                    <div class="prd_price_div mr-5" style="display: flex; width: 20%;"> 
                        <p class="text-muted" style="font-size: 10pt;">최종 결제 금액</p>
                        <p style="font-weight: bold; margin-left: auto;"><span class="payment_price">0</span>원</p>
                    </div>
                </div> <%-- full_price div 끝 --%>
            </div> <%-- 최종가격 div 끝 --%>
            <div id="payment_div" class="text-center mt-5">
                <button class="btn btn-lg btn-primary" onclick="goCoinPurchaseEnd()"><span class="payment_price" id="payment_price">0</span>원 결제하기</button> 
            </div>
        </div> <%-- right-content --%>
    </div>
    
    
  <%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />
