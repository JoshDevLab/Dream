<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ctxPath = request.getContextPath();
%>
  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/myInformation.css" />
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/myInformation.js" ></script>

<%-- 회원탈퇴 modal 시작 --%> <%-- 회원탈퇴 modal 시작 --%> <%-- 회원탈퇴 modal 시작 --%> <%-- 회원탈퇴 modal 시작 --%> <%-- 회원탈퇴 modal 시작 --%> <%-- 회원탈퇴 modal 시작 --%>
    <div id="ModalMemberOut" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <%-- #ModalPoint을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. --%>
           <div class="modal-content">
              
              <%-- Modal header --%>
              <div class="modal-header">
              <h5 class="modal-title">회원탈퇴</h5>
              
              </div>
              
              <%-- Modal body --%>
              <div class="modal-body">
                
                <div class="content">
                  <div class="withdrawal_wrap">
                    <div>
                      <h4 class="withdrawal_title" >회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요.</h4>
                      <div class="withdrawal_terms" >
                        <div class="terms_box">
                          <h5 class="terms_title" >
                            <div class="checkbox_item">
                              <input id="title0" type="checkbox" name="ModalCheckbox" class="blind">
                              <label for="title0" class="check_label" >
                                <span class="label_txt">KREAM을 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.</span>
                              </label>
                            </div>
                          </h5>
                          <div class="terms_detail">
                            <ul class="terms_list">
                              <li class="terms_item"> 내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시물/댓글), 미사용 보유 포인트 등 사용자의 모든 정보가 사라지며 재가입 하더라도 복구가 불가능합니다. </li>
                              <li class="terms_item"> 탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다 </li>
                            </ul>
                          </div>
                        </div>
                        <div class="terms_box">
                          <h5 class="terms_title">
                            <div class="checkbox_item">
                              <input id="title1" type="checkbox" name="ModalCheckbox" class="blind">
                              <label for="title1" class="check_label">
                                <span class="label_txt">관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.</span>
                              </label>
                            </div>
                          </h5>
                          <div class="terms_detail">
                            <h6 class="terms_subtitle"> 1. 전자상거래 등 소비자 보호에 관한 법률 </h6>
                            <ul class="terms_list">
                              <li class="terms_item"> 계약 또는 청약철회 등에 관한 기록: 5년 보관 </li>
                              <li class="terms_item"> 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 </li>
                              <li class="terms_item"> 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 </li>
                            </ul>
                          </div>
                          <div class="terms_detail">
                            <h6 class="terms_subtitle"> 2. 통신비밀보호법 </h6>
                            <ul class="terms_list">
                              <li class="terms_item"> 접속 로그 기록: 3개월 보관 </li>
                            </ul>
                          </div>
                          <div class="terms_detail">
                            <h6 class="terms_subtitle"> 3. 내부 기준에 따라 별도 보관 </h6>
                            <ul class="terms_list">
                              <li class="terms_item"> 부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 보관 </li>
                            </ul>
                          </div>
                        </div>
                        <div class="terms_box">
                          <h5 class="terms_title">
                            <div class="checkbox_item">
                              <input id="title2" type="checkbox" name="ModalCheckbox" class="blind">
                              <label for="title2" class="check_label">
                                <span class="label_txt">KREAM 탈퇴가 제한된 경우에는 아래 내용을 참고하시기 바랍니다.</span>
                              </label>
                            </div>
                          </h5>
                          <div class="terms_detail">
                            <ul class="terms_list">
                              <li class="terms_item"> 진행 중인 거래(판매/구매)가 있을 경우: 해당 거래 종료 후 탈퇴 가능 </li>
                              <li class="terms_item"> 진행 중인 입찰(판매/구매)가 있을 경우: 해당 입찰 삭제 후 탈퇴 가능 </li>
                              <li class="terms_item"> 미납 수수료(착불 발송비/페널티)가 있을 경우: 해당 결제 완료 후 탈퇴 가능 </li>
                              <li class="terms_item"> 이용 정지 상태인 경우: 이용 정지 해제 후 탈퇴 가능 </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="withdrawal_check">
                        <div class="checkbox_item">
                          <input id="check1All" type="checkbox" name="" class="blind">
                          <label for="check1" class="check_label">
                            <span class="label_txt">회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</span>
                          </label>
                        </div>
                      </div>
                      <div class="withdrawal_btn_box">
                        <a id="MemberOut" href="#" class="btn solid outlinegrey medium disabled"> 탈퇴하기 </a>
                        <a id="MemberOutCancel" data-dismiss="modal" href="#" class="btn solid outlinegrey medium "> 취소하기 </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <%-- Modal footer --%>
              <button id="x" type="button" class="close" data-dismiss="modal">&times;</button>
      
              
           </div>
        </div>
      </div>
    <%-- 회원탈퇴 modal 끝 --%> <%-- 회원탈퇴 modal 끝 --%> <%-- 회원탈퇴 modal 끝 --%> <%-- 회원탈퇴 modal 끝 --%> <%-- 회원탈퇴 modal 끝 --%> <%-- 회원탈퇴 modal 끝 --%> 

    <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%> <%-- 컨테이너 시작 --%>
    <div class="container my lg" style="display: flex;">



        <%-------------------- 사이드바 시작 ----------------------%>
  		
        
        <%-- sidebar 호출 --%>
  		<jsp:include page="/WEB-INF/view/sidebar.jsp" />
        
        
        
        <%-------------------- 사이드바 끝 ----------------------%>
        
        
        
        

        <div id="right-content" style="width: 90%;" class="mt-4">
            <div id="content_title border">
                <h4 class="mb-4 pb-3" style="font-weight:bold; border-bottom: solid 3px black;">프로필 정보</h4>
            </div>
            <div id="user-membership" style="display: flex; padding: 10px;" class="border-bottom pb-5">
                <div id="user-detail" style="display:flex;" class="ml-3 mt-3">
                    <div id="user-image" class="mr-3">
                        <i class="fas fa-thin fa-circle-user fa-6x"></i> 
                    </div>
                    <div id="user-info">
                        <div id="user-name">
                            <p style="font-weight:bold; font-size: 14pt;" class="pt-1 mb-0">조상운</p> <%-- 백단에서 이름 가져오기 --%>
                        </div>
                        <div id="user-email" style="font-size:10pt;">
                            <p>tkddns6621@naver.com</p> <%-- 백단에서 아이디 가져오기 --%>
                        </div>  
                        <button type="button" class="btn btn-light outline-secondary btn-sm" style="font-size: 9pt;">이미지 변경</button>
                        <button type="button" class="btn btn-light outline-secondary btn-sm" style="font-size: 9pt;">내 스타일</button>
                    </div>
                </div>
            </div>
            <div id="profile_info" class="mt-5">
                <div class="profile_group" >
                    <h5 class="category-title font-weight-bold">로그인 정보</h5>
                    <div id="login_information_email" class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p style="color: gray; font-size: small; width: 69px;" class="mb-1">이메일 주소</p>
                            <div id="user_email" style="color: gray;"><span name="email" id="email">회원의 이메일이 나오는곳</span></div>
                        </div>
                        <div class="mt-4" id="div_modifyEmail" style="position: relative; left: -69px;">
                            <p id="new_email" style="color: black; font-size: small;" class="mb-1">새로운 이메일</p>
                            <input type="text" id="modify_email" placeholder="고객님의 이메일" style="border:0 solid black; outline: none; " autocomplete="off" size=50 maxlength=50 /><br>
                            <span id="input_email_error" style="color: red; font-size: xx-small; margin-bottom: 0; display: none;">올바른 이메일 양식으로 입력하세요</span>
                            <br><br>
                            <button id="email_cancle" class="btn btn-light outline-secondary mr-3" style="font-size: 10pt;">취소</button>
                            <button id="email_store" class="btn btn-light outline-secondary " style="font-size: 10pt;">저장</button>
                          </div>
                        <button id="change_email_btn" class="btn btn-light outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">변경</button>
                    </div>
                    <div id="login_information_pwd" class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p style="color: gray; font-size: small; width: 60px;" class="mb-1">비밀번호</p>
                            <div id="user_passwd" style="color: gray;">회원의 비밀번호가 나오는곳</div>
                        </div>
                        <div class="mt-4" id="div_modifyPasswd" style="position: relative; left: -60px;">
                            <p style="color: black; font-size: small;" class="mb-1" id="new_passwd">새로운 비밀번호</p>
                            <input type="password" id="modify_passwd" placeholder="숫자/문자/특수문자 포함 형태의 8 ~ 15자리 이내" style="border:0 solid black; outline: none; " autocomplete="off" size=50 maxlength=50 /><br>
                            <span id="input_passwd_error" style="color: red; font-size: xx-small; margin-bottom: 0; display: none;">숫자/문자/특수문자 포함 형태의 8 ~ 15자리 이내로 작성하세요</span>
                            <br><br>
                            <button id="passwd_cancle" class="btn btn-light outline-secondary mr-3" style="font-size: 10pt;">취소</button>
                            <button id="passwd_store" class="btn btn-light outline-secondary " style="font-size: 10pt;">저장</button>
                          </div>
                        <button id="change_passwd_btn" class="btn btn-light outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">변경</button>
                    </div>
                </div>
                <div class="profile_group" style="margin-top: 7%;">
                    <h5 class="category-title font-weight-bold">개인정보</h5>
                    <div id="login_information_name" class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p style="color: gray; font-size: small; width: 26px;" class="mb-1">이름</p>
                            <div id="user_name" style="color: gray;"><span name="name" id="name">회원의 이름이 나오는곳</span></div>
                        </div>
                        <div class="mt-4" id="div_modifyName" style="position: relative; left: -27px;">
                            <p style="color: black; font-size: small;" class="mb-1" id="new_name">새로운 이름</p>
                            <input type="text" id="modify_name" placeholder="고객님의 이름" style="border:0 solid black; outline: none; " autocomplete="off" size=50 maxlength=50 /><br>
                            <span id="input_name_error" style="color: red; font-size: xx-small; margin-bottom: 0; display: none;">올바른 이름을 입력해주세요. (2-50자)</span>
                            <br><br>
                            <button id="name_cancle" class="btn btn-light outline-secondary mr-3" style="font-size: 10pt;">취소</button>
                            <button id="name_store" class="btn btn-light outline-secondary " style="font-size: 10pt;">저장</button>
                          </div>
                        <button id="change_id_btn" class="btn btn-light outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">변경</button>
                    </div>
                    <div id="login_information_phone" class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p style="color: gray; font-size: small;" class="mb-1">휴대폰 번호</p>
                            <div style="color: gray;">회원의 휴대폰번호가 나오는곳</div>
                        </div>
                        <button class="btn btn-light outline-secondary btn-sm" style="font-size: 10pt; margin-left: auto;">변경</button>
                    </div>
                </div>
                <div class="profile_group" style="margin-top: 7%;">
                    <h5 class="category-title font-weight-bold">광고성 정보 수신</h5>
                    <div class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p class="mb-1">문자 메세지</p>
                        </div>
                        <div style="margin-left: auto;">
                            <label class="form-check-label mr-3" for="msg_agree">
                                수신동의
                                <input type="radio" name="msg_radio" id="msg_agree" value="agree">
                            </label>
                            <label class="form-check-label" for="msg_disagree">
                                수신거부
                                <input type="radio" name="msg_radio" id="msg_disagree" value="disagree">
                            </label>
                        </div>
                    </div>
                    <div class="mt-4 border-bottom pb-4" style="display: flex;">
                        <div>
                            <p class="mb-1">이메일</p>
                        </div>
                        <div style="margin-left: auto;">
                            <label class="form-check-label mr-3" for="email_agree">
                                수신동의
                                <input type="radio" name="email_radio" id="email_agree" value="agree">
                            </label>
                            <label class="form-check-label" for="email_disagree">
                                수신거부
                                <input type="radio" name="email_radio" id="email_disagree" value="disagree">
                            </label>
                        </div>
                    </div>

                </div>

                <div style="margin-top: 50px;">
                    <a class="text-muted"   href="#" data-toggle="modal" data-target="#ModalMemberOut">
                        회원탈퇴 
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    <%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />
    