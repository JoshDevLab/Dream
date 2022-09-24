$(document).ready(function() {

	$("a.btn_find").removeAttr("href");

	// input 태그 클릭시 아래 테두리 진하게 
	$("input#mobile").click(function(e) {
		$(e.target).css("border-bottom", "solid 2px black");
	});

	// input 태그 클릭시 아래 테두리 원래대로 
	$("input#mobile").blur(function(e) {
		$(e.target).css("border-bottom", "solid 2px #ebebeb");
	});

	// input 태그 값 변경될때마다 정규표현식을 이용한 값 검사
	$("input#mobile").keyup(function(e) {
		$("a.btn_find").css({ "background-color": "", "color": "" });

		const mobile = $("input#mobile").val();

		const regExp = /^[0]{1}[1]{1}[0]{1}[0-9]{7,8}$/;
		const bool_mobile = regExp.test(mobile);

		console.log("값이 변경됨");
		if (bool_mobile) {
			$("a.btn_find").css({ "background-color": "black", "color": "white" });
			$("a.btn_find").attr("href", "#여기에 find 이메일 ");
		}
		else {
			$("a.btn_find").css({ "background-color": "", "color": "" });
		}
	});

	// 사용자 정보가 일치하지 않을경우 호출하는 함수 
	// showNotification();

	// 경고창 보이기 
	const notification = $("div#notfound_notice");

	const showNotification = () => {
		notification.addClass('show');
		setTimeout(() => {
			notification.removeClass('show');
		}, 1000)
	}

});// end of $(document).ready(function(){}---------------------