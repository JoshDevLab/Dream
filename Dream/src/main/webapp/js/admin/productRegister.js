

$(document).ready(function() {

	$("span.error").hide();
	$("tr#tr_gender").hide();
	
	$("input:radio[id='no_gender']").attr("checked", true);

	
	// 대 카테고리 파자마에서 파자마 클릭시 성별 항목 출력 (없을 경우 기본값 "없음")
	$("select[name=category]").change(function(e){
		
		 // alert("select 태그 값 변경됨");
		
		let html ="";
		
		if($("select[name=category]").val()=="1"){
			$("select[name=detail_category]").empty();
			$("tr#tr_gender").hide();
			html =	"<option class=''detail_category'' value=''>상세카테고리</option>"+
					"<option value='1'>매트리스</option>"+
					"<option value='2'>베개</option>"+
					"<option value='3'>베개커버</option>"+
					"<option value='4'>이불</option>"+
					"<option value='5'>침대</option>"+
					"<option value='6'>침대커버</option>";
			$("select[name=detail_category]").append(html);
		}
		else if($("select[name=category]").val()=="2"){
			$("select[name=detail_category]").empty();
			$("tr#tr_gender").hide();
			
			html =	"<option class=''detail_category'' value=''>상세카테고리</option>"+
					"<option value='1'>캔들</option>"+
					"<option value='2'>안대</option>"+
					"<option value='3'>필로우미스트</option>";
			$("select[name=detail_category]").append(html);
			
			
		}
		
		else if($("select[name=category]").val()=="3"){
			$("select[name=detail_category]").empty();
			$("tr#tr_gender").show();
			
			html =	"<option class=''detail_category'' value=''>상세카테고리</option>"+
					"<option value='1'>수면잠옷</option>"+
					"<option value='1'>동물잠옷</option>"+
					"<option value='1'>커플파자마</option>";
			$("select[name=detail_category]").append(html);
		}
		
		else if($("select[name=category]").val()=="4"){
			$("select[name=detail_category]").empty();
			$("tr#tr_gender").hide();
			html =	"<option class=''detail_category'' value=''>상세카테고리</option>"+
					"<option value='1'>장스탠드</option>"+
					"<option value='2'>북라이트</option>"+
					"<option value='3'>무드등</option>"+
					"<option value='4'>LED양초</option>";
			$("select[name=detail_category]").append(html);
		}
	});



	// 제품수량입력에 스피너 달아주기
	$("input#spinnerPqty").spinner({
		// spinner에 1 이상만 입력받도록
		spin: function(event, ui) {
			if (ui.value > 500) {
				$(this).spinner("value", 500);
				return false;
			}
			else if (ui.value < 1) {
				$(this).spinner("value", 1);
				return false;
			}
		}
	});// end of $("input#spinnerPqty").spinner({ }-------------------------------



	
	// 등록버튼 클릭시 비어있는 input 태그 경고 문구 표시 
	$("button#btnRegister").click(function(){
		alert("확인용 등록버튼 클릭됨");
			
		let flag = false;	
		
		$(".infoData").each(function(){
			const val = $(this).val().trim();
			if(val == ""){
				$("span.error").hide();
				$(this).next().show();
				flag = true;
				return false;
			}
		});
		if(!flag) {
			const frm = document.prodInputFrm;
			frm.submit();
		}
		
	});
	
	
	
	
	// 취소 버튼 클릭시 경고 문구 숨기기
	$("input[type=reset]").click(function(){
		$("span.error").hide();
		// $("div#divfileattach").empty();
	});


});