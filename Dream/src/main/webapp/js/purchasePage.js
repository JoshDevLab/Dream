 


	function getContextPath(){
	  let hostIndex = location.href.indexOf(location.host) + location.host.length;
	  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
	  return contextPath;
	}
	      
                  
      function IsAllOk(){
        
        userid=01234;
        coinmoney=56789;
        
        checked_length = $('input:checkbox[name="li_check"]:checked').length;
        /*console.log(checkAll);*/
        if((checkAll && addressExist)){
		//  주소가 존재하고 체크박스가 모두 체크되면 disabled 를 제거한다
		  
      	/*  $('#payment').attr('href','#');*/
      	  $('#payment').removeClass('disabled');
		  $('#payment').attr('href','#');
         
        }
        else{
          
          $('#payment').removeAttr('href');
		  $('#payment').addClass('disabled');
          
        }
        
      };

      let checkAll = false;
	  let addressExist = true;


    
    $(document).ready(function() {
	  let checked_length = $('input:checkbox[name="li_check"]:checked').length;
	
	  const checkBox = $("input:checkbox[name='li_check']");
      const check_length = $('input:checkbox[name="li_check"]').length;

      checkAll = false;
	  addressExist = true;
	  
      IsAllOk();  
      // let addressExist = false; 나중에는 기본 주소 로딩되면서 자동클릭되도록 하고 체크해주면 될듯


      // 클릭 이벤트
      checkBox.click(function (e) {
        // 전부 체크 됐는지 확인
		
		checked_length = $('input:checkbox[name="li_check"]:checked').length;
		/*console.log(checked_length);*/
        if(checked_length<check_length) {
          checkAll = false;
        }
        else if(checked_length==check_length) {
          checkAll = true;
        }

        IsAllOk();  
      });
      
      
      $('a#payment').click(function(e){
			
		/*const userid = "${sessionScope.loginuser.userid}"; */
		
		userid = $("form#goPurchase>input#userid").val();
		console.log(userid);
		fullPrice = $("form#goPurchase>input#fullPrice").val();
		console.log(fullPrice);
		productName = $("form#goPurchase>input#productName").val();

		//	alert("확인용0 결제할 사용자 아이디 : " + userid);
			
		//  아임포트 결제 팝업창 띄우기 
        const url = getContextPath()+"/member/goPurchase.dream?userid="+userid+"&fullPrice="+fullPrice+"&productName="+productName;
        	
		
		window.open(url, "goPurchase",
				    "left=350px, top=100px, width=1000px, height=600px");

		});
		
		
		
		// 포인트입력칸 숫자만 가능하도록
		$("input#point").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
	 
		
      	$("input#point").blur(function(){
			if(Number($(this).val()) >  Number($("span.point").text())){
				alert("보유한 포인트보다 많은 포인트를 사용하실 수 없습니다. 다시 입력해주세요!");
				$(this).val('');
			}			
			
			/*if(Number($(this).val() != null && Number($(this).val()) != 0){
				$("#span_point_amount").text($(this).val());
			}
			else{
				$("#span_point_amount").text('-');
			}*/
			
		});
	
		$("button#pointAlluse").click(function(){
			$("input#point").val($("span.point").text());
			$("#span_point_amount").text($("input#point").val());
		});


	



    });
    
    
    // === DB 상의 정보 변경( 구매내역 (userid, product_num, buy_cnt) 
    //                     포인트  (userid, product_num,POINT_AMOUNT(full_price 의 일정 %, 사용 둘다 필요), event_type(기본값은 제품구매)
    //					   구매한 개수만큼 재고 감소 (PRODUCT_NUM, PRODUCT_SIZE, SIZE_CNT) )) === //
	function goUpdate() {
		
		// jsp 에서 보내줘야할 정보
		// userid, product_num, 
		// buy_cnt(SIZE_CNT)의 합(),
		// POINT_AMOUNT(full_price 의 일정 %, 사용량 둘다 필요),
		// event_type,  
		// PRODUCT_SIZE,SIZE_CNT )
		// 전부 히든폼에 담아서 보내자자ㅏ자자자ㅏ자자ㅏ자자ㅏ자자자ㅏ자자자ㅏ자자자자ㅏ자자자ㅏ 
		// 그냥 purchase controller 에서 넘어온값은 그대로 넣어놨고 추가할 값만 여기서 넣어줌
		
		const frm = document.goUpdate;
		if( $("input#span_point_amount").text() == '-'){
			frm.PointMinus.value = $("input#span_point_amount").text();	
		}
		else{
			frm.PointMinus.value = 0;
		}
		let length = $("div#SeletedOption").length;
		frm.length.value = length;// 반복할 횟수 가져가줌
		// 여기서 이벤트타입 분기점 생기면 여기서 나눠서 올리면 된다. 난 몰루겠음 구매말곤
		let event_type = "구매"; 
		frm.event_type.value = event_type;
		
		frm.action = getContextPath()+"/product/goUpdate.dream";
		frm.method = "POST";
		frm.submit(); 
	}
