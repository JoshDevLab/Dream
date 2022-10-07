$(document).ready(function () {

    let prd_check_length = $("table input:checkbox[name='prd_check']").length
    
    $(".total_cnt").html(prd_check_length);

    $("input#chk_all").click(function () { // 전체선택 버튼을 클릭하였을시 이벤트처리
        
        const bool = $("input.chk_all").prop("checked");
        $("input:checkbox[name='prd_check']").prop("checked",bool);
        $("input#mobile_chk_all").prop("checked",bool);
        
        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );

    });// end of $("input:checkbox[name='chk_all']").click(function (e) ----------------

    $("input#mobile_chk_all").click(function () { // 모바일 전체선택 버튼을 클릭하였을시 이벤트처리
        
        const bool = $("input#mobile_chk_all").prop("checked");
        $("input:checkbox[name='prd_check']").prop("checked",bool);
        $("input#chk_all").prop("checked",bool);
        
        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)
        
        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );


    });// end of $("input:checkbox[name='chk_all']").click(function (e) ----------------*/


    $("table input:checkbox[name='prd_check']").click(function (e) {  // 각각 체크박스 선택시 이벤트 처리

        const classname = $(e.target).prop("class"); 

        const prd_check_length = $("table input:checkbox[name='prd_check']").length
        const prd_checked_length = $("table input:checkbox[name='prd_check']:checked").length;

        if(prd_check_length > prd_checked_length) {
            $("input:checkbox[name='chk_all']").prop("checked",false);
        }
        else if(prd_check_length == prd_checked_length){
            $("input:checkbox[name='chk_all']").prop("checked",true);
        }

        const bool = $(e.target).prop("checked");
        $("."+classname).prop("checked",bool); 

    });// end of $("input:checkbox[name='prd_check']").click(function (e) ------------


    $("div > input:checkbox[name='prd_check']").click(function (e) {  // 각각 체크박스 선택시 이벤트 처리

        const classname = $(e.target).prop("class"); 

        const mobile_prd_check_length = $("div > input:checkbox[name='prd_check']").length
        const mobile_prd_checked_length = $("div > input:checkbox[name='prd_check']:checked").length;

        if(mobile_prd_check_length > mobile_prd_checked_length) {
            $("input:checkbox[name='chk_all']").prop("checked",false);
        }
        else if(mobile_prd_check_length == mobile_prd_checked_length){
            $("input:checkbox[name='chk_all']").prop("checked",true);
        }

        const bool = $(e.target).prop("checked");
        $("."+classname).prop("checked",bool); 

    });// end of $("input:checkbox[name='prd_check']").click(function (e) ------------


    $("input:checkbox[name='prd_check']").change(function () {
        // 체크된 상품들의 total price들을 가져와서 합계를 구한것을 아래 html에 넣어주기
        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );
        
        let length = $("table input:checkbox[name='prd_check']:checked").length;
		
		if(length == 0) {
			$("input#point").val('');
			$("span.sale_point").text('0');
			$("span.payment_price").text('0');
		}
        
    });// end of $(document).on("change","table#tbl_cart", function (e)

    

    $(document).on("DOMSubtreeModified","table#tbl_cart", function () {
        //alert('헿');

        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

		

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );
        
    });// end of $(document).on("DOMSubtreeModified","table#tbl_cart", function (e)
    
    
    
    // 포인트 js
    
      // 포인트입력칸 숫자만 가능하도록
      $("input#point").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
    
      $("input#point").bind("blur",function() {
	
		const length = $("input:checkbox[name='prd_check']:checked").length;
		
		if(length == 0) {
			alert("제품을 먼저 선택하시고 포인트를 입력하세요");
			$("input#point").val('');
			$("span.sale_point").text('0');
			return false;
		}
		
		if( Number($(".user_point").text()) < $("input#point").val() ) {
			alert("보유포인트가 적습니다.");
			$("input#point").val('');
			$("span.sale_point").text('0');
			return false;
		}
		
		if(Number($("span#prd_price").text().split(",").join("")) < $("input#point").val()) {
			alert("구매가격보다 높은 포인트는 사용할 수 없습니다.");
			$("input#point").val('');
			$("span.sale_point").text('0');
			return false;
		}
		
		if($("input#point").val() == "") {
			$("input#point").val('');
			$("span.sale_point").text('0');
			return false;
		}
		
	
		$("span.sale_point").text( $("input#point").val() );
		$(".payment_price").text( (Number($("span#prd_price").text().split(",").join("")) - Number($("input#point").val())).toLocaleString('en') )
	
	  });
	  
	  
	  $("button.remove_cart_list").click(function(e) { // 삭제하기 버튼

	        const target = $(e.target);

	        const cart_num = target.parent().parent().find('span#cart_num').text()

	        $.ajax({
		        url : getContextPath()+"/cart/cartDelete.dream",
		        type: "GET",
		        data: {"cart_num" : cart_num},
		        dataType:'json',
		        success: function(json) {
			        	
		        		const n = json.n;
		            	
		        		if(n == 1) {
		        			location.reload();
		        		}
		        		else {
		        			alert('백엔드 에러 잡아라');
		        		}
		            
		        },
		        error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });

	    });// end of $("button.remove_cart_list").click(function() ------------------



	    $("button#remove_check").click(function () { // 선택삭제 버튼 이벤트 처리
	        
	        let param = []
	        
	        $("input:checkbox[id='purchase_check']:checked").each(function(index,item) {
	        	
		        	let data = {
		        		  cart_num : $(item).parent().parent().find('span#cart_num').text()
		        	};
		        	
		        	param.push(data);
		        	
	        });
	        
	        const jsonData = JSON.stringify(param);
	        
	        $.ajax({
		        url : getContextPath()+"/cart/cartSelectDelete.dream",
		        traditional: true,
		        type: "GET",
		        data: {"jsonData" : jsonData},
		        dataType:'json',
		        success: function(json) {
			        	
		        		const n = json.n;
		        		const count_n = param.length
		        		
		        		console.log("확인용 n => " + n);
		        		console.log("확인용 count_n => " + count_n);
		            	
		        		if(n == count_n) {
		        			location.reload();
		        		}
		        		else {
		        			alert('백엔드 에러 잡아라');
		        		}
		            
		        },
		        error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });
	        
	    });// end of $("button#remove_check").click(function (e)
	  
	  
	 //가격대 검색창 입력시 숫자만 입력 가능하게 만들기
     $("input.cart_qty").keyup(function(){ 
		const original = $(this).val();
		$(this).val($(this).val().replace(/^[0-9]+$/,original) );
		
	 });
    

});// end of $(document).ready(function () {} -----------------------------------------------------------------------------------------------------------------------------









  