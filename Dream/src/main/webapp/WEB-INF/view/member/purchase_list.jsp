<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="jjy.purchase.model.*"%>

<%
	String ctxPath = request.getContextPath();
%>

<%--header 호출 --%>
<jsp:include page="/WEB-INF/view/header.jsp" />


<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/css/purchase_list.css" />
<link rel="stylesheet" href="<%=ctxPath%>/css/sidebar.css">

<%-- 직접만든 javascript 
  <script type="text/javascript" src="<%= ctxPath%>/js/purchase_list.js" ></script>--%>





<script type="text/javascript">


function getContextPath() {
	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	let contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath;
}

let totalPage;
let lenHIT = 5;
// HIT 상품 "스크롤" 할때 보여줄 상품의 개수(단위)크기 
let start = 1;


$(document).ready(function() {
	
//	$("span#totalHITCount").hide();
//	$("span#countHIT").hide();
	
	// callAjax(start); // 맨 처음 8개를 출력
	
	// HIT 상품 게시물을 더보기 위하여 "더보기..." 버튼 클릭액션 이벤트 등록하기 
	$("button#btnMoreHIT").click(function(){ 
		   if( $(this).text() == "처음으로" ) {
			   $("div#show_shipping").empty();           // append 된 상품들 삭제 
	           $("div#show_shipping_completed").empty(); // append 된 상품들 삭제 
	           $("span#end").empty();
			   callAjax("1");
			   $(this).text("더보기");
		   }
		   else {
			   callAjax($(this).val());
		   }
	});
	
	// DatePicker 한글, 기타 속성 시작
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd' //Input Display Format 변경
		, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
		, changeYear: true //콤보박스에서 년 선택 가능
		, changeMonth: true //콤보박스에서 월 선택 가능    
		// input 태그 옆 달력 아이콘 비활성화           
		// ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		// ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		// ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		, buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
		, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
		// ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		// ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
	});


	//input을 datepicker로 선언
	$("input#start_date").datepicker();
	$("input#end_date").datepicker();

	//From의 초기값을 오늘 날짜로 설정
	$('input#start_date').datepicker('setDate', '-2M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
	$('input#end_date').datepicker('setDate', 'today');
	// DatePicker 한글, 기타 속성 끝


	// 진행중 클릭시 테두리, 글자 속성 변경 
	$("div#shipping_cnt_left").click(function(e) {
		
		$("div#show_shipping").empty();           // append 된 상품들 삭제 
        $("div#show_shipping_completed").empty(); // append 된 상품들 삭제 
        $("span#countHIT").text("0");
		
		$("div#shipping_cnt_right").css("border", "");
		$("div.shipping_status").css({ "font-weight": "", "color": "" });
		$("div#shipping_cnt_right > div.purchase_count").css("color", "black");
		$("div#shipping_cnt_left").css("border-bottom", "solid 2px #222");
		$("div#shipping_cnt_left > div.purchase_count").css("color", "#f15746");
		$("div#shipping_cnt_left > div.shipping_status").css({ "font-weight": "700", "color": "#222" });
		$("div#show_shipping_completed").hide();
		$("div#show_shipping").show();
		// div가 클릭되면 select 해오기 위해 사용되는 배송중 상태를 input태그(type="hidden")에 값 넣기
		$("div#status_button> input#input_shipping").val("0");
		
		callAjax(start);
	});
	

	// 종료 클릭시 테두리, 글자 속성 변경 
	$("div#shipping_cnt_right").click(function(e) {
		
		$("div#show_shipping").empty();           // append 된 상품들 삭제 
        $("div#show_shipping_completed").empty(); // append 된 상품들 삭제 
        $("span#countHIT").text("0");
		
		$("div#shipping_cnt_left").css("border", "");
		$("div.shipping_status").css({ "font-weight": "", "color": "" });
		$("div#shipping_cnt_left > div.purchase_count").css("color", "black");
		$("div#shipping_cnt_right").css("border-bottom", "solid 2px #222");
		$("div#shipping_cnt_right > div.purchase_count").css("color", "#f15746");
		$("div#shipping_cnt_right > div.shipping_status").css({ "font-weight": "700", "color": "#222" });
		$("div#show_shipping").hide();
		$("div#show_shipping_completed").show();

		// div가 클릭되면 select 해오기 위해 사용되는 배송중 상태를 input태그(type="hidden")에 값 넣기
		$("div#status_button> input#input_shipping").val("1");
		
		callAjax(start);

	});

	//구매일 버튼 클릭시 아이콘 변경 
	$("button#btn_purchaseDate").click(function(e) {

		
		 $("div#show_shipping").empty();           // append 된 상품들 삭제 
         $("div#show_shipping_completed").empty(); // append 된 상품들 삭제 
		
		
		let sort = $("input#sort_date");

		$("button.result_detail").css("font-weight", "");
		$("button#btn_purchaseDate").css("font-weight", "bold");

		if ($("button#btn_purchaseDate > i").hasClass("fa-sort-up")) {
			$("button#btn_purchaseDate > i").removeClass("fa-sort-up").addClass("fa-sort-down");
			$("input#sort_date").val("desc");
			alert(sort.val());
		
		}
		else {
			$("button#btn_purchaseDate > i").removeClass("fa-sort-down").addClass("fa-sort-up");
			sort.prop('value', "desc");
			$("input#sort_date").val("asc");
			alert(sort.val());
		
		}
		// sort.val()에 저장된  asc / desc 전달
		callAjax(start);
	});

	// 최근 2개월, 4개월 , 6개월 버튼 클릭시 ===========================================================
	// 최근 2개월 버튼 클릭시 발생하는 이벤트
	$("button#two_month").click(function(e) {
		// alert("최근 2개월 버튼 클릭시");
		$('input#start_date').datepicker('setDate', '-2M');
		$('input#end_date').datepicker('setDate', 'today');
		$("button#search_simple").trigger('click'); // 조회버튼 클릭 
	

	});

	// 최근 4개월 버튼 클릭시 발생하는 이벤트
	$("button#four_month").click(function(e) {
		// alert("최근 4개월 버튼 클릭시");
		$('input#start_date').datepicker('setDate', '-4M');
		$('input#end_date').datepicker('setDate', 'today');
		$("button#search_simple").trigger('click'); // 조회버튼 클릭 

	});

	// 최근 6개월 버튼 클릭시 발생하는 이벤트
	$("button#six_month").click(function(e) {
		// alert("최근 6개월 버튼 클릭시");
		$('input#start_date').datepicker('setDate', '-6M');
		$('input#end_date').datepicker('setDate', 'today');

		$("button#search_simple").trigger('click'); // 조회버튼 클릭 

	});
	// 최근 2개월, 4개월 , 6개월 버튼 클릭시 ===========================================================


	// 날짜 입력 후 조회 버튼클릭시
	$("button#search_simple").click(function(e) {
		$("div#show_shipping").empty(); // div 초기화 
			$("div#show_shipping_completed").empty();	// div 초기화 
			$("span#countHIT").text("0");
		
		callAjax(start);
	});

	// 태블릿, 모바일에서 기간 조회 버튼 클릭시 
	$("button#search_date").click(function(e) {
		// 선택된 option 태그 value 갖고오기
		let date_selected = $("select#select_month option:selected").val();

		// 올바른 기간이 선택된 경우에만 기간조회 진행 
		if (date_selected != '기간선택') {

			let year = date_selected.substring(0, 4);
			
			let month = date_selected.substring(6, date_selected.indexOf("월"));
			if(month < 10){
				month = "0"+month;
			}
			
			// 해당 월의 마지막일 구하기 
			var date = new Date(year, month, 0);
			date.getDate(); //마지막 날짜
			
			// console.log("확인용"+month+"월의 마지막 날짜 : "+date.getDate());
			
			start_date = year+"/"+month+"/01";
			end_date = year+"/"+month+"/"+date.getDate();
			
			$("input#start_date").val(start_date);
			$("input#end_date").val(end_date);
			
			// alert("모바일에서 start_date => "+start_date);
			// alert("모바일에서 end_date => "+end_date);
		}
		$("button#search_simple").trigger("click");
	});

	// select 태그 클릭 클릭시 기간선택 option hidden 처리하기
	$("select#select_month").click(function(e) {
		$("select#select_month").children("option[value='기간선택']").prop("hidden", true);
	});


	/* 사이드바 script 시작 */
	$("div.category-section > ul > li").click(function(e) {
		//  클릭할 경우 글자 css 변경
		alert("클릭됨.");
		$("div.category-section > ul > li > a").css({ "font-weight": "", "color": "" });
		$(e.target).css({ "font-weight": "700", "color": "black" });
	});
	/* 사이드바 script 끝  */


	/* 현재 날짜 구하기 */
	let today = new Date();

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월

	/* 모바일 화면에서 기간선택 클릭 시 나오는 년도/월 현재날짜 기준으로 입력 */
	for (let i = 2; i < 9; i++) {
		$("select#select_month > option:nth-child(" + i + ")").text(year + "년 " + (month - (i - 2)) + "월");
	}

});// end of $(document).ready(function()----------------------------------

