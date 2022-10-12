/*function callAjax(start) {
	  
   	// 결과 값 찍어주는 ajax
   	$.ajax({
   		url: getContextPath()+"/member/message.dream",
   		type: "GET",
   		data: {"type": $("input#type").val(),
   			   "p": $("input#p").val(),
   			   },
   		dataType: "json",
   		success: function(json) {
   			
   			
   			
   			let html =" ";
   			
   			// 조회결과가 있는 경우 
   			if(json.cnt > 0){
   				
   				$("button#btnMoreHIT").show();
   				
   				$("div#no_result").html("");
   				
   				 $.each(json, function(index, item){
   					$("span#totalHITCount").text(item.totalListCnt);
   					html += "<a class='purchaseDetail' href='buylistDetail.dream?ordernum="+item.order_num+"'>"+
   						"<div class='purchase_item my-1' style=' border-bottom: solid 1px #ebebeb; border-top: solid 1px #ebebeb;'>"+
   		                     "<div id='purchase_detail'  class='d-flex'>"+
   		                        "<div class='image_box' style='line-height: 110px;'>"+
   		                           "<img class='product_img' src="+getContextPath()+"/images/제품이미지/"+item.product_image+" alt='...'>"+
   		                        "</div>"+
   		                        "<div id = 'name_cnt'>"+
   		                           "<div class='item_name'> "+item.product_name+" </div>"+
   		                           "<div class='purchase_cnt'> 구매수량 : "+item.buy_cnt+" </div>"+
   		                        "</div>"+
   		                     "</div>"+
   		                     "<div id='date_status'>"+
   		                        "<div>"+
   		                           "<span class='purchase_status'>"+item.shipping+"</span>"+ 
   		                        "</div>"+
	   		                     "<div>"+
		                           "<span class='purchase_date'>"+item.buy_date+"</span><br>"+
		                         "</div>"+
   		                     "</div>"+
   		               "</div>"+
   		               "</a>";
   		               
   				 })// end of $.each(json, function(index, item){}---------------------------
   			
   				//$("div#show_shipping").empty(); // div 초기화 
   				//$("div#show_shipping_completed").empty();		
   				
   				// 배송상태에 따라 다른 div에 append ///
   				if($("input#input_shipping").val()==0){
   					$("div#show_shipping_completed").empty();	
   					$("div#show_shipping").append(html); // div 값 입력
   					
   				}
   				else if($("input#input_shipping").val()==1){
   					$("div#show_shipping").empty(); // div 초기화 
   					$("div#show_shipping_completed").append(html); // div 값 입력
   				}
   					
   			 // HIT 상품 결과를 출력하기
		    	// >>> !!! 중요 !!! 더보기... 버튼의 value 속성에 값을 지정하기 <<< //
				$("button#btnMoreHIT").val( Number(start) + lenHIT);
				
				// span#countHIT 에 지금까지 출력된 상품의 개수를 누적해서 기록한다.
				$("span#countHIT").text( Number($("span#countHIT").text()) + json.length );
				
				// 더보기... 버튼을 계속해서 클릭하여 countHIT 값과 totalHITCount 값이 일치하는 경우 
				if( $("span#countHIT").text() == $("span#totalHITCount").text() ) {
					$("button#btnMoreHIT").text("처음으로");
					$("span#countHIT").text("0");
				}
   				
   				
   			}
   		}, // end of success
   		error: function(request, status, error) {
   			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
   		}
   	});// end of ajax(){};===========================================================
   				 
}  //end of function callAjax() {}-----------------------		
*/