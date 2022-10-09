
function goEdit() {
	
	$('#info_edit').modal('show');
}



function delete_confirm() {
		
	var result = confirm("정말로 삭제하시겠습니까 ??");
	
	if(result == true) {
		
		var link = 'http://localhost:9090/Dream/admin/ad_member/memberManage.dream';
	    location.href=link;

	}
	else {
		alert("취소하셨습니다.")
	}
	
		
}




$(document).ready(function(){
	
	
	$("span.name_error").hide();
	
	
	
	$("input#username").blur( (e)=>{
    	
    	const $target = $(e.target);
    	
    	
    	
    	const recipient_name = $target.val().trim();
    	if(recipient_name == "") { 
    		// 입력하지 않거나 공백만 입력했을 경우 
    		$(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.name_error").show();  //에러문구
	        $("#username.input").css("color","red");  //라벨 빨간색         	        	        
			
    	}
    	else {
    		$("span.name_error").hide();     		
    		$(e.target).css("border-bottom","solid 1px #ebebeb");
    		
    	}
    	
    });  
    
    
    
    
    
    
     $(document).on("keyup","input#username",function(e) { // 성명 2글자 이상 50글자 이하 유효성 검사 처리

		
		
	    const regExp = /^.{2,50}$/;

	    const bool = regExp.test( $(e.target).val() );       


	    if(!bool) {
	        $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
	        $("span.name_error").show();  //에러문구
	        
	        
	        
	        
	       
	        
	    }
	    else {
	        $(e.target).css("border-bottom","solid 1px #ebebeb");
	        $("span.name_error").hide();
	        $("#username").css("color","black");  
	        
	       
	        
	    }

	});// end of $(document).on("keyup","input#recipient_name",function(e) {
		
		
		
	
	
	
	
});	