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



});
};  






$(document).ready(function() {

$("#productImage").Scrolling(0 , ($("#column_2").height() - $("#productImage").height()-16));
// 마지막 p 타입의 마진 16을 더빼줘야 글이랑 위치가 맞음

}); 




