$("document").ready(function(){
      // 변수선언
      const btn_toggle_filter = $("a.btn_toggle_filter");
      const plus_icon = $("i.plus_icon");
      const minus_icon = $("i.minus_icon");
      
      $("form.togglebox").hide();
      minus_icon.hide();
      // 사이드필터에서 토글버튼() 클릭시 토글부분을 보여주는 함수
      btn_toggle_filter.click(function(e){
        const target = $(e.target);
        target.parent().next().toggle();
        target.find("i.plus_icon").toggle();
        target.find("i.minus_icon").toggle();
      });
      // 사이드필터에서 토글버튼(플러스) 클릭시 토글부분을 보여주는 함수
      plus_icon.click(function(e){
        const target = $(e.target);
        target.parent().parent().next().show();
        target.hide();
        target.next().show();
      });//end of btn_toggle_filter.click(function(e){}--
      // 사이드필터에서 토글버튼(마이너스버튼) 클릭시 토글부분을 보여주는 함수
      minus_icon.click(function(e){
        
        const target = $(e.target);
        target.parent().parent().next().hide();
        target.hide();
        target.prev().show();
      });//end of btn_toggle_filter.click(function(e){}--
      // ===== sidefilter 부분 javascript 끝 ===== //


      // selet 태그에서 첫번째 옵션 값을 숨기는 함수 
      $("select#sort_option").click(function(e){
          $("select#sort_option").children("option[value='정렬옵션']").prop("hidden",true);
      });
  }); // end of $("document").ready(function(){}----