</script>








<div id="purchase_list" class="mt-4">
	<%-- 내용물 시작 --%>

	<%-------------------- 사이드바 시작 ----------------------%>
	<script>
   $(document).ready(function(){
	   $("div#shipping_cnt_left").trigger("click"); 
	   
      /* 사이드바 script 시작 */
      $("div.category-section > ul > li").click(function(e){
         //  클릭할 경우 글자 css 변경
         alert("클릭됨.");
         $("div.category-section > ul > li > a").css({"font-weight":"","color":""});
         $(e.target).css({"font-weight":"700","color":"black"});
      });
      /* 사이드바 script 끝  */

   });// end of $(document).ready(function()----------------------------------


   function callAjax(start) {
	  
   	// 결과 값 찍어주는 ajax
   	$.ajax({
   		url: getContextPath()+"/member/buylistView.dream",
   		type: "GET",
   		data: {"end_date": $("input#start_date").val(),
   			   "start_date": $("input#end_date").val(),
   			   "input_shipping": $("input#input_shipping").val(),
   			   "sort": $("input#sort_date").val(),
   			   "userid": $("input#userid").val(),
   			   "start":start,
   			   "lenHIT":lenHIT},
   		dataType: "json",
   		success: function(json) {
   			
   			
   			
   			let html =" ";
   			
   			// 조회결과가 업는 경우 
   			if(start == "1" && json.length == 0){
   				$("div#show_shipping").empty(); // div 초기화 
   				$("div#show_shipping_completed").empty();	// div 초기화 
   				$("div#no_result").html("거래 내역이 없습니다.");
   				$("button#btnMoreHIT").hide();
   			}
   			// 조회결과가 있는 경우 
   			else if(json.length > 0){
   				
   				$("button#btnMoreHIT").show();
   				
   				$("div#no_result").html("");
   				
   				 $.each(json, function(index, item){
   					$("span#totalHITCount").text(item.totalListCnt);
   					html += "<div class='purchase_item my-1' style=' border-bottom: solid 1px #ebebeb; border-top: solid 1px #ebebeb;'>"+
   		                     "<div id='purchase_detail'  class='d-flex'>"+
   		                        "<div class='image_box' style='line-height: 110px;'>"+
   		                           "<img id ='' class='product_img' src='' alt='...'>"+
   		                        "</div>"+
   		                        "<div id = 'name_cnt'>"+
   		                           "<div class='item_name'> "+item.product_name+" </div>"+
   		                           "<div class='purchase_cnt'> 구매수량"+item.buy_cnt+" </div>"+
   		                        "</div>"+
   		                     "</div>"+
   		                     "<div id='date_status'>"+
   		                        "<div>"+
   		                           "<span id='purchase_status'>"+item.shipping+"</span>"+ 
   		                        "</div>"+
	   		                     "<div>"+
		                           "<span id='purchase_date'>"+item.buy_date+"</span><br>"+
		                         "</div>"+
   		                     "</div>"+
   		               "</div>";
   		               
   				 })// end of $.each(json, function(index, item){}---------------------------
   			
   				//$("div#show_shipping").empty(); // div 초기화 
   				//$("div#show_shipping_completed").empty();		
   				
   				// 배송상태에 따라 다른 div에 append ///
   				if($("input#input_shipping").val()==0){
   					$("div#show_shipping_completed").empty();	
   					$("div#show_shipping").append(html); // div 값 입력
   					
   				}
   				else if($("input#input_shipping").val()==1){
   					$("div#show_shipping").empty(); // div 초기화 
   					$("div#show_shipping_completed").append(html); // div 값 입력
   				}
   					
   			 // HIT 상품 결과를 출력하기
		    	// >>> !!! 중요 !!! 더보기... 버튼의 value 속성에 값을 지정하기 <<< //
				$("button#btnMoreHIT").val( Number(start) + lenHIT);
				
				// span#countHIT 에 지금까지 출력된 상품의 개수를 누적해서 기록한다.
				$("span#countHIT").text( Number($("span#countHIT").text()) + json.length );
				
				// 더보기... 버튼을 계속해서 클릭하여 countHIT 값과 totalHITCount 값이 일치하는 경우 
				if( $("span#countHIT").text() == $("span#totalHITCount").text() ) {
					$("button#btnMoreHIT").text("처음으로");
					$("span#countHIT").text("0");
				}
   				
   				
   			}
   		}, // end of success
   		error: function(request, status, error) {
   			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
   		}
   	});// end of ajax(){};===========================================================
   				 
   	// 결과 값 찍어주는 ajax
   				 
   }// end of function callAjax() {}-----------------------



	   
