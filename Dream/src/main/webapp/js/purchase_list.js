function getContextPath() {
      let hostIndex = location.href.indexOf(location.host) + location.host.length;
      let contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
      return contextPath;
   }
   
   let html =" ";
   let dataObj;
   
   function callAjax() {
      
         console.log("확인용 전달될 값 end_date : "+$("input#end_date").val());
         console.log("확인용 전달될 값 start_date : "+$("input#start_date").val());
         console.log("확인용 전달될 값 input_shipping: : "+$("input#input_shipping").val());
         console.log("확인용 전달될 값 sort : "+$("input#sort_date").val());
         console.log("확인용 전달될 값 userid : "+$("input#userid").val());
      
      /*
      dataObj = {
         "end_date": $("input#start_date").val(),
         "start_date": $("input#end_date").val(),
         "input_shipping": $("input_shipping#userid").val(),
         "sort": $("input#sort").val(),
         "userid": $("input#userid").val()
      };
      */
      
      $.ajax({
         url: getContextPath()+"/member/buylistView.dream",
         type: "POST",
         data: {"end_date": $("input#start_date").val(),
               "start_date": $("input#end_date").val(),
               "input_shipping": $("input#input_shipping").val(),
               "sort": $("input#sort_date").val(),
               "userid": $("input#userid").val()},
         dataType: "json",
         success: function(json) {
            
            if(json.length == 0){
               $("div#no_result").html("거래 내역이 없습니다.");
            }
            else if(json.length > 0){
               
               $("div#no_result").html("");
               $("div#show_shipping").empty();
                $.each(json, function(index, item){
                  html += "<div class='purchase_item my-3' style=' border-bottom: solid 1px gray; border-top: solid 1px gray;'>"+
                              "<div id='purchase_detail'  class='d-flex'>"+
                                 "<div class='image_box' style='line-height: 110px;'>"+
                                    "<img id ='' class='product_img' src='' alt='...'>"+
                                 "</div>"+
                                 "<div id = 'name_cnt'>"+
                                    "<div class='item_name'> "+item.product_name+" </div>"+
                                    "<div class='purchase_cnt'> 구매수량"+item.buy_cnt+" </div>"+
                                 "</div>"+
                              "</div>"+
                              "<div id='date_status'>"+
                                 "<div>"+
                                    "<span id='purchase_date'>"+item.buy_date+"</span><br>"+
                                 "</div>"+
                                 "<div>"+
                                    "<span id='purchase_status'></span>"+
                                 "</div>"+
                              "</div>"+
                        "</div>";
                })// end of $.each(json, function(index, item){}---------------------------
               $("div#show_shipping").append(html);
            }
         }, // end of success
         error: function(request, status, error) {
            alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
         }
      });
                
   }// end of function callAjax() {}-----------------------
   
   $(document).ready(function() {
      
//      callAjax();

      // DatePicker 한글, 기타 속성 시작
      $.datepicker.setDefaults({
         dateFormat: 'yy-mm-dd' //Input Display Format 변경
         , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
         , showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
         , changeYear: true //콤보박스에서 년 선택 가능
         , changeMonth: true //콤보박스에서 월 선택 가능    
         // input 태그 옆 달력 아이콘 비활성화           
         // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
         // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
         // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
         , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
         , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
         , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
         , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
         , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
         , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
         // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
         // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
      });
   
   
      //input을 datepicker로 선언
      $("input#start_date").datepicker();
      $("input#end_date").datepicker();
   
      //From의 초기값을 오늘 날짜로 설정
      $('input#start_date').datepicker('setDate', '-2M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
      $('input#end_date').datepicker('setDate', 'today');
      // DatePicker 한글, 기타 속성 끝
   
   
      // 진행중 클릭시 테두리, 글자 속성 변경 
      $("div#shipping_cnt_left").click(function(e) {
         $("div#shipping_cnt_right").css("border", "");
         $("div.shipping_status").css({ "font-weight": "", "color": "" });
         $("div#shipping_cnt_right > div.purchase_count").css("color", "black");
         $("div#shipping_cnt_left").css("border-bottom", "solid 2px #222");
         $("div#shipping_cnt_left > div.purchase_count").css("color", "#f15746");
         $("div#shipping_cnt_left > div.shipping_status").css({ "font-weight": "700", "color": "#222" });
         $("div#show_shipping_completed").hide();
         $("div#show_shipping").show();
         // div가 클릭되면 select 해오기 위해 사용되는 배송중 상태를 input태그(type="hidden")에 값 넣기
         $("div#status_button> input#input_shipping").val("0");
         
         $("div#show_shipping").empty();
         callAjax();
      });
      
   
      // 종료 클릭시 테두리, 글자 속성 변경 
      $("div#shipping_cnt_right").click(function(e) {
         $("div#shipping_cnt_left").css("border", "");
         $("div.shipping_status").css({ "font-weight": "", "color": "" });
         $("div#shipping_cnt_left > div.purchase_count").css("color", "black");
         $("div#shipping_cnt_right").css("border-bottom", "solid 2px #222");
         $("div#shipping_cnt_right > div.purchase_count").css("color", "#f15746");
         $("div#shipping_cnt_right > div.shipping_status").css({ "font-weight": "700", "color": "#222" });
         $("div#show_shipping").hide();
         $("div#show_shipping_completed").show();
   
         // div가 클릭되면 select 해오기 위해 사용되는 배송중 상태를 input태그(type="hidden")에 값 넣기
         $("div#status_button> input#input_shipping").val("1");
         
         $("div#show_shipping").empty();
         callAjax();
   
      });
   
      //구매일 버튼 클릭시 아이콘 변경 
      $("button#btn_purchaseDate").click(function(e) {
   
         let sort = $("input#sort_date");
   
         $("button.result_detail").css("font-weight", "");
         $("button#btn_purchaseDate").css("font-weight", "bold");
   
         if ($("button#btn_purchaseDate > i").hasClass("fa-sort-up")) {
            $("button#btn_purchaseDate > i").removeClass("fa-sort-up").addClass("fa-sort-down");
            $("input#sort_date").val("asc");
            alert(sort.val());
         
         }
         else {
            $("button#btn_purchaseDate > i").removeClass("fa-sort-down").addClass("fa-sort-up");
            sort.prop('value', "desc");
            $("input#sort_date").val("desc");
            alert(sort.val());
         
         }
         // sort.val()에 저장된  asc / desc 전달
         $("div#show_shipping").empty();
         callAjax();
      });
   
      // 상태 버튼삭제됨 ------------------------------------------------------------------------------
      // 상태 버튼 클릭시 아이콘 변경 
      /*
      $("button#btn_purchaseStatus").click(function(e) {
   
         let status = $("input#sort_status");
         const frm = document.sort;
   
         $("button.result_detail").css("font-weight", "");
         $("button#btn_purchaseStatus").css("font-weight", "bold");
   
         if ($("button#btn_purchaseStatus > i").hasClass("fa-sort-up")) {
            $("button#btn_purchaseStatus > i").removeClass("fa-sort-up").addClass("fa-sort-down");
            alert(status.val());
         }
         else {
            $("button#btn_purchaseStatus > i").removeClass("fa-sort-down").addClass("fa-sort-up");
            status.val("종료");
            alert(status.val());
         }
   
         // status.val()에 저장된 진행중 / 종료 전달
         frm.method = 'GET';
         frm.action = "";
         frm.submit();
      });
      */
      // 상태 버튼삭제됨 ------------------------------------------------------------------------------
   
   
      // 최근 2개월, 4개월 , 6개월 버튼 클릭시 ===========================================================
      // 최근 2개월 버튼 클릭시 발생하는 이벤트
      $("button#two_month").click(function(e) {
         // alert("최근 2개월 버튼 클릭시");
         $('input#start_date').datepicker('setDate', '-2M');
         $('input#end_date').datepicker('setDate', 'today');
         $("button#search_simple").trigger('click'); // 조회버튼 클릭 
      
   
      });
   
      // 최근 4개월 버튼 클릭시 발생하는 이벤트
      $("button#four_month").click(function(e) {
         // alert("최근 4개월 버튼 클릭시");
         $('input#start_date').datepicker('setDate', '-4M');
         $('input#end_date').datepicker('setDate', 'today');
         $("button#search_simple").trigger('click'); // 조회버튼 클릭 
   
      });
   
      // 최근 6개월 버튼 클릭시 발생하는 이벤트
      $("button#six_month").click(function(e) {
         // alert("최근 6개월 버튼 클릭시");
         $('input#start_date').datepicker('setDate', '-6M');
         $('input#end_date').datepicker('setDate', 'today');
   
         $("button#search_simple").trigger('click'); // 조회버튼 클릭 
   
      });
      // 최근 2개월, 4개월 , 6개월 버튼 클릭시 ===========================================================
   
   
   
   
      // 날짜 입력 후 조회 버튼클릭시
      $("button#search_simple").click(function(e) {
         $("div#show_shipping").empty();
         callAjax();
      });
   
      // 태블릿, 모바일에서 기간 조회 버튼 클릭시 
      $("button#search_date").click(function(e) {
         // 선택된 option 태그 value 갖고오기
         const date_selected = $("select#select_month option:selected").val();
   
         // 올바른 기간이 선택된 경우에만 기간조회 진행 
         if (date_selected != '기간선택') {
            const year = date_selected.substring(0, 4);
            const month = date_selected.substring(6, 8);
   
            alert(year + "," + month);
         }
         $("div#show_shipping").empty();
         callAjax();
      });
   
      // select 태그 클릭 클릭시 기간선택 option hidden 처리하기
      $("select#select_month").click(function(e) {
         $("select#select_month").children("option[value='기간선택']").prop("hidden", true);
      });
   
   
      /* 사이드바 script 시작 */
      $("div.category-section > ul > li").click(function(e) {
         //  클릭할 경우 글자 css 변경
         alert("클릭됨.");
         $("div.category-section > ul > li > a").css({ "font-weight": "", "color": "" });
         $(e.target).css({ "font-weight": "700", "color": "black" });
      });
      /* 사이드바 script 끝  */
   
   
      /* 현재 날짜 구하기 */
      let today = new Date();
   
      let year = today.getFullYear(); // 년도
      let month = today.getMonth() + 1;  // 월
   
      /* 모바일 화면에서 기간선택 클릭 시 나오는 년도/월 현재날짜 기준으로 입력 */
      for (let i = 2; i < 9; i++) {
         $("select#select_month > option:nth-child(" + i + ")").text(year + "년 " + (month - (i - 2)) + "월");
      }
   
   });// end of $(document).ready(function()----------------------------------