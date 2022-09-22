$(document).ready(function(){
        // 이메일 주소 클릭시 
         $("input#input_userid").focus((e)=>{
            $(e.target).css("outline","none");
            $(e.target).attr("placeholder"," ");
         });
         // 이메일 주소 커서 상실시 
         $("input#input_userid").blur((e)=>{
            $(e.target).css({"border":"","border-bottom":""});
            $(e.target).attr("placeholder","예)dream@dream.co.kr");
         });
         
         // 비밀번호 클릭시 
         $("input#input_passwd").focus((e)=>{
            $(e.target).css("outline","none");
            $(e.target).attr("placeholder"," ");
         });
         // 비밀번호 커서 상실시 
         $("input#input_passwd").blur((e)=>{
            $(e.target).css({"border":"","border-bottom":""});
         });


      });// end of $(document).ready(function(){