</script>


	</head>
	<body>

		<!-- 내용물 시작 -->

		<!-- 사이드바 시작 -->
		<div id="sidebar" class="sidebar ml-5" style="width: 180px;">
			<div>
				<h4 class="mb-4" style="font-weight: bold;">
					<a href="<%=ctxPath%>/member/mypage.dream">마이 페이지</a>
				</h4>

			</div>

			<div class="category-section mb-5">
				<h5 class="category-title font-weight-bold">쇼핑 정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>/member/buylist.dream">구매 내역</a></li>
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>/cart/cart.dream">관심 상품</a></li>
				</ul>
			</div>

			<div class="category-section">
				<h5 class="category-title font-weight-bold">내 정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>/member/myInfo.dream">프로필 정보</a></li>
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>#####">주소록</a></li>
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>######">결제정보</a></li>
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>/member/point.dream">포인트</a></li>
					<li class="nav-item"><a class="nav-link pl-0 color_gray"
						href="<%=ctxPath%>/member/membership.dream">멤버십 정보</a></li>
				</ul>
			</div>
		</div>
		<!-- 사이드바 끝 -->





		<%-------------------- 사이드바 끝 ----------------------%>


		<%-- 구매내역 시작  --%>
		<div id="purchase" class="container">
			<form name="purchaseFrm">
				<div id="content_title">
					<strong style="font-size: 24px;">구매 내역</strong>
				</div>


				<%-- 상단 진행중, 종료 버튼 시작 --%>
				<div id="status_button">
					<input type="hidden" id="input_shipping" name="input_shipping" value="0" /> 
					<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}" readonly />

					<div id="shipping_cnt_left" class="shipping_cnt">
						<div id="sipping_count" class="purchase_count">${requestScope.orderCntMap.shipping}</div>
						<div id="shipping" class="shipping_status">진행중</div>
					</div>

					<div id="shipping_cnt_right" class="shipping_cnt">
						<div id="shipping_end_count" class="purchase_count">${requestScope.orderCntMap.shipping_end}</div>
						<div id="shipping_completed" class="shipping_status">종료</div>
					</div>

				</div>
				<%-- 상단 진행중, 종료 버튼 끝 --%>



				<%-- 기간조회 시작 --%>
				<div id="date_button" style="display: flex">
					<button type="button" id="two_month" class="btn_month">최근 2개월</button>
					<button type="button" id="four_month" class="btn_month">4개월</button>
					<button type="button" id="six_month" class="btn_month">6개월</button>

					<div id="from_date" class="input_date">
						<input type="text" name="start_date" id="start_date" style="width: 120px;"value =""></input>~
					</div>

					<div id="to_date" class="input_date">
						<input type="text" name="end_date" id="end_date" style="width: 120px;" value="">
					</div>

					<button type="button" id="search_simple">조회</button>
					<button type="button" id="search_date">기간조회</button>

				</div>
				<%-- 기간조회 끝 --%>



				<%-- 모바일 화면에서 기간 선택 시작 --%>
				<select name="month" id="select_month" class="container" >
					<option value="기간선택">기간선택</option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
					<option></option>
				</select>
				<%-- 모바일 화면에서 기간 선택 끝 --%>

				<hr style="background-color: #ebebeb;">

				<div id="result" class="my-4">
					<ul>
						<li class="result_notice">한 번에 조회 가능한 기간은 최대 6개월입니다.</li>
						<li class="result_notice">기간별 조회 결과는 입찰일 기준으로 노출됩니다.</li>
					</ul>

					<%-- 구매일, 상태 버튼 시작 --%>
					<div id="result_buttons">
						<%-- 전체버튼 일단 비활성화 --%>
						<%-- <button id="total">전체 <i class="fa-sharp fa-solid fa-caret-down"></i></button> --%>

						<div id="sort">
							<%-- 여기 input 태그 name 은 테이블의 컬럼? 오름차순, 내림차순 여부 , 진행중, 상태 --%>
							<button type="button" id="btn_purchaseDate" class="result_detail">
								<input id="sort_date" name="sort" type="hidden" value="" />구매일<i class="fas fa-duotone fa-sort-up"></i>
							</button>
							<%-- <button type="button" id="btn_purchaseStatus" class="result_detail"><input id="sort_status" name="status" type="hidden" value="진행중"/> 상태<i class="fas fa-duotone fa-sort-up"></i></button>--%>
						</div>
					</div>
			</form>
			<%-- 구매일, 상태 버튼 끝 --%>



			<%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력  --%>
			<div id="no_result" class="text-center my-5" style="color: #22222280; font-size: 13;"></div>
			<%-- jsp 넘어가서 조건문 넣어서 제품이 없을경우 거래 내역이 없습니다 출력 끝  --%>

			<%-- 진행중 클릭시 보여줄 div --%>
			<div id="show_shipping">

			
			</div>
			<%-- 진행중 클릭시 보여줄 div 끝--%>


			<%-- 종료 클릭시 보여줄 div --%>
			<div id="show_shipping_completed">
			
			</div>
			<%-- 종료 클릭시 보여줄 div 끝--%>
			
		<%-- 페이지바 넣기 시작  --%>
			<button type="button" id="btnMoreHIT" value="">더보기</button>
			<span id="totalHITCount"></span>
            <span id="countHIT">0</span>
		<%-- 페이지바 넣기 끝  --%>

		</div>
		<%-- 구매내역 끝  --%>
</div>
<%-- 내용물 끝 --%>
</div>

</body>




<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />