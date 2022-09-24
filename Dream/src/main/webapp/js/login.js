
$(document).ready(function(){
        // 이메일 주소 클릭시 
         $("input#input_userid").focus((e)=>{
            $(e.target).css("outline","none");
            $(e.target).attr("placeholder"," ");
         });
         // 이메일 주소 커서 상실시 
         $("input#input_userid").blur((e)=>{
            $(e.target).css({"border":"","border-bottom":""});
            $(e.target).attr("placeholder","예)dream@dream.co.kr");
         });
         
         // 비밀번호 클릭시 
         $("input#input_passwd").focus((e)=>{
            $(e.target).css("outline","none");
            $(e.target).attr("placeholder"," ");
         });
         // 비밀번호 커서 상실시 
         $("input#input_passwd").blur((e)=>{
            $(e.target).css({"border":"","border-bottom":""});
         });


      });// end of $(document).ready(function(){=======
getContextPath();

$(document).ready(function() {
	// 이메일 주소 클릭시 
	$("input#input_userid").focus((e) => {
		$(e.target).css("outline", "none");
		$(e.target).attr("placeholder", " ");
	});
	// 이메일 주소 커서 상실시 
	$("input#input_userid").blur((e) => {
		$(e.target).css({ "border": "", "border-bottom": "" });
		$(e.target).attr("placeholder", "예)dream@dream.co.kr");
	});

	// 비밀번호 클릭시 
	$("input#input_passwd").focus((e) => {
		$(e.target).css("outline", "none");
		$(e.target).attr("placeholder", " ");
	});
	// 비밀번호 커서 상실시 
	$("input#input_passwd").blur((e) => {
		$(e.target).css({ "border": "", "border-bottom": "" });
	});


	$("button#login").click(function(e) {
		goLogin();
	});


});// end of $(document).ready(function(){}


// 로그인 처리 해주는 함수 
function goLogin(){
	//	alert("로그인 시도함");
	
		const input_userid = $("input#input_userid").val().trim();
	    const input_passwd = $("input#input_passwd").val().trim();
	    
	    if(input_userid == "") {
	    	alert("아이디를 입력하세요!!");
	    	$("input#input_userid").val("");
	    	$("input#input_userid").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    if(input_passwd == "") {
	    	alert("암호를 입력하세요!!");
	    	$("input#input_passwd").val("");
	    	$("input#input_passwd").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    /*
	    	// 아이디 저장시 localStroage 에 저장
		    if( $("input:checkbox[id='saveid']").prop("checked") ) {
		    	localStorage.setItem('saveid', $("input#loginUserid").val());	
		    }
		    else {
		    	localStorage.removeItem('saveid');
		    }
	    */
	    
	    const joinFrm = document.joinFrm; 
	    joinFrm.action = getContextPath()+"/login/login.dream";
	    joinFrm.method = "POST";
	    joinFrm.submit();
		
	}// end of function goLogin()-----------------
	
	
	
function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}

