// js파일에서 contextPath를 알아내는 함수
function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}
//URL관련 변수선언
let URL = sessionStorage.getItem("currentURL");

//category
const category_start_idx = URL.indexOf('=',URL.indexOf('category'))+1;
const category_last_idx = URL.indexOf('&',category_start_idx);
let category_val = "전체";
if(category_start_idx != 0 && category_last_idx != -1){
 category_val = URL.substring(category_start_idx,category_last_idx);
}
else if(category_start_idx != 0){
 category_val = URL.substring(category_start_idx);
}


//detail_category
const detail_category_start_idx = URL.indexOf('=',URL.indexOf('detail_category'))+1;
const detail_category_last_idx = URL.indexOf('&',detail_category_start_idx);
let detail_category_val = "";
if(detail_category_start_idx != 0 && detail_category_last_idx != -1){
 detail_category_val = URL.substring(detail_category_start_idx,detail_category_last_idx);
}
else if(detail_category_start_idx != 0){
 detail_category_val = URL.substring(detail_category_start_idx);
}



//bestyn
const bestyn_start_idx = URL.indexOf('=',URL.indexOf('bestyn'))+1;
const bestyn_last_idx = URL.indexOf('&',bestyn_start_idx);
let bestyn_val = 'N';
if(bestyn_start_idx != 0 && bestyn_last_idx != -1){
 bestyn_val = URL.substring(bestyn_start_idx, bestyn_last_idx);
}
else if(bestyn_start_idx != 0){
 bestyn_val = URL.substring(bestyn_start_idx);
}


//gender
const gender_start_idx = URL.indexOf('=',URL.indexOf('gender'))+1;
const gender_last_idx = URL.indexOf('&',gender_start_idx);
let gender_val = '없음';
if(gender_start_idx != 0 && gender_last_idx != -1){
 gender_val = URL.substring(gender_start_idx, gender_last_idx);
}
else if(gender_start_idx != 0){
 gender_val = URL.substring(gender_start_idx);
}



//start_price
const start_price_start_idx = URL.indexOf('=',URL.indexOf('start_price'))+1;
const start_price_last_idx = URL.indexOf('&',start_price_start_idx);
let start_price_val = '0';
if(start_price_start_idx != 0 && start_price_last_idx != -1){
 start_price_val = URL.substring(start_price_start_idx, start_price_last_idx);
}
else if(start_price_start_idx != 0){
 start_price_val = URL.substring(start_price_start_idx);
}

//end_price
const end_price_start_idx = URL.indexOf('=', URL.indexOf('end_price'))+1;
const end_price_last_idx = URL.indexOf('&', end_price_start_idx);
if(end_price_start_idx != 0 && end_price_last_idx != -1){
 end_price_val = URL.substring(end_price_start_idx, end_price_last_idx);
}
else if(end_price_start_idx != 0){
 end_price_val = URL.substring(end_price_start_idx);
}



//sort
const sort_start_idx = URL.indexOf('=',URL.indexOf('sort'))+1;
const sort_last_idx = URL.indexOf('&',sort_start_idx);
if(sort_start_idx != 0 && sort_last_idx != -1){
 sort_val = URL.substring(sort_start_idx, sort_last_idx);
}
else if(sort_start_idx != 0){
 sort_val = URL.substring(sort_start_idx);
}

//page



//URL관련 변수선언 끝



