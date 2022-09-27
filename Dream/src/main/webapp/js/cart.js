$(document).ready(function () {

    let prd_check_length = $("table input:checkbox[name='prd_check']").length
    
    $(".total_cnt").html(prd_check_length);

    $("input#chk_all").click(function (e) { // 전체선택 버튼을 클릭하였을시 이벤트처리
        
        const bool = $("input.chk_all").prop("checked");
        $("input:checkbox[name='prd_check']").prop("checked",bool);
        $("input#mobile_chk_all").prop("checked",bool);

    });// end of $("input:checkbox[name='chk_all']").click(function (e) ----------------

   /* $("input#mobile_chk_all").click(function (e) { // 모바일 전체선택 버튼을 클릭하였을시 이벤트처리
        
        const bool = $("input#mobile_chk_all").prop("checked");
        $("input:checkbox[name='prd_check']").prop("checked",bool);
        $("input#chk_all").prop("checked",bool);

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



    $("button.remove_cart_list").click(function(e) { // 삭제하기 버튼

        const target = $(e.target);

        const remove_div = target.parent().parent().parent().attr("class");

        console.log(remove_div);
        $("."+remove_div).remove();
        prd_check_length = $("table input:checkbox[name='prd_check']").length
        $(".total_cnt").html(prd_check_length);

    });// end of $("button.remove_cart_list").click(function() ------------------



    $("button#remove_check").click(function (e) { // 선택삭제 버튼 이벤트 처리
        $("input:checkbox[name='prd_check']:checked").parent().parent().parent().remove();
        if($("input:checkbox[name='prd_check']").length == 0) {
            $("input#chk_all").prop("checked",false);
            $("button#remove_check").hide();
        }
        else {
            $("button#remove_check").show();
        }
        prd_check_length = $("table input:checkbox[name='prd_check']").length
        $(".total_cnt").html(prd_check_length);
    });// end of $("button#remove_check").click(function (e)



    $("input:checkbox[name='prd_check']").change(function (e) {
        // 체크된 상품들의 total price들을 가져와서 합계를 구한것을 아래 html에 넣어주기
		alert("gggg")
        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text(total_price.toLocaleString('en'));
        
    });// end of $(document).on("change","table#tbl_cart", function (e)

    

    $(document).on("DOMSubtreeModified","table#tbl_cart", function (e) {
        //alert('헿');

        let total_price = 0;
        $("table input:checkbox[name='prd_check']:checked").each(function (index,item) {
            total_price += parseInt( $(item).parent().siblings().find("span.total_price").text().split(",").join("") );
        }); // end of $("input:checkbox[name='prd_check']:checked").each(function (index,item)

        // console.log(total_price);

        $("span#prd_price").text(total_price.toLocaleString('en'));
        $("span.payment_price").text(total_price.toLocaleString('en'));
        
    });// end of $(document).on("DOMSubtreeModified","table#tbl_cart", function (e)



});// end of $(document).ready(function () {} -----------------------------------------------------------------------------------------------------------------------------


function plus(classname) { // 플러스 버튼 눌렀을 시 함수

    console.log(classname)
    
    let cart_qty = parseInt($("."+classname).parent().find("input").val());
    alert("수량이 변경되었습니다.")
    cart_qty = cart_qty+1
    $("."+classname).prev().val(cart_qty);

    let price = $("."+classname).parent().parent().prev().find('span').text();
    price = parseInt( price.split(",").join("") );

    const total_price = cart_qty*price;

    $("."+classname).parent().parent().siblings().find(".total_price").text(total_price.toLocaleString('en'));

    /* if($("."+classname).parent()) */


}

function minus(classname) { // 마이너스 버튼 눌렀을시 함수

    console.log(classname)

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