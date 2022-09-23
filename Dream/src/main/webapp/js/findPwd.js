$(document).ready(function() {

	$("div.warning").hide();

	let bool = false;
	let bool_mobile = true;
	let bool2 = true;
	let bool_email = true;

	$("input#mobile").click(function(e) {
		$("input#mobile").css("border-bottom", "solid 2px black");
	});

	$("input#mobile").blur(function(e) {
		$("input#mobile").css("border-bottom", "");
	});

	if (bool) {
	}
	else {
		// 핸드폰번호 정규표현식 css
		$("input#mobile").keyup(function(e) {

			const mobile = $("input#mobile").val();
			const regExp = /^[0]{1}[1]{1}[0-1]{1}[0-9]{7,8}$/;
			bool_mobile = regExp.test(mobile);

			// console.log($("input#mobile").val().length);
			// console.log(bool_mobile);
			bool = bool_mobile;

			if (bool_mobile) {
				$("div#mobile_warning").hide();
				$("div#div_mobile").removeClass("changeColor_red");
				$("input#mobile").css("border-bottom", "");
			} else {
				//  유효성검사 틀렸을때!
				$("div#mobile_warning").show();
				$("div#div_mobile").addClass("changeColor_red");
				$("input#mobile").css("border-bottom", "solid 1px #f15746");

			}
		});
	}


	$("input#email").click(function(e) {
		$("input#email").css("border-bottom", "solid 2px black");
	});

	$("input#email").blur(function(e) {
		$("input#email").css("border-bottom", "");
	});
	if (!bool2) {
	}
	else {
		// 핸드폰번호 정규표현식 css
		$("input#email").keyup(function(e) {

			const email = $("input#email").val();
			const regExp2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			bool_email = regExp2.test(email);

			// console.log($("input#email").val().length);
			// console.log(bool_email);
			bool2 = bool_email;

			if (bool_email) {
				$("div#email_warning").hide();
				$("div#div_email").removeClass("changeColor_red");
				$("input#email").css("border-bottom", "");
			} else {
				//  유효성검사 틀렸을때!
				$("div#email_warning").show();
				$("div#div_email").addClass("changeColor_red");
				$("input#email").css("border-bottom", "solid 1px #f15746");
			}

			if (bool_mobile && bool_email) {
				alert("확인용 정규표현식 핸드폰, 이메일 통과 ");
				$("a.btn_find").css("background-color", "black");
			}
			else {
				$("a.btn_find").css("background-color", "#ebebeb");
			}

		});
	} // end of if~ else 



});// end of $(document).ready(function(){}---------------------