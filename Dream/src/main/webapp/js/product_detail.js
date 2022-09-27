let objNo = 0;
let optionArray =[];
function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}


isLargerThan960 = false;

// Function Declaration

function checkVisible( elm, eval ) {
    eval = eval || "object visible";
    var viewportHeight = $(window).height(), // Viewport Height
        scrolltop = $(window).scrollTop(), // Scroll Top
        y = $(elm).offset().top,
        elementHeight = $(elm).height();   
    
    if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
    if (eval == "above") return ((y < (viewportHeight + scrolltop)));
}

function isLargerThan960Check (){
    if($(window).width() > 960) { 		
      isLargerThan960	= true;
    } 
    else{
      isLargerThan960 = false;
    }
    // console.log(isLargerThan960);
    // console.log($(window).width());
    // console.log("크기변경!");

  }

  

$.fn.Scrolling = function(obj, tar) {
// 리사이징 시작       
$(window).resize(function() {
$("#productImage").removeClass("fixed");
isLargerThan960Check ();

console.log(isLargerThan960);
if(isLargerThan960){
  // 화면 크기가 960 이상일때만
  // console.log(isLargerThan960);
  if(($(window).scrollTop() >= obj) ){
    $("#productImage").addClass("fixed");
    $("#productImage").css("padding-top",0);
  }
}
else{
  $("#productImage").removeClass("fixed");
}  

if($(window).scrollTop() >= end && isLargerThan960){
  $("#productImage").css("padding-top",tar);
  $("#productImage").removeClass("fixed");
  
} 


if (checkVisible($('a#column2_btn_wish'))) {
  $('div.floating_price').css("display","none");
}
else{
  $('div.floating_price').css("display","flex");
}
});
// 리사이징 끝


// 스크롤 이벤트


var end = obj + tar;

$(window).scroll(function(e) {
isLargerThan960Check ();
// isLargerThan960Check



// console.log(checkVisible($('a#column2_btn_wish')));
// 관심등록 보이는가 체크용

// column2 의 관심등록버튼이 보이지 않으면 상단에 플로팅바 나오도록
if (checkVisible($('a#column2_btn_wish'))) {
  $('div.floating_price').css("display","none");
}
else{
  $('div.floating_price').css("display","flex");
} 

// 캐러셀 fixed 적용/해제
/*console.log(isLargerThan960);
*/
if(isLargerThan960){
// 화면 크기가 960 이상일때만
// console.log(isLargerThan960);
if(($(window).scrollTop() >= obj) ){
  $("#productImage").addClass("fixed");
  $("#productImage").css("padding-top",0);
}
}
else{
$("#productImage").removeClass("fixed");
}  

if($(window).scrollTop() >= end && isLargerThan960){
$("#productImage").css("padding-top",tar);
$("#productImage").removeClass("fixed");

} 



});
};  



$(document).ready(function() {
	    
	
	optionArray =[];

	
	

	// 제품 페이지 로딩에 필요한 값들 가져오기
	 


	$("#productImage").Scrolling(0 , ($("#column_2").height() - $("#productImage").height()-16));
	// 마지막 p 타입의 마진 16을 더빼줘야 글이랑 위치가 맞음




	$('a.dropdown-item').click(function(e){
		
		const $target = $(e.target);
		const ProductOption= $target.text();
		let alreadyExist = false;
		
		
		if(optionArray.length>0){
			
			optionArray.forEach((item, index)=>{
				
				if(item == ProductOption){
				// 
					alert("이미 선택한 옵션입니다. 고르신 옵션의 수량을 1 추가하였습니다.");
					Selected = $(`div#optionSelected`).children().eq(index);
					
					SelectedAmount = parseInt(Selected.find("span#optionAmount").text())+1;
					alreadyExist = true;
					Selected.find("span#optionAmount").text(SelectedAmount)	;
				}
		
			});	
			if(!alreadyExist){
				// 반복문 끝나고도 중복이 없다면
				
				$("div#optionSelected").append(
				`<div id='added_option'>
					<span id="optionAmount">1</span>
					<span id="optionName">${ProductOption}</span>
					<button id="deleteObj${objNo}" class="btn">x</button>
					<button id="minus${objNo}" class="btn">-</button>
					<button id="plus${objNo}" class="btn">+</button>
				</div>`);			
				
				calcbutton(objNo);
				objNo++;	
				optionArray.push(ProductOption);
				alreadyExist = false;
				
				
			}
			
		
		}//end of if(optionArray.length>0){} -------		
		else{	
			
			$("div#optionSelected").append(
				`<div id='added_option'>
					<span id="optionAmount">1</span>
					<span id="optionName">${ProductOption}</span>
					<button id="deleteObj${objNo}" class="btn">x</button>
					<button id="minus${objNo}" class="btn">-</button>
					<button id="plus${objNo}" class="btn">+</button>
				</div>`);	
			
			calcbutton(objNo);
			objNo++;	
			
			optionArray.push(ProductOption);
		}
		calcbutton(objNo);
		
	});	
	
	
	
		
}); // end of doc어쩌구

