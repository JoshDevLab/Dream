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
					<span id="optionAmount" class="optionAmount" name="optionAmount">1</span>
					<span id="optionName" name="optionName">${ProductOption}</span>
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
					<span name = "optionAmount" id="optionAmount" class="optionAmount">1</span>
					<span name="optionName" id="optionName">${ProductOption}</span>
					<button id="deleteObj${objNo}" class="btn">x</button>
					<button id="minus${objNo}" class="btn">-</button>
					<button id="plus${objNo}" class="btn">+</button>
				</div>`);	
			console.log($("div#optionSelected"));
			calcbutton(objNo);
			objNo++;	
			
			optionArray.push(ProductOption);
		}
		calcbutton(objNo);
		HowMuchIsit();
		
	});	
	
	
	
		
}); // end of doc어쩌구

function calcbutton(objNo){
	
	let count = objNo;
	console.log("objNo"+objNo);
	// 플러스 버튼 누르면
	$(`button#plus${count}`).click(function(){
		Selected = $(`button#plus${count}`).parent().children("#optionAmount");
		
		SelectedAmount = parseInt(Selected.text())+1;
		Selected.text(SelectedAmount);		
		// 금액 변경 반영	
		HowMuchIsit();
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
		// 금액 변경 반영	
		HowMuchIsit();
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
		// 금액 변경 반영	
		HowMuchIsit();
	
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
	let added_optionName = document.getElementsByName("optionName");
	console.log("length"+length);
	const productNum = $("dd#product_num").text();
	let added_optionAmount = document.getElementsByName("optionAmount");
	
	let sizeArray =[];
	let cntArray =[];
	
	let isitOkay = true;
	let option_size = "";
	let count = 0;
	
	// 선택한 옵션의 수 만큼 반복
	for(let i = 0; i < length; i++) {
		 sizeArray.push(added_optionName[i].textContent);
		 console.log(sizeArray[i]);
		 cntArray.push(added_optionAmount[i].textContent);
		}
		
	// 선택한 옵션의 순서대로 옵션의 사이즈, 개수가 같은 인덱스로 들어감
	// 이 값을 구매버튼 누르는 순간의 재고와 비교할 것 json 쓰자자자자자자ㅏ자자자ㅏㅈ
		console.log("sizeArray"+sizeArray);
		console.log("cntArray"+cntArray);
		console.log(Array.isArray(sizeArray) ); 

		
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
			 option_size = added_optionName[i].textContent;
			 option_cnt = Number(added_optionAmount[i].textContent);
			  
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
			 
			 if(count != length && sizeArray[0] != "freeSize"){
				// 옵션의 갯수만큼 체크하지 않았다면 확인
				console.log("!!!");
				isitOkay = false;
				alert("데이터를 확인하는 중 문제가 발생하였습니다. 잠시후 다시 시도해주세요.");
			}
			
			if(isitOkay){
				
				
				console.log("성공")
				//	frm.asdsadasdas 예정;
				
				let html = "";
				
				for(let i=0; i<length; i++){
					option_size = added_optionName[i].textContent;
			 		option_cnt = Number(added_optionAmount[i].textContent);
			 
			 		html += 
					`<input type="hidden" name="size${i}" value="${option_size}"  />
					 <input type="hidden" name="cnt${i}" value="${option_cnt}"  /> `
					} // end of for
				
				html +=`<input type="hidden" name="length" value="${length}"  />`
				
				console.log(html);
				
				$("div#asd").empty();
				
				var frm = document.temporaryCart; 
				$("form#temporaryCart>div#asd").append(html);
				frm.method = "post";
				frm.action = getContextPath()+"/member/purchasePage.dream";
		
			    
			    frm.submit();
				
			}// end of if(isitOkay)
	        	
        }// end of succes
        ,error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});

		
	}// end of function goPurchasePage()-----------------
	
		// 선택갯수 * 할인적용금액 된 가격을 구해서 넣어주는 함수
	function HowMuchIsit() {
		
		let added_optionAmount = document.getElementsByName("optionAmount");
		/*let addArr = Array.from(added_optionAmount);
		console.log(typeof(addArr));
		console.log("확인용 배열"+addArr);
		console.log("확인용 배열 길이"+addArr.length);
		*/
		let sum=0;
	
		for(let i=0; i< added_optionAmount.length; i++){
			Selected = Number(added_optionAmount[i].textContent);
			sum+=Selected;
		}
		
		//	Selected = added_optionAmount[1].textContent;
		//	console.log("씨발값"+Selected);
		//	sum += Number(Selected);
		let discount_price = Number($("input#discountPrice").val());
		console.log(discount_price);
			
		let price = sum * discount_price;
		$("input#fullPrice").val(price);
		
		$("em.num").text(price);
		
	};
	
	// 장바구니에 추가해주는 버튼
	function updateCart(){
		// 일단 선택한 옵션의 사이즈 배열과 갯수 배열을 각각 만들어보자자자자자자자자자ㅏ자자자ㅏ자자
	const userid = $("input#userid").val();

	if(userid!= ""){

		let length = $("div#added_option").length;
		let added_optionName = document.getElementsByName("optionName");
		
		const productNum = $("input#productNum").val();
		
		let added_optionAmount = document.getElementsByName("optionAmount");

		let sizeArray =[];
		let cntArray =[];


		// 선택한 옵션의 수 만큼 반복
		for(let i = 0; i < length; i++) {
			
			
			 sizeArray.push(added_optionName[i].textContent);
			 cntArray.push(added_optionAmount[i].textContent);
			}

		// 선택한 옵션의 순서대로 옵션의 사이즈, 개수가 같은 인덱스로 들어감
		// 이 값을 구매버튼 누르는 순간의 재고와 비교할 것 json 쓰자자자자자자ㅏ자자자ㅏㅈ
			console.log("sizeArray"+sizeArray);
			console.log("cntArray"+cntArray);
			console.log("productNum"+productNum);
			console.log("userid"+userid);
	
	
	   
			let JSONsizeArray= JSON.stringify(sizeArray);
			console.log("JSONsizeArray"+JSONsizeArray);
			let JSONcntArray= JSON.stringify(cntArray);

			
		$.ajax({
			url:getContextPath()+"/cart/updateCart.dream",
			traditional: true,
			data:{	"productNum":productNum,
					"userid":userid,
					"sizeArray":JSONsizeArray,
					"cntArray":JSONcntArray,
					"length":length},   
					
			type:"post",
			dataType:"json",
			// 카트에 담을만큼 재고가 있는지 먼저 체크
	        success:function(json){
				
				if(json.isItOk){
					
					alert("선택하신 제품이 장바구니에 추가되었습니다!");
				}
				else{
					alert("장바구니에 추가하는중 오류가 발생하였습니다. 잠시후 다시 시도해주세요.")
				}
	        }// end of succes
	        ,error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of if(userid != null)
	else{ // 로그인 안한 사람
		alert("로그인을 해주세요!");
	}
 
	
		
		
		
	}
