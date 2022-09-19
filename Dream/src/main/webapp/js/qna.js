$(document).ready(function(){
    // 변수선언
    const headline = $("tr.headline");
    const upIcon = $("td.upIcon");
    const downIcon = $("td.downIcon");
    upIcon.hide();
    $("tr.content").hide();
    
    
    // 헤드라인 클릭시 자주묻는질문 내용물 보여주기
    headline.click(function(e){
      const target = $(e.target);
      // .closest( [selector] )
      content = target.parent().next();
      target.parent().next().toggle();
      target.parent().children("td.upIcon").toggle();
      target.parent().children("td.downIcon").toggle();
    });
  });//end of $(document).ready(function(){}---

      
      // Function Declaration
      // 전체버튼 클릭시 실행함수
      function select_all(){
        alert("전체버튼 클릭");
      }
      // 이용정책 클릭시 실행될 함수
      function select_policy(){
        alert("이용정책버튼 클릭");
      }
      // 공통 클릭시 실행될 함수
      function select_common(){
        alert("공통버튼 클릭");
      }
      // 구매 클릭시 실행될 함수
      function select_buy(){
        alert("구매버튼 클릭");
      }