$(document).ready(function(){
      $("button#btn_join").attr("disabled",true);
      $("button#btn_join").css("background","#EBEBEB");
      
      // 변수 선언
      const input_userid = $("input:text[name='userid']");
      const input_passwd = $("input:password[name='passwd']");
      const input_passwd_check = $("input:password[name='passwd_check']");
      const userid = input_userid.val().trim(); //사용자가 입력한 유저아이디 값
      const passwd = input_passwd.val().trim(); //사용자가 입력한 비밀번호 값
      
      input_userid.focus();


			// 숫자/문자/특수문자 포함 형태의 8 ~ 15자리 이내의 암호 정규 표현식
      // const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);

      //아이디 인풋박스에 값을 입력시
      input_userid.keydown(function(){ 
        check_userid();
      });

      //비밀번호 인풋박스에 값을 입력시
      input_passwd.keydown(function(){  
        check_passwd();
      });
      //비밀번호확인 인풋박스에 값을 입력시
      input_passwd_check.keydown(function(){  
        
      });//end of input_passwd_check.keydown(function(){})-----



      // Function Declaration
      function check_userid(){
        input_userid.css("border-bottom","solid 1px red");  //빨간색 밑줄
        $("p#userid_error").css("display","block");  //에러문구
        $("label[for='userid']").css("color","red");  //라벨 빨간색
      }
  
      function check_passwd(){
        input_passwd_check.css("border-bottom","solid 1px red");  //빨간색 밑줄
        $("p#passwd_check_error").css("display","block");  //에러문구
        $("label[for='passwd_check']").css("color","red");  //라벨 빨간색
      }
    });//end of  $(document).ready(function(){}-----
