 


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
		
		userid = 0123;
		coinmoney = 0456;
		//	alert("확인용 결제할 사용자 아이디 : " + userid);
			
		//  아임포트 결제 팝업창 띄우기 
        const url = getContextPath()+"/member/goPurchase.dream";
		
		window.open(url, "coinPurchaseEnd",
				    "left=350px, top=100px, width=1000px, height=600px");

		});
		
		
	
      
	





    });