$(document).ready(function () {

    let prd_check_length = $("table input:checkbox[name='prd_check']").length
    
    $(".total_cnt").html(prd_check_length);

    $("input#chk_all").click(function (e) { // 전체선택 버튼을 클릭하였을시 이벤트처리
        
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

    $("input#mobile_chk_all").click(function (e) { // 모바일 전체선택 버튼을 클릭하였을시 이벤트처리
        
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


    $("input:checkbox[name='prd_check']").change(function (e) {
        // 체크된 상품들의 total price들을 가져와서 합계를 구한것을 아래 html에 넣어주기
        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );
        
        
    });// end of $(document).on("change","table#tbl_cart", function (e)

    

    $(document).on("DOMSubtreeModified","table#tbl_cart", function (e) {
        //alert('헿');

        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text( (total_price - Number($("input#point").val())).toLocaleString('en') );
        
    });// end of $(document).on("DOMSubtreeModified","table#tbl_cart", function (e)
    
    
    
    // 포인트 js
    
    // 포인트입력칸 숫자만 가능하도록
      $("input#point").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
    
      // blur 입력숫자가 보유숫자보다 크면
         $("input#point").blur(function(){
         if(Number($(this).val()) >  Number($("span.point").text())){
            alert("보유한 포인트보다 많은 포인트를 사용하실 수 없습니다. 다시 입력해주세요!");
            $(this).val('');
            return;
         }         
         
         /*if(Number($(this).val() != null && Number($(this).val()) != 0){
            $("#span_point_amount").text($(this).val());
         }
         else{
            $("#span_point_amount").text('-');
         }*/
         
      });
      // 전부사용 버튼
      $("button#pointAlluse").click(function(){
         $("input#point").val($("span.point").text());
         $("#span_point_amount").text($("input#point").val());
         $("span#sale_point").text( $("span.point").text() );
      });
      
      $("input#point").change(function() {
	
		const length = $("input:checkbox[name='prd_check']:checked").length
		
		if(length == 0) {
			alert("제품을 먼저 선택하시고 포인트를 입력하세요");
			return;
		}
		
		if(Number($("span#prd_price").text().split(",").join("") < $("input#point").val())) {
			alert("구매가격보다 높은 포인트는 사용할 수 없습니다.");
			return;
		}
	
		$("span.sale_point").text( $("input#point").val() );
		$(".payment_price").text( (Number($("span#prd_price").text().split(",").join("")) - Number($("input#point").val())).toLocaleString('en') )
	
	  });
    

});// end of $(document).ready(function () {} -----------------------------------------------------------------------------------------------------------------------------


function plus(classname) { // 플러스 버튼 눌렀을 시 함수

    //console.log(classname)
    
    let total_cnt = $("."+classname).parent().parent().parent().find("span#size_cnt").text();
    let cart_qty = parseInt($("."+classname).parent().find("input").val());
    
    if(total_cnt == cart_qty) {
		alert("재고량보다 더 주문할 수 없습니다.");
		return;
	}
    
    alert("수량이 변경되었습니다.")
    cart_qty = cart_qty+1
    $("."+classname).prev().val(cart_qty);

    let price = $("."+classname).parent().parent().prev().find('span').text();
    price = parseInt( price.split(",").join("") );

    let total_price = cart_qty*price;

    $("."+classname).parent().parent().siblings().find(".total_price").text(total_price.toLocaleString('en'));
    
    const discount_rate = $("."+classname).find('span.discount_rate').text();
    const discount_price = total_price * Number(discount_rate);
    
    $("."+classname).parent().parent().siblings().find(".plus_point").text(discount_price.toLocaleString('en'));

	

}

function minus(classname) { // 마이너스 버튼 눌렀을시 함수

    //console.log(classname)

    let cart_qty = parseInt($("."+classname).parent().find("input").val());

    if(cart_qty>0) {
        $("."+classname).prop("disabled",false);
        alert("수량이 변경되었습니다.")
        cart_qty = cart_qty-1
        $("."+classname).next().val(cart_qty);

        let price = $("."+classname).parent().parent().prev().find('span').text();
        price = parseInt( price.split(",").join("") );

        const total_price = cart_qty*price;

        $("."+classname).parent().parent().siblings().find(".total_price").text(total_price.toLocaleString('en'));
    }
    else if(cart_qty == 0){
        $("."+classname).prop("disabled",true);
    }
    
}

  