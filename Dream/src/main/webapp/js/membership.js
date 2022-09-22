$(document).ready(function(){

         // 현재 날짜 구하기 시작
         let today = new Date();   
         let year = today.getFullYear(); // 년도
         let month = today.getMonth() + 2;  // 월
         let date = today.getDate();  // 날짜
         
         $("span#membership_year").text(year);
         $("span#membership_month").text(month);
         $("span#membership_date").text(date);
         // 현재 날짜 구하기 끝

         
         // 드림캐쳐 버튼 클릭시 발생하는 이벤트 시작
         $("button#regist").click(function(e){
            alert("멤버십 가입버튼 클릭");
         });
         // 드림캐쳐 버튼 클릭시 발생하는 이벤트 끝



      });// end of $(document).ready(function()-------------------------------