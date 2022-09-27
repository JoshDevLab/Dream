// js파일에서 contextPath를 알아내는 함수
function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}


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
