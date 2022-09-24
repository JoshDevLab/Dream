$(document).ready(function () {

    let name_modify = "";

    $("#div_modifyName").hide();
    $("#div_modifyEmail").hide();
    $("#div_modifyPasswd").hide();
    $("#email_certification").hide();
    $("button#certification_email_btn").prop("disabled",true);
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#change_id_btn").click(function (e) { // 아이디 변경 버튼을 클릭했을 경우
       
        $("#change_id_btn").hide();
        $("#user_name").hide();
        $("#div_modifyName").show();

        $("input#modify_name").val('');
        $("input#modify_name").focus();
        $("button#name_store").prop("disabled",true);

        $("#modify_name").keyup(function (e) {
            
            name_modify = $("#modify_name").val();

            if(name_modify == '') {
                $("button#name_store").prop("disabled",true);
            }
            else {
                $("button#name_store").prop("disabled",false);
            }
        })
    }); // end of $("#change_id_btn").click(function (e) {}


    $(document).on("click","button#name_cancle",function(e){ // 아이디 변경 취소 버튼 클릭이벤트 

        $("#div_modifyName").hide();
        $("#change_id_btn").show();
        $("#user_name").show();
        $("button#name_cancle").css("border-bottom","");  //빨간색 밑줄
        $("#input_name_error").hide();
        $("#new_name").css("color","black");  //라벨 빨간색
        
    });// end of $(document).on("click","button#name_cancle",function(e){}

    $(document).on("click","button#name_store",function(e){ // 아이디 변경 저장 버튼 클릭이벤트 

        const modify_name = $("#modify_name").val();

        $("#div_modifyName").hide();
        $("#change_id_btn").show();
        $("#user_name").show();
        $("span#name").text(modify_name);
        

    }); // end of $(document).on("click","button#name_store",function(e){}

    $(document).on("keyup","input#modify_name",function(e) { // 성명 2글자 이상 50글자 이하 유효성 검사 처리

        const regExp = /^.{2,50}$/;

        const bool = regExp.test( $(e.target).val() );


        if(!bool) {
            $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
            $("#input_name_error").show();  //에러문구
            $("#new_name").css("color","red");  //라벨 빨간색 
            $("button#name_store").prop("disabled",true);
        }
        else {
            $(e.target).css("border-bottom","");  //빨간색 밑줄
            $("#input_name_error").hide();
            $("#new_name").css("color","black");  //라벨 빨간색 
            $("button#name_store").prop("disabled",false);
        }

    });// end of $(document).on("keydown","input#modify_name",function(e) {}

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#change_email_btn").click(function (e) { // 이메일 변경 버튼을 클릭했을 경우
    
    	   resetEmail();
       
       $("#change_email_btn").hide();
       $("#user_email").hide();
       $("#div_modifyEmail").show();
       $("input#modify_email").prop("disabled",false);

       $("input#modify_email").val('');
       $("input#modify_email").focus();
       $("button#email_store").prop("disabled",true);



       $("#modify_email").keyup(function (e) {
           
           email_modify = $("#modify_email").val();

           if(email_modify == '') {
               $("button#email_store").prop("disabled",true);
           }
           else {
               $("button#email_store").prop("disabled",false);
           }
       })
   }); // end of $("#change_email_btn").click(function (e) {}


   $(document).on("click","button#email_cancle",function(e){ // 이메일 변경 취소 버튼 클릭이벤트 

       $("#div_modifyEmail").hide();
       $("#change_email_btn").show();
       $("#user_email").show();
       $("#email_certification").hide();
       $("input#modify_email").css("border-bottom","none");  //빨간색 밑줄
       $("#input_email_error").hide();
       $("#new_email").css("color","black");  //라벨 빨간색
       
   });// end of $(document).on("click","button#name_cancle",function(e){}




   $(document).on("keyup","input#modify_email",function(e) { // 이메일 유효성 처리
        
        const regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        const bool = regExp.test( $(e.target).val() );

        if(!bool) {
            $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
            $("#input_email_error").show();  //에러문구
            $("#new_email").css("color","red");  //라벨 빨간색 
            $("button#email_store").prop("disabled",true);
        }
        else {
            $(e.target).css("border-bottom","");  //빨간색 밑줄
            $("#input_email_error").hide();
            $("#new_email").css("color","black");  //라벨 빨간색 
            $("button#email_store").prop("disabled",false);
        }

    });// end of $(document).on("keydown","input#modify_name",function(e) {}

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#change_passwd_btn").click(function (e) { // 비밀번호 변경 버튼을 클릭했을 경우
       
       $("#change_passwd_btn").hide();
       $("#user_passwd").hide();
       $("#div_modifyPasswd").show();

       $("input#modify_passwd").val('');
       $("input#modify_passwd").focus();
       $("button#passwd_store").prop("disabled",true);

       $("#modify_email").keyup(function (e) {
           
           passwd_modify = $("#modify_passwd").val();

           if(passwd_modify == '') {
               $("button#passwd_store").prop("disabled",true);
           }
           else {
               $("button#passwd_store").prop("disabled",false);
           }
       })
   }); // end of $("#change_email_btn").click(function (e) {}


   $(document).on("click","button#passwd_cancle",function(e){ // 비밀번호 변경 취소 버튼 클릭이벤트 

       $("#div_modifyPasswd").hide();
       $("#change_passwd_btn").show();
       $("#user_passwd").show();

       $("input#modify_passwd").css("border-bottom","none");  //빨간색 밑줄
       $("#input_passwd_error").hide();
       $("#new_passwd").css("color","black");  //라벨 빨간색
       
   });// end of $(document).on("click","button#name_cancle",function(e){}

   $(document).on("click","button#passwd_store",function(e){ // 비밀번호 변경 저장 버튼 클릭이벤트 

       const modify_passwd = $("#modify_passwd").val();

       $("#div_modifyPasswd").hide();
       $("#change_passwd_btn").show();
       $("#user_passwd").show();
       $("span#passwd").text(modify_passwd);
       

   }); // end of $(document).on("click","button#name_store",function(e){}

   $(document).on("keyup","input#modify_passwd",function(e) { // 성명 2글자 이상 50글자 이하 유효성 검사 처리
        
        // 숫자/문자/특수문자 포함 형태의 8 ~ 15자리 이내의 암호 정규 표현식
        const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);

        const bool = regExp.test( $(e.target).val() );

        if(!bool) {
            $(e.target).css("border-bottom","solid 1px red");  //빨간색 밑줄
            $("#input_passwd_error").show();  //에러문구
            $("#new_passwd").css("color","red");  //라벨 빨간색 
            $("button#passwd_store").prop("disabled",true);
        }
        else {
            $(e.target).css("border-bottom","");  //빨간색 밑줄
            $("#input_passwd_error").hide();
            $("#new_passwd").css("color","black");  //라벨 빨간색 
            $("button#passwd_store").prop("disabled",false);
        }
  
    });// end of $(document).on("keydown","input#modify_name",function(e) {}
    


  const check_length = $("input:checkbox[name='ModalCheckbox']").length;
  const ModalCheckbox = $("input:checkbox[name='ModalCheckbox']");
  
  // 전체체크버튼 클릭
  $("input#check1All").click(function (e) {
    
    const bool = $(e.target).prop("checked");
    ModalCheckbox.prop("checked",bool);
    const checked_length = $("input:checkbox[name='ModalCheckbox']:checked").length;

    
    if(checked_length==check_length) {
     
      $('a#MemberOut').removeClass('disabled');
      $('a#MemberOut').prop("disabled",false);
    }
    else{
      $('a#MemberOut').addClass('disabled');
      $('a#MemberOut').prop("disabled",true);
    }
  });

  // 그냥 버튼 체크시
  ModalCheckbox.click(function (e) {
    const checked_length = $("input:checkbox[name='ModalCheckbox']:checked").length;

    if(checked_length<check_length) {
      $("input#check1All").prop("checked",false);
      $('a#MemberOut').addClass('disabled');
      $('a#MemberOut').prop("disabled",true);
    }
    else if(checked_length==check_length) {
      $("input#check1All").prop("checked",true);
      $('a#MemberOut').prop("disabled",false);
      $('a#MemberOut').removeClass('disabled');
    }
  });


  
  $('#MemberOut').click(function (){
    alert("바이바이");
  });

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function resetEmail() {
   $("#div_modifyEmail").hide();
   $("#change_email_btn").show();
   $("#user_email").show();
   $("#email_certification").hide();
   $("input#modify_email").css("border-bottom","none");  //빨간색 밑줄
   $("#input_email_error").hide();
   $("#new_email").css("color","black");  //라벨 빨간색
}

});// end of $(document).ready(function () {} -----------------------------------------------------------------------------------------------------------------------------


function getContextPath(){
  let hostIndex = location.href.indexOf(location.host) + location.host.length;
  let contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
  return contextPath;
}