$("document").ready(function(){
      // 변수선언
      const btn_toggle_filter = $("a.btn_toggle_filter");
      const plus_icon = $("i.plus_icon");
      const minus_icon = $("i.minus_icon");
      
      
      $("form.togglebox").hide();
      minus_icon.hide();
      // 사이드필터에서 토글버튼() 클릭시 토글부분을 보여주는 함수
      btn_toggle_filter.click(function(e){
        const target = $(e.target);
        target.parent().next().toggle();
        target.find("i.plus_icon").toggle();
        target.find("i.minus_icon").toggle();
      });
      // 사이드필터에서 토글버튼(플러스) 클릭시 토글부분을 보여주는 함수
      plus_icon.click(function(e){
        const target = $(e.target);
        target.parent().parent().next().show();
        target.hide();
        target.next().show();
      });//end of btn_toggle_filter.click(function(e){}--
      // 사이드필터에서 토글버튼(마이너스버튼) 클릭시 토글부분을 보여주는 함수
      minus_icon.click(function(e){
        
        const target = $(e.target);
        target.parent().parent().next().hide();
        target.hide();
        target.prev().show();
      });//end of btn_toggle_filter.click(function(e){}--
      
      
      
      
	  
      
      
      
      // ===== sidefilter 부분 javascript 끝 ===== //
      //URL에서 카테고리값에 맞는것 버튼 클릭한효과랑 필터부분 카테고리라디오 체크하기
      $(`button.btn_fillter:contains(${category_val})`).css("background-color","black");
      $(`button.btn_fillter:contains(${category_val})`).css("color","white");
      $(`label:contains(${category_val})`).prev().attr("checked",true);
      
      
      
      //bestyn이 y일 경우 문서가 로딩되면 체크하기
      if(bestyn_val == 'Y'){
	    $(`input:checkbox[name='bestyn']`).attr("checked",true);
      }
      else if(bestyn_val =='N'){
	    $(`input:checkbox[name='bestyn']`).attr("checked",false);
	  }
	  
	  //gender값에따라 체크하기 
      if(gender_val == '남'){
	    $(`input:radio[id='man']`).attr("checked",true);
      }
      else if(gender_val =='여'){
	    $(`input:radio[name='women']`).attr("checked",true);
	  }
	  else{
		$("input:radio[id='no_gender']").attr("checked",true);
	  }


      // selet 태그에서 첫번째 옵션 값을 숨기는 함수 
      $("select#sort_option").click(e=>{
          $("select#sort_option").children("option[value='정렬옵션']").prop("hidden",true);
      });
      
      
      //카테고리 라디오버튼 값이 변경시 버튼에 클릭트리거
      $("input:radio[name='category']").change(e=>{
		const target = $(e.target);
		const category = target.next().text();
		
		$(`button:contains(${category})`).trigger("click");
	  });
	  
	  
	  //필터버튼 클릭시 이벤트 잡기
	  $("button.btn_fillter").click(e=>{
		const target = $(e.target);
		const val = target.text();
		btn_filterClick(val);
		
	  });
	  
	  //bestyn 라디오 버튼 값이 변경시 이벤트 잡기
      $("input:checkbox[name='bestyn']").change(e=>{
		if($("input:checkbox[name='bestyn']").is(":checked")){//bestyn을 체크했을 경우
		  bestynCheck();
		}
		else{	//bestyn을 체크해제했을 경우
		  bestynClear();
		}
	  });
	  
	  
	  //gender 라디오 버튼 값이 변경시 이벤트 잡기
      $("input:radio[name='gender']").change(e=>{
		const target = $(e.target);
		const val = target.next().text();
		genderChange(val);
	  });
	  
	  //가격대 검색창 입력시 숫자만 입력 가능하게 만들기
	  $("input#start_price").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
	  $("input#end_price").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
	  //가격대로 검색 버튼 클릭시 이벤트
	  $("button#btn_price_search").click(e=>{
		const input_start_price = $("input#start_price");
		const input_end_price = $("input#end_price");
		const start_price = input_start_price.val();
		const end_price = input_end_price.val();
		
		if(start_price>end_price){
		  alert("최고가격은 최저가격보다 높아야 합니다!");
		  input_end_price.val("");
		  input_end_price.focus();
		}
		else{
		  
		}
	  });
	  
	  
	  
	  
	  
	  
	  //카테고리를 무엇을 선택했는지에 따라서 디테일카테고리이미지 넣기
	  let html="";
	  switch (category_val) {
	    case '전체':
          $("div.details_category").css("height","0");
          $("div.details_category").css("display","none");
	      break;
	    case '침구류':
	      html =(`<a type=button class="detail_category">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리베개.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        베개
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리베개커버.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        베개커버
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리이불.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        이불
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리침대.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        침대
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리침대커버.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        침대커버
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리매트리스.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        매트리스
                      </p>
                    </div>
                  </a>`);
          $("div.details_category").html(html);
	      break;
	    case '조명':
	      html =(`<a type=button class="detail_category">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리장스탠드.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        장스탠드
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리무드등.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        무드등
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리북라이트.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        북라이트
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리LED양초.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        LED양초
                      </p>
                    </div>
                  </a>`);
          $("div.details_category").html(html);
	      break;
	    case '파자마':
	      html =(`<a type=button class="detail_category">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리겨울파자마.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        겨울파자마
                      </p>
                    </div>
                  </a>
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리여름파자마.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        여름파자마
                      </p>
                    </div>
                  </a>`);
          $("div.details_category").html(html);
	      break;
	    case '수면용품':
	      html =(`<a type=button class="detail_category">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리안대.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        안대
                      </p>
                    </div>
                  </a>
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리필로우미스트.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        필로우미스트
                      </p>
                    </div>
                  </a>
                  
                  <a type=button class="detail_category ml-3">
                    <div class="d-flex flex-column">
                      <div class="category_img">
                        <img src="${getContextPath()}/images/카테고리캔들.PNG" class="rounded-circle">
                      </div>
                      <p class="details_category_name text-center">
                        캔들
                      </p>
                    </div>
                  </a>`);
          $("div.details_category").html(html);
	      break;
	  }
  }); // end of $("document").ready(function(){}----
  
  
  
  
  
  
  
  
  
  //=================================================================================//
  //================================= Function Declaration ==========================//
  //=================================================================================//
  
  
  
  
  //category필터 버튼 클릭시 URL에 category=값 넣기 함수
  function btn_filterClick(val){
	const category_val_length = category_val.length;
	 if(URL.indexOf('category=')!=-1 &&
	  !(URL.indexOf('detail_category=')== -1 &&
	    URL.indexOf('bestyn=') == -1 &&
	    URL.indexOf('gender=') == -1 &&
	 	URL.indexOf('start_price=') == -1 &&
	 	URL.indexOf('end_price=') == -1 &&
	 	URL.indexOf('sort=') == -1) )
	 {	//URL에 category파라미터가 있고,다른파라미터가 있다면
	   let start_URL = URL.substring(0,category_start_idx)+val;
	   let last_URL = URL.substring(category_start_idx+category_val_length);
	   location.href=getContextPath()+start_URL + last_URL;
	 }
	 
	 
	 else if (URL.indexOf('category=')==-1 &&
		      URL.indexOf('detail_category=')== -1 &&
	 		  URL.indexOf('bestyn=') == -1 &&
	 		  URL.indexOf('gender=') == -1 &&
	 		  URL.indexOf('start_price=') == -1 &&
	 		  URL.indexOf('end_price=') == -1 &&
	 		  URL.indexOf('sort=') == -1
	          )
	 {	//URL에 category 파라미터가 없고,다른 파라미터도 없다면
	    location.href=getContextPath()+'/product/shop.dream?category='+val
	 }
	 
	 
	 else if(URL.indexOf('category=')!=-1 &&
	         URL.indexOf('detail_category=')== -1 &&
	 		 URL.indexOf('bestyn=') == -1 &&
	 		 URL.indexOf('gender=') == -1 &&
	 		 URL.indexOf('start_price=') == -1 &&
	 		 URL.indexOf('end_price=') == -1 &&
	 		 URL.indexOf('sort=') == -1)
	 {  //URL에 category 파라미터는 있고, 다른파라미터는 없다면
	   location.href=getContextPath()+URL.substring(0,category_start_idx)+val
	 } 
		
		
		
	 else {	//URL에 category파라미터는 없고,다른파라미터는 있다면,
		URL += '&category='+val
		location.href=getContextPath()+URL;
	 }
	  
  }//end of function btn_allClick()
  
  
  
  
  
  
  
  
  //bestyn체크박스 체크시 URL에 bestyn=y입력하기 함수
  function bestynCheck(){
	
	if( URL.indexOf('bestyn=')!=-1 &&
	  !(URL.indexOf('detail_category=')== -1 &&
	    URL.indexOf('category=') == -1 &&
	    URL.indexOf('gender=') == -1 &&
	 	URL.indexOf('start_price=') == -1 &&
	 	URL.indexOf('end_price=') == -1 &&
	 	URL.indexOf('sort=') == -1) )
	 {	//URL에 category파라미터가 있고,다른파라미터가 있다면
	   let start_URL = URL.substring(0,bestyn_start_idx)+'Y';
	   let last_URL = URL.substring(bestyn_start_idx+1);
	   location.href=getContextPath()+start_URL + last_URL;
	 }
	 
	 
	 else if (URL.indexOf('bestyn=')==-1 &&
		      URL.indexOf('detail_category=')== -1 &&
	 		  URL.indexOf('category=') == -1 &&
	 		  URL.indexOf('gender=') == -1 &&
	 		  URL.indexOf('start_price=') == -1 &&
	 		  URL.indexOf('end_price=') == -1 &&
	 		  URL.indexOf('sort=') == -1
	          )
	 {	//URL에 category 파라미터가 없고,다른 파라미터도 없다면
	    location.href=getContextPath()+'/product/shop.dream?bestyn='+'Y'
	 }
	 
	 
	 else if(URL.indexOf('bestyn=')!=-1 &&
	         URL.indexOf('detail_category=')== -1 &&
	 		 URL.indexOf('category=') == -1 &&
	 		 URL.indexOf('gender=') == -1 &&
	 		 URL.indexOf('start_price=') == -1 &&
	 		 URL.indexOf('end_price=') == -1 &&
	 		 URL.indexOf('sort=') == -1)
	 {  //URL에 category 파라미터는 있고, 다른파라미터는 없다면
	   location.href=getContextPath()+URL.substring(0,bestyn_start_idx)+'Y'
	 } 
		
		
		
	 else {	//URL에 category파라미터는 없고,다른파라미터는 있다면,
		URL += '&bestyn=Y';
		location.href=getContextPath()+URL;
	 }
  }//end of function bestynCheck()
  
  
  
  
  //bestyn체크박스 해제시 URL에 bestyn=n입력하기 함수
  function bestynClear(){
	
	if( URL.indexOf('bestyn=')!=-1 &&
	  !(URL.indexOf('detail_category=')== -1 &&
	    URL.indexOf('category=') == -1 &&
	    URL.indexOf('gender=') == -1 &&
	 	URL.indexOf('start_price=') == -1 &&
	 	URL.indexOf('end_price=') == -1 &&
	 	URL.indexOf('sort=') == -1) )
	 {	//URL에 category파라미터가 있고,다른파라미터가 있다면
	   let start_URL = URL.substring(0,bestyn_start_idx)+'N';
	   let last_URL = URL.substring(bestyn_start_idx+1);
	   location.href=getContextPath()+start_URL + last_URL;
	 }
	 
	 
	 else if (URL.indexOf('bestyn=')==-1 &&
		      URL.indexOf('detail_category=')== -1 &&
	 		  URL.indexOf('category=') == -1 &&
	 		  URL.indexOf('gender=') == -1 &&
	 		  URL.indexOf('start_price=') == -1 &&
	 		  URL.indexOf('end_price=') == -1 &&
	 		  URL.indexOf('sort=') == -1
	          )
	 {	//URL에 category 파라미터가 없고,다른 파라미터도 없다면
	    location.href=getContextPath()+'/product/shop.dream?bestyn='+'N'
	 }
	 
	 
	 else if(URL.indexOf('bestyn=')!=-1 &&
	         URL.indexOf('detail_category=')== -1 &&
	 		 URL.indexOf('category=') == -1 &&
	 		 URL.indexOf('gender=') == -1 &&
	 		 URL.indexOf('start_price=') == -1 &&
	 		 URL.indexOf('end_price=') == -1 &&
	 		 URL.indexOf('sort=') == -1)
	 {  //URL에 category 파라미터는 있고, 다른파라미터는 없다면
	   location.href=getContextPath()+URL.substring(0,bestyn_start_idx)+'N'
	 } 
		
		
		
	 else {	//URL에 category파라미터는 없고,다른파라미터는 있다면,
		URL += '&bestyn=N';
		location.href=getContextPath()+URL;
	 }
  }//end of function bestynCheck()
  
  
  
  
  
  //성별부분 라디오버튼 값이 바뀔시 호출될 함수
  function genderChange(val){
	const gender_val_length = gender_val.length;
	 if(URL.indexOf('gender=')!=-1 &&
	  !(URL.indexOf('detail_category=')== -1 &&
	    URL.indexOf('bestyn=') == -1 &&
	    URL.indexOf('category=') == -1 &&
	 	URL.indexOf('start_price=') == -1 &&
	 	URL.indexOf('end_price=') == -1 &&
	 	URL.indexOf('sort=') == -1) )
	 {	//URL에 category파라미터가 있고,다른파라미터가 있다면
	   let start_URL = URL.substring(0,gender_start_idx)+val;
	   let last_URL = URL.substring(gender_start_idx+gender_val_length);
	   location.href=getContextPath()+start_URL + last_URL;
	 }
	 
	 
	 else if (URL.indexOf('gender=')==-1 &&
		      URL.indexOf('detail_category=')== -1 &&
	 		  URL.indexOf('bestyn=') == -1 &&
	 		  URL.indexOf('category=') == -1 &&
	 		  URL.indexOf('start_price=') == -1 &&
	 		  URL.indexOf('end_price=') == -1 &&
	 		  URL.indexOf('sort=') == -1
	          )
	 {	//URL에 category 파라미터가 없고,다른 파라미터도 없다면
	    location.href=getContextPath()+'/product/shop.dream?gender='+val
	 }
	 
	 
	 else if(URL.indexOf('gender=')!=-1 &&
	         URL.indexOf('detail_category=')== -1 &&
	 		 URL.indexOf('bestyn=') == -1 &&
	 		 URL.indexOf('category=') == -1 &&
	 		 URL.indexOf('start_price=') == -1 &&
	 		 URL.indexOf('end_price=') == -1 &&
	 		 URL.indexOf('sort=') == -1)
	 {  //URL에 category 파라미터는 있고, 다른파라미터는 없다면
	   location.href=getContextPath()+URL.substring(0,gender_start_idx)+val
	 } 
		
		
		
	 else {	//URL에 category파라미터는 없고,다른파라미터는 있다면,
		URL += '&gender='+val
		location.href=getContextPath()+URL;
	 }
  }
  





