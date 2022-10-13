function goRead(read_check, messageno){
      
   if(read_check == 0 ){
   
         $.ajax({
         url: getContextPath()+"/member/readmessage.dream",
         type: "GET",
         data: {"messageno": messageno},
         dataType: "json",
         success: function(json) {
   
         if(json.success == 1){// 1개 읽음처리
         
            $("td#icon"+messageno).empty();
            console.log("sival")
            $("td#icon"+messageno).append(`<i class="fa-solid fa-envelope-open"></i>`);
            
         }
            
            
         }, // end of success
          error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
      });// end of ajax(){};===========================================================
           
      
   }

}



function goPage(page){
      
   console.log("page"+page);
   p = page;
   
   callAjax();
}

function deleteAll(){
      
    let param = []
    let messageno ;
           
    $("input:checkbox[id='sub_check']:checked").each(function(index,item) {
       

       messageno = $(item).parent().attr('asd');
       param.push(messageno);
           
    });
    
    $.ajax({
         url: getContextPath()+"/member/deletemessage.dream",
         type: "GET",
         data: {"messageno": param},
         dataType: "json",
         success: function(json) {
   
         if(json.success == 1){// 1개 읽음처리
         
            $("td#icon"+messageno).empty();
            console.log("sival")
            $("td#icon"+messageno).append(`<i class="fa-solid fa-envelope-open"></i>`);
            
         }
            
            
         }, // end of success
          error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
      });// end of ajax(){};===========================================================
           
    

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
               $("tbody").empty();
               
            
               $.each(json.printmessageList,function(index, item){   
            
               console.log(item.messageno);
               html+=
               `<tr>
                    <td id="list_check" style="width:30px;" data-toggle="modal" data-target="#message_modal" data-dismiss="modal" onclick="message_info('${item.messageno}','${item.title}','${item.contents}','${item.read_check}');">
                    <input type="checkbox" id="sub_check" name="sub_check" style="margin-right: 10px;"/>        
                    </td>
                    <td id="icon" style="width: 30px;"> ` ;  
                  if(item.read_check==0){
                  html+= `<i class="fa-solid fa-envelope"></i>`;
                }   
                if(item.read_check==1){
                  html+= `<i class="fa-solid fa-envelope-open"></i>`;
                }
                html+=
               `</td>
                    
                    <td colspan="7" style=" font-weight: bold"  data-toggle="modal" data-target="#message_modal" data-dismiss="modal" onclick="message_info('${item.messageno}','${item.title}','${item.contents}','${item.read_check}');">
                       ${item.title}         
                   </td>
                   <td  data-toggle="modal" data-target="#message_modal" data-dismiss="modal" onclick="message_info('${item.messageno}','${item.title}','${item.contents}','${item.read_check}');">
                         ${item.shipping}
                         <input type="text" id="load_messageno" name="load_messageno" value="${item.messageno}"/> 
                         <input type="text" id="load_fk_sender_userid" name="load_fk_sender_userid" value="${item.fk_sender_userid}"/>   
                         
                        
                   </td>
                </tr>`;

            })
            $("tbody").append(html);
         }
            
         }, // end of success
          error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
      });// end of ajax(){};===========================================================
           
}  //end of function callAjax() {}-----------------------      


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
               "p": p },
         dataType: "json",
         success: function(json) {
      
            console.log(json.cnt);
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
