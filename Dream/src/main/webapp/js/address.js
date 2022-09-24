$(document).ready(function(){
	
	
	
	/* 모달창이 열리면 이름입력부분에 오토포커스를 주는 기능  */
	$('div#add_address').on('shown.bs.modal', function() {	
		
		$("span.name_error").hide();
		$("span.mobile_error").hide();
	    $('input#recipient_name').trigger('focus');
	    
	    
	    
	    
	    
	    /*
	    저장하기 버튼 활성화 기능
	    
	    $( 'a.btn.btn_save.solid.medium.disabled' ).removeClass( 'disabled' );	    	    	    
	    $( "#add_address > div > div.layer_btn > a.btn.btn_save.solid.medium" ).attr("disabled", false);  
	    */
	    
	});  
	


	
	$("input#recipient_name").blur( (e)=>{
    	
    	const $target = $(e.target);
    	
    	
    	
    	const recipient_name = $target.val().trim();
    	if(recipient_name == "") { 
    		// 입력하지 않거나 공백만 입력했을 경우 
    		$(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.name_error").show();  //에러문구
	        $("#name").css("color","red");  //라벨 빨간색 
	        
	          
	        $("#add_address > div :input").prop("disabled", true);
	        $target.prop("disabled", false);
	        	        	        
			
    	}
    	else {
    		$("#add_address > div :input").prop("disabled", false);
    	}
    	
    });  
    
    
	$("input#mobile").blur( (e)=>{
    	
    	const $target = $(e.target);
    	
    	const mobile = $target.val().trim();
    	
    	if(mobile == "") {
    		// 입력하지 않거나 공백만 입력했을 경우 
    		$(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.mobile_error").show();  //에러문구
	        $("#mobile").css("color","red");  //라벨 빨간색 
	        
	        $("#add_address > div :input").prop("disabled", true);
	        $target.prop("disabled", false);
	        
	        
    	}
    	else {
    		$("#add_address > div :input").prop("disabled", false);
   	}
    	
	});  
	
	
	
	
$(document).on("keyup","input#recipient_name",function(e) { // 성명 2글자 이상 50글자 이하 유효성 검사 처리

		
		
	    const regExp = /^.{2,50}$/;

	    const bool = regExp.test( $(e.target).val() );       


	    if(!bool) {
	        $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.name_error").show();  //에러문구
	        $("#name").css("color","red");  //라벨 빨간색 	        	        
	        
	        $("#add_address > div :input").prop("disabled", true);
	        $target.prop("disabled", false);
	        
	        
	    }
	    else {
	        $(e.target).css("border-bottom","");  
	        $("span.name_error").hide();
	        $("#name").css("color","black");  
	        
	        
	        
	    }

	});// end of $(document).on("keyup","input#recipient_name",function(e) {

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	$(document).on("keyup","input#mobile",function(e) { // 010 을 필수로 포함하면서 11자리 숫자를 입력해야하는 유효성 검사

		const regExp = /^[0]{1}[1]{1}[0]{1}[0-9]{8}$/;

	    const bool = regExp.test( $(e.target).val() );       


	    if(!bool) {
	        $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.mobile_error").show();  //에러문구
	        $("#mobile").css("color","red");  //라벨 빨간색 
	        
	    }
	    else {
	        $(e.target).css("border-bottom","");  //빨간색 밑줄
	        $("span.mobile_error").hide();
	        $("#mobile").css("color","black");  //라벨 빨간색 
	        
	        
	        
	    }

	});// end of $(document).on("keydown","input#modify_name",function(e) {}

	
	

			

});	// end of $(document).ready(function(){} -------------------------------	
		
		
/* 새 배송지 추가 버튼을 클릭시 모달창에있는 내용들을 초기화 해주는 기능  */
function new_add() {

    $("h2.title2").hide();
    $("h2.title1").show();	
    
  
   
    $("div.input_item > input").val("");
    $("span.name_error").hide();
	$("span.mobile_error").hide();
	$("#name").css("color","black");
	$("#mobile").css("color","black");
	$("div.input_item > input").css("border-bottom","solid 1px #ebebeb"); 
	
}// end of function new_add() {}-----------------------
	

/* 수정 버튼을 클릭시 모달창에있는 내용들을 초기화 해주는 기능  */
function Revise_add() {

    $("h2.title1").hide();	
    $("h2.title2").show();
    
    
    $("div.input_item > input").val("");
    $("span.name_error").hide();
	$("span.mobile_error").hide();
	$("#name").css("color","black");
	$("#mobile").css("color","black");
	$("div.input_item > input").css("border-bottom","solid 1px #ebebeb"); 

}// end of function Revise_add() {}------------------------
	



	
	
	

    
    
    
    
	


	





/* 모달에서 우편번호 버튼 클릭시 다음주소검색을 띄워주는 기능  */
function openDaumPOST() {
	
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress; 
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다. 
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }                
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
            
        }
		
    }).open();    	
	
}// end of function openDaumPOST() {}------------------------------------