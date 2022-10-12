
function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}

const urlParams = new URL(location.href).searchParams;
let type = urlParams.get('type');
let p = urlParams.get('p');

$(document).ready(function () {
	


	
	if(type == null){
		type="receieve";
	}
	if(p == null){
		p == "1";
	}

	
	
	});
	

	
	   // 페이징처리 post 타입으로 이악물고 하기
   $("a.page-link").click(function(e){
	
		
		
	
	});
   



function goPage(page){
		
		console.log(page);
		p = page;
		
		callAjax();
}


function callAjax() {
	  

   	// 결과 값 찍어주는 ajax
   	$.ajax({
   		url: getContextPath()+"/member/message.dream",
   		type: "GET",
   		data: {"type": type,
   			   "p": p,
   			   },
   		dataType: "json",
   		success: function(json) {
   	
   			
   			let html =" ";
   			
   			// 조회결과가 있는 경우 
   			if(json.cnt > 0){
				console.log(json.cnt);
   				$("tbody").remove();

			}
   			
   		}, // end of success
   		 error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
   	});// end of ajax(){};===========================================================
 			 
}  //end of function callAjax() {}-----------------------		