function calcbutton(objNo){
	
	let count = objNo;
	console.log("objNo"+objNo);
	$(`button#plus${count}`).click(function(){
		Selected = $(`button#plus${count}`).parent().children("#optionAmount");
		
		SelectedAmount = parseInt(Selected.text())+1;
		Selected.text(SelectedAmount);			
	});
	$(`button#minus${objNo}`).click(function(){
		Selected = $(`button#minus${objNo}`).parent().children("#optionAmount");
		
		SelectedAmount = parseInt(Selected.text())-1;
		if(SelectedAmount <= 0){
			alert("0개 이하로 줄일 수 없습니다.")
		}	
		else{
			Selected.text(SelectedAmount);	
		}
	});
	
	$(`button#deleteObj${objNo}`).click(function(){
		Selected = $(`button#deleteObj${objNo}`).parent();
		deleteText = $(`button#deleteObj${objNo}`).parent().children("#optionName").text();
		Selected.remove();
	
		for(let i = 0; i < optionArray.length; i++) {
		 	 if(optionArray[i] == deleteText)  {
		    optionArray.splice(i, 1);
		    i--;
	  		}
		}
		console.log(optionArray);
	
	});
	
}



// 좋아요 누르면
function likeCheck() {
	
	const userid ="karina@gmail.com";
	
	const productNum = $("dd#product_num").text();

	$.ajax({
		url:getContextPath()+"/member/likeCheck.dream",
		data:{"userid":userid
			 ,"productNum":productNum},  // data 는 /MyMVC/member/emailDuplicateCheck_2.up 로 전송해야할 데이터를 말한다. 
		type:"post",
		dataType:"json",
    //	async:true,   // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
                      // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다. 
        success:function(json){
        	
        	if(json.resultSuccess=="true") {
        		if(json.resultType == "add"){
					alert("관심상품으로 등록되었습니다!");
					$("span.wish_count_num").text(json.count);
				}else{
					alert("관심상품 등록이 해제되었습니다!");
					$("span.wish_count_num").text(json.count);
				}
        		
        	}
        	
        	else {
        		alert("조져따리");
        	}
        	
        },
        error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
		
}// end of function isExistEmailCheck()-------------------------	
	

function goPurchasePage(){
	
	// 일단 선택한 옵션의 사이즈 배열과 갯수 배열을 각각 만들어보자자자자자자자자자ㅏ자자자ㅏ자자
	
	
	let length = $("div#added_option").length;
	added_optionName = $("div#added_option>#optionName").text();
	added_optionAmount = $("div#added_option>#optionAmount").text();
	const productNum = $("dd#product_num").text();
	
	let sizeArray =[];
	let cntArray =[];
	
	let isitOkay = false;
	let option_size = "";
	let count = 0;
	
	// 선택한 옵션의 수 만큼 반복
	for(let i = 0; i < length; i++) {
		 sizeArray.push(added_optionName[i]);
		 console.log(added_optionName[i]);
		 cntArray.push(added_optionAmount[i]);
		}
		
	// 선택한 옵션의 순서대로 옵션의 사이즈, 개수가 같은 인덱스로 들어감
	// 이 값을 구매버튼 누르는 순간의 재고와 비교할 것이므로 json 쓰자자자자자자ㅏ자자자ㅏㅈ
	
	$.ajax({
		url:getContextPath()+"/product/cntCheck.dream",
		data:{"productNum":productNum},  // data 는 /MyMVC/member/emailDuplicateCheck_2.up 로 전송해야할 데이터를 말한다. 
		type:"post",
		dataType:"json",
    //	async:true,   // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
                      // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다. 
        success:function(json){
	
		console.log((json.size));
		console.log(json.cnt);
		
		 outer : for(let i = 0; i < length; i++) {
		 option_size = added_optionName[i];
		 option_cnt = Number(added_optionAmount[i]);
		  
		 console.log("option_size"+option_size);
		 	for(let n=0; n<(json.size).length; n++){
				if(option_size == json.size[n]){
					count++;
					console.log(option_size+"의 재고는"+json.cnt[n]+"개 입니다.")
					if(option_cnt > Number(json.cnt[n])){
						alert(option_size + "의 주문수량은"+option_cnt);
						isitOkay = false;
						alert(option_size+"의 재고는"+json.cnt[n]+"개 입니다. 그 이하로 주문해주세요.")
							
						break outer; 
					}
					
				}
			}
		 
		 }// end of outer
		 
		 if(count == length){
			// 옵션의 갯수만큼 체크했는지 확인
			isitOkay = false;
		}
		 
		 
		
	
	
	
	
	
	
	
	
	
        	
     
        	
        },
        error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	

		const loginUserid = $("input#loginUserid").val().trim();
	    const loginPwd = $("input#loginPwd").val().trim();
	    
	    if(loginUserid == "") {
	    	alert("아이디를 입력하세요!!");
	    	$("input#loginUserid").val("");
	    	$("input#loginUserid").focus();
	    	return; // goLogin() 함수 종료
	    }
	    
	    if(loginPwd == "") {
	    	alert("암호를 입력하세요!!");
	    	$("input#loginPwd").val("");
	    	$("input#loginPwd").focus();
	    	return; // goLogin() 함수 종료
	    }
	    */
	    
	/*
		>> 로컬 스토리지(localStorage)와 세션 스토리지(sessionStorage) << 
	      로컬 스토리지와 세션 스토리지는 HTML5에서 추가된 저장소이다.
	      간단한 키와 값을 저장할 수 있다. 키-밸류 스토리지의 형태이다.
	    
	    ※ 로컬 스토리지와 세션 스토리지의 차이점은 데이터의 영구성이다. 
	       로컬 스토리지의 데이터는 사용자가 지우지 않는 이상 계속 브라우저에 남아 있게 된다. 
	       만료 기간을 설정할 수 없다.
	       하지만 세션 스토리지의 데이터는 윈도우나 브라우저 탭을 닫을 경우 자동적으로 제거된다.
	       지속적으로 필요한 데이터(자동 로그인 등)는 로컬 스토리지에 저장하고, 
	       잠깐 동안 필요한 정보(일회성 로그인 정보라든가)는 세션 스토리지에 저장하도록 한다. 
	       그러나 비밀번호같은 중요한 정보는 절대로 저장하면 안된다.
	       왜냐하면  클라이언트 컴퓨터 브라우저에 저장하는 것이기 때문에 타인에 의해 도용당할 수 있기 때문이다.

	       로컬 스토리지랑 세션 스토리지가 나오기 이전에도 브라우저에 저장소 역할을 하는 게 있었다.
	       바로 쿠키인데 쿠키는 만료 기한이 있는 키-값 저장소이다.

	       쿠키는 4kb 용량 제한이 있고, 매번 서버 요청마다 서버로 쿠키가 같이 전송된다.
	       만약 4kb 용량 제한을 거의 다 채운 쿠키가 있다면, 요청을 할 때마다 기본 4kb의 데이터를 사용한다. 
	       4kb 중에는 서버에 필요하지 않은 데이터들도 있을 수 있다. 
	       그러므로 데이터 낭비가 발생할 수 있게 된다. 
	       바로 그런 데이터들을 이제 로컬 스토리지와 세션 스토리지에 저장할 수 있다. 
	       이 두 저장소의 데이터는 서버로 자동 전송되지 않는다.

	   >> 로컬 스토리지(localStorage) <<
	      로컬 스토리지는 window.localStorage에 위치한다. 
	      키 밸류 저장소이기 때문에 키와 밸류를 순서대로 저장하면 된다. 
	      값으로는 문자열, boolean, 숫자, null, undefined 등을 저장할 수 있지만, 
	      모두 문자열로 변환된다. 키도 문자열로 변환된다.

	      localStorage.setItem('name', '이순신');
	      localStorage.setItem('birth', 1994);

	      localStorage.getItem('name');        // 이순신
	      localStorage.getItem('birth');       // 1994 (문자열)

	      localStorage.removeItem('birth');    // birth 삭제
	      localStorage.getItem('birth');       // null (삭제됨)

	      localStorage.clear();                // 전체 삭제

	      localStorage.setItem(키, 값)으로 로컬스토리지에 저장함.
	      localStorage.getItem(키)로 조회함. 
	      localStorage.removeItem(키)하면 해당 키가 지워지고, 
	      localStorage.clear()하면 스토리지 전체가 비워진다.

	      localStorage.setItem('object', { userid : 'leess', name : '이순신' });
	      localStorage.getItem('object');   // [object Object]
	            객체는 제대로 저장되지 않고 toString 메소드가 호출된 형태로 저장된다. 
	      [object 생성자]형으로 저장되는 것이다. 
	            객체를 저장하려면 두 가지 방법이 있다. 
	            그냥 키-값 형식으로 풀어서 여러 개를 저장할 수도 있다. 
	            한 번에 한 객체를 통째로 저장하려면 JSON.stringify를 해야된다. 
	            객체 형식 그대로 문자열로 변환하는 것이다. 받을 때는 JSON.parse하면 된다.

	      localStorage.setItem('object', JSON.stringify({ userid : 'leess', name : '이순신' }));
	      JSON.parse(localStorage.getItem('object')); // { userid : 'leess', name : '이순신' }
	     
	            이와같이 데이터를 지우기 전까지는 계속 저장되어 있기 때문에 
	            사용자의 설정(보안에 민감하지 않은)이나 데이터들을 넣어두면 된다.  

	   >> 세션 스토리지(sessionStorage) <<
	            세션 스토리지는 window.sessionStorage에 위치한다. 
	            clear, getItem, setItem, removeItem, key 등 
	            모든 메소드가 로컬 스토리지(localStorage)와 같다. 
	            단지 로컬스토리지와는 다르게 데이터가 영구적으로 보관되지는 않을 뿐이다. 
	            
	   >> 로컬 스토리지(localStorage)와 세션 스토리지(sessionStorage) 에 저장된 데이터를 보는 방법 << 
	            크롬인 경우 F12(개발자도구) Application 탭에 가면 Storage - LocalStorage 와 SessionStorage 가 보여진다.
	            거기에 들어가서 보면 Key 와 Value 값이 보여진다.
	*/	    
	   /* if( $("input:checkbox[id='saveid']").prop("checked") ) {
	    	localStorage.setItem('saveid', $("input#loginUserid").val());	
	    }
	    else {
	    	localStorage.removeItem('saveid');
	    }
	    
	    
	    const frm = document.loginFrm; 
	    frm.action = "<%= request.getContextPath()%>/login/login.up";
	    frm.method = "post";
	    frm.submit();*/
		
	}// end of function goPurchasePage()-----------------
