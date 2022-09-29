$(document).ready(function() {

	// 비밀번호 정규표현식 
	// const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);

	// 아이디 정규표현식 
	// const regExp= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


	$("span.warning").css("display","none");
	// 이메일 주소 클릭시 
	/*$("input#input_userid").focus((e) => {
		$(e.target).css("outline", "none");
		$(e.target).attr("placeholder", " ");
	});
	// 이메일 주소 커서 상실시 
	$("input#input_userid").blur((e) => {
		$(e.target).css({ "border": "", "border-bottom": "" });
		$(e.target).attr("placeholder", "예)dream@dream.co.kr");
	});*/

	// 아이디 입력받을때마다 정규표현식을 통한 유효성 검사
	$("input#input_userid").keydown(function(e) {
		const userid = $("input#input_userid").val();
		const regExp = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

		if (!regExp.test(userid)) {
			$("input#input_userid").css("border-bottom", "solid 1px red");  //빨간색 밑줄
			$("span#email_warning").css("display","block");  //에러문구
			$("div#div_userid>label").css("color", "red");  //이메일주소 문구 빨간색
		}
		else {
			$("span#email_warning").css("display","none");   //에러문구
			$("div#div_userid>label").css("color", "");      //이메일주소 문구 빨간색
			$(e.target).css({ "border": "", "border-bottom": "" });
	
			$("input#input_userid").focus((e) => {
				$(e.target).css("outline", "none");
				$(e.target).attr("placeholder", " ");
			});
			// 이메일 주소 커서 상실시 
			$("input#input_userid").blur((e) => {
				$(e.target).css({ "border": "", "border-bottom": "" });
				$(e.target).attr("placeholder", "예)dream@dream.co.kr");
			});
		}


	});


	// 비밀번호 클릭시 
	/*$("input#input_passwd").focus((e) => {
		$(e.target).css("outline", "none");
		$(e.target).attr("placeholder", " ");
	});
	// 비밀번호 커서 상실시 
	$("input#input_passwd").blur((e) => {
		$(e.target).css({ "border": "", "border-bottom": "" });
	});*/


	// 비밀번호 입력받을때마다 정규표현식을 통한 유효성 검사
	$("input#input_passwd").keydown(function(e) {
		const passwd = $("input#input_passwd").val();
		const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;

		if (!regExp.test(passwd)) {
			$(e.target).css("border-bottom", "solid 1px red");  //빨간색 밑줄
			$("span#pwd_warning").css("display","block");       //에러문구
			$("div#div_passwd>label").css("color", "red");      //비밀번호 빨간색
		}
		else {
			$(e.target).css({ "border": "", "border-bottom": "" });
			$("span#pwd_warning").css("display","none"); 
			$("div#div_passwd>label").css("color", "");  

			$("input#input_passwd").focus((e) => {
				$(e.target).css("outline", "none");
				$(e.target).attr("placeholder", " ");
			});
			// 비밀번호 커서 상실시 
			$("input#input_passwd").blur((e) => {
				$(e.target).css({ "border": "", "border-bottom": "" });
			});
		}

	});




	$("button#login").click(function(e) {
		goLogin();
	});

});// end of $(document).ready(function(){}


// 로그인 처리 해주는 함수 
function goLogin() {
	//	alert("로그인 시도함");

	const input_userid = $("input#input_userid").val().trim();
	const input_passwd = $("input#input_passwd").val().trim();

	if (input_userid == "") {
		alert("아이디를 입력하세요!!");
		$("input#input_userid").val("");
		$("input#input_userid").focus();
		return; // goLogin() 함수 종료
	}

	if (input_passwd == "") {
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
	joinFrm.action = getContextPath() + "/login/login.dream";
	joinFrm.method = "POST";
	joinFrm.submit();

}// end of function goLogin()-----------------


function getContextPath() {
	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	let contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath;
}

