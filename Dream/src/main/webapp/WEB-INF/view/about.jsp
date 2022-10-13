<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
  <title>DREAM | 편안한 수면을 위한 FLEX</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
  <%-- Font Awesome 5 Icons --%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <%-- title Icon --%>
  <link href="<%= ctxPath%>/images/titleicon.png" rel="shortcut icon" type="image/x-icon">
  <%-- 직접 만든 CSS --%>
  <link rel="stylesheet" href="<%= ctxPath%>/css/about.css">
  
  <%-- Optional JavaScript --%>
  <script type="text/javascript" src="<%= ctxPath%>/jquery3.6.0/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

  <%-- fullpage 라이브러리 --%>
  <link href="<%= ctxPath%>/fullpagelib/jquery.fullPage.css" rel="stylesheet"> 
  <script type="text/javascript" src="<%= ctxPath%>/fullpagelib/jquery.fullPage.js"></script>
  
  <%-- TypeIt 라이브러리 --%>
  <script src="https://unpkg.com/typeit@8.7.0/dist/index.umd.js"></script>
  
  <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/about.js" ></script>
  
  
</head>


<body>
  <div class="header d-flex justify-content-between align-items-center">
    <div>
      <a href="<%= ctxPath%>/index.dream"><h1 id="logo">DREAM</h1></a>
    </div>
    <ul class="sns_list list-unstyled d-flex">
      <li class="sns_list mr-3" style="cursor:pointer;" onclick="window.open('https://www.facebook.com/')" target="_blank"><i class="fa-brands fa-facebook fa-2x"></i></li>
      <li class="sns_list" style="cursor:pointer;" onclick="window.open('https://www.instagram.com/dream_kr_official/')" target="_blank"><i class="fa-brands fa-2x fa-instagram"></i></li>
    </ul>
  </div>



  
  <main id="fullpage">
  
    <%-- 시작 section1 --%>
    <div class="section">
      <h1 id="project_dream" class="text-center" style="font-weight:bold">Project Dream</h1>
    </div>
    <%-- 시작 section1 --%>
    
    
    
    <%-- 드림개발목적 section2 시작 --%>
    <div id="develop_reason_section" class="section">
      <h1 id="develop_reason" class="text-center" style="font-weight:bold">
        Dream은 왜 만들어졌나요?
      </h1>
    </div>
    <%-- 드림개발목적 section2 끝 --%>
    
    
    
    <%-- 드림개발목적 section3 시작 --%>
    <div id="develop_reason_section2" class="section">
    
      <div id="develop_reason_text" class="clipText w-75">
        <h1 style="font-weight:bold;">드림 개발 목적</h1>
        <p>코로나로 인해 활성화된 온라인 커머스 시장에서 서비스를 제공해보고 싶다 생각하던 도중 현대인들에게 부족한 잠을 떠올리게 되었고</p>
        <p>어떻게 하면 수면의 질을 올릴 수 있을까 하다가</p>
        <p>수면용품 전문 쇼핑몰을 기획하게 되었습니다.</p>
      </div>
      
    </div>
    <%-- 드림개발목적 section3 끝 --%>
    
    
    
    
    <%-- 드림개발자소개 section4 시작 --%>
    <div id="developer_introduce_section" class="section">
      <h1 id="developer_introduce" class="text-center" style="font-weight:bold">
        드림 개발자 소개
      </h1>
    </div>
    <%-- 드림개발자소개 section4 끝 --%>
    
    
    
    
    <%-------------------------------------- 최현우 section5 시작 ------------------------------------%>
    <div id="hyunwoo" class="section">
      <div id="hyunwoo_container" class="container d-flex flex-column">
        <div class="introduce d-flex">
          <div id="hyunwoo_profile_image" class="profile_image">
            <div class="profile_image_box">
              <img src="<%=ctxPath%>/images/basic_profile_img.PNG"/>
            </div>
            <p class="text-center" style="font-size:18pt; font-weight:bold">Hyun Woo</p>
          </div>
          
          <div class="introduct_my_self ml-5">
            <div id="hyunwoo_about_me" class="about_me">
              <h4 style="font-weight:bold">ABOUT ME</h4>
              <%-- 자기소개 내용물 시작 --%>
              <div class="about_me_content pl-4">
                <p style="font-weight:bold; font-style:italic">"세상에 Hello World를 처음 외치던 순간부터 세상을 바꾸는 개발자를 꿈꾸다"</p>
				<p>
				  상상하던 것을 현실로 구현하는 개발자라는 직업에 매력을 느껴 공부하고 있습니다.<br>
				  컴퓨터가 이해할 수 있는 코드보다, 사람이 보고 이해할수 있는 코드를 짜는 것에 중점을 두며 언제나 <br>
				  "사용자는 바보다" 라는 전제하에 UX 관점에서 제대로 된 서비스를 기획하고자 노력합니다.
				  한번 문제에 직면하면 해결할 때 까지 끝을보는성격, 원활한 커뮤니케이션으로 협업하며 저와 함께 개발해요!
				</p>
              </div>
              <%-- 자기소개 내용물 끝 --%>
            </div>
            
            <div id="hyunwoo_skill" class="skill mt-2">
              <h4 style="font-weight:bold">SKILL</h4>
              <div class="skill_content">
                <%-- 기술 나열 --%>
                <ul class="skill d-flex">
                  <%-- Java icon --%>
                  <li><img src="<%=ctxPath%>/images/about/java.png"/></li>
                  <%-- JS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/js.png"/></li>
                  <%-- HTML5 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/html5.png"/></li>
                  <%-- CSS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/css3.png"/></li>
                  <%-- Bootstrap4 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/bootstrap.png"/></li>
                  <%-- Jquery icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jquery.png"/></li>
                  <%-- JSP icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jsp-file.png"/></li>
                  <%-- Oracle icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/oracle.png"/></li>
                </ul>
              </div>
            </div>
            
            <div id="hyunwoo_contact_me" class="contact_me mt-2">
              <h4 style="font-weight:bold">CONTACT ME</h4>
              <div class="contact_me_content">
                <%-- 전화번호,블로그,인스타,깃주소 등 --%>
                <ul class="contact_me">
                  <li>
                    <span class="mr-2"><i class="fa-solid fa-phone fa-lg"></i></span>
                    <span>010-7423-9713</span>
                  </li>
                  <li>
                    <span class="mr-2"><i class="fa-brands fa-github fa-lg"></i></span>
                    <span>https://github.com/hyunwoocastle</span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            
          </div>
        </div>
        
        
        <div id="hyunwoo_project_review" class="project_review">
          <div class="project_review_header">
            <h1 class="project_review_title">Project Review</h1>
          </div>
          <%-- 프로젝트 후기 내용물 시작 --%>
          <div class="project_review_content mt-2">
            <p>
			팀원들과 첫 웹프로젝트를 진행하면서 여러가지 시행착오를 많이 겪었는데, 그중 첫번째로는<br>
			다들 처음으로 Github를 통해 협업을 진행하여서 충돌이 났을때 대처가 많이 미흡하여 해결하는데 시간이 많이 지체되었습니다.
			또한, 공부할때는 겪을 수 없었던 수많은 문제상황과 직면하였습니다. 예를들어 페이징처리를 먼저 한 뒤에, 상품목록을 가져오는 쿼리문을 작성하였는데
			페이징처리를 a태그에 직접 링크에 걸어 파라미터를 넘겨주는식으로 로직을 짜버리는바람에 다중필터조건을 걸 때 쿼리문을 전부 수정해야하는 등의 문제상황이 정말 많았습니다.
			</p>
			<p>
			이번 프로젝트는 여러가지 문제상황에 직면하고, 그 상황들을 해결하면서 "문제해결능력"이 많이 향상되었던 프로젝트 였습니다.
			처음에 목표했던 쿠폰기능이라던지, 채팅기능, 관리자용 대시보드 등등 구현하지 못한부분도 많지만 배운내용을 좀더 확실하게 다지고, 팀장으로서 팀원들과의 소통으로 커뮤니케이션능력의 향상까지
			이루어낸 값진 "경험"이였습니다. 팀원분들 다들 고생하셨습니다!
			</p>
          </div>
          <%-- 프로젝트 후기 내용물 끝 --%>
        </div>
      </div>
    </div>
    <%-------------------------------------- 최현우 section5 끝 ------------------------------------%>
    
    
    
    
    
    
    
    <%-------------------------------------- 장진영 section6 시작 ------------------------------------%>
    <div id="jinyoung" class="section">
      <div id="jinyoung_container" class="container d-flex flex-column">
        <div class="introduce d-flex">
          <div id="jinyoung_profile_image" class="profile_image">
            <div class="profile_image_box">
              <img src="<%=ctxPath%>/images/basic_profile_img.PNG"/>
            </div>
            <p class="text-center" style="font-size:18pt; font-weight:bold">Jin Young</p>
          </div>
          
          <div class="introduct_my_self ml-5">
            <div id="jinyoung_about_me" class="about_me">
              <h4 style="font-weight:bold">ABOUT ME</h4>
              <%-- 자기소개 내용물 시작 --%>
              <div class="about_me_content pl-4">
                1.자기소개 들어갈 공간임(4줄까지 허용)<br>2<br>3<br>4
              </div>
              <%-- 자기소개 내용물 끝 --%>
            </div>
            
            <div id="jinyoung_skill" class="skill mt-2">
              <h4 style="font-weight:bold">SKILL</h4>
              <div class="skill_content">
                <%-- 기술 나열 --%>
                <ul class="skill d-flex">
                  <%-- Java icon --%>
                  <li><img src="<%=ctxPath%>/images/about/java.png"/></li>
                  <%-- JS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/js.png"/></li>
                  <%-- HTML5 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/html5.png"/></li>
                  <%-- CSS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/css3.png"/></li>
                  <%-- Bootstrap4 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/bootstrap.png"/></li>
                  <%-- Jquery icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jquery.png"/></li>
                  <%-- JSP icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jsp-file.png"/></li>
                  <%-- Oracle icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/oracle.png"/></li>
                </ul>
              </div>
            </div>
            
            <div id="jinyoung_contact_me" class="contact_me mt-2">
              <h4 style="font-weight:bold">CONTACT ME</h4>
              <div class="contact_me_content">
                <%-- 전화번호,블로그,인스타,깃주소 등 --%>
                <ul class="contact_me">
                  <li>
                    <span class="mr-2"><i class="fa-solid fa-phone fa-lg"></i></span>
                    <span>010-7423-9713</span>
                  </li>
                  <li>
                    <span class="mr-2"><i class="fa-brands fa-github fa-lg"></i></span>
                    <span>https://github.com/hyunwoocastle</span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            
          </div>
        </div>
        
        
        <div id="jinyoung_project_review" class="project_review">
          <div class="project_review_header">
            <h1 class="project_review_title">Project Review</h1>
          </div>
          <%-- 프로젝트 후기 내용물 시작 --%>
          <div class="project_review_content mt-2">
            1.프로젝트 후기 적는곳(10줄까지 허용)<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
          </div>
          <%-- 프로젝트 후기 내용물 끝 --%>
        </div>
      </div>
    </div>
    <%-------------------------------------- 장진영 section6 끝 ------------------------------------%>
    
    
    
    
    
    
    
    
    
    <%-------------------------------------- 조상운 section7 시작 ------------------------------------%>
    <div id="josh" class="section">
      <div id="josh_container" class="container d-flex flex-column">
        <div class="introduce d-flex">
          <div id="josh_profile_image" class="profile_image">
            <div class="profile_image_box">
              <img src="<%=ctxPath%>/images/basic_profile_img.PNG"/>
            </div>
            <p class="text-center" style="font-size:18pt; font-weight:bold">Josh</p>
          </div>
          
          <div class="introduct_my_self ml-5">
            <div id="josh_about_me" class="about_me">
              <h4 style="font-weight:bold">ABOUT ME</h4>
              <%-- 자기소개 내용물 시작 --%>
              <div class="about_me_content pl-4">
                1.자기소개 들어갈 공간임(4줄까지 허용)<br>2<br>3<br>4
              </div>
              <%-- 자기소개 내용물 끝 --%>
            </div>
            
            <div id="josh_skill" class="skill mt-2">
              <h4 style="font-weight:bold">SKILL</h4>
              <div class="skill_content">
                <%-- 기술 나열 --%>
                <ul class="skill d-flex">
                  <%-- Java icon --%>
                  <li><img src="<%=ctxPath%>/images/about/java.png"/></li>
                  <%-- JS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/js.png"/></li>
                  <%-- HTML5 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/html5.png"/></li>
                  <%-- CSS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/css3.png"/></li>
                  <%-- Bootstrap4 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/bootstrap.png"/></li>
                  <%-- Jquery icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jquery.png"/></li>
                  <%-- JSP icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jsp-file.png"/></li>
                  <%-- Oracle icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/oracle.png"/></li>
                </ul>
              </div>
            </div>
            
            <div id="josh_contact_me" class="contact_me mt-2">
              <h4 style="font-weight:bold">CONTACT ME</h4>
              <div class="contact_me_content">
                <%-- 전화번호,블로그,인스타,깃주소 등 --%>
                <ul class="contact_me">
                  <li>
                    <span class="mr-2"><i class="fa-solid fa-phone fa-lg"></i></span>
                    <span>010-7423-9713</span>
                  </li>
                  <li>
                    <span class="mr-2"><i class="fa-brands fa-github fa-lg"></i></span>
                    <span>https://github.com/hyunwoocastle</span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            
          </div>
        </div>
        
        
        <div id="josh_project_review" class="project_review">
          <div class="project_review_header">
            <h1 class="project_review_title">Project Review</h1>
          </div>
          <%-- 프로젝트 후기 내용물 시작 --%>
          <div class="project_review_content">
            1.프로젝트 후기 적는곳(10줄까지 허용)<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11
          </div>
          <%-- 프로젝트 후기 내용물 끝 --%>
        </div>
      </div>
    </div>
    <%-------------------------------------- 조상운 section7 끝 ------------------------------------%>
    
    
    
    
    
    
    
    
    
    
    <%-------------------------------------- 황광빈 section8 시작 ------------------------------------%>
    <div id="hgb" class="section">
      <div id="hgb_container" class="container d-flex flex-column">
        <div class="introduce d-flex">
          <div id="hgb_profile_image" class="profile_image">
            <div class="profile_image_box">
              <img src="<%=ctxPath%>/images/basic_profile_img.PNG"/>
            </div>
            <p class="text-center" style="font-size:18pt; font-weight:bold">hgb</p>
          </div>
          
          <div class="introduct_my_self ml-5">
            <div id="hgb_about_me" class="about_me">
              <h4 style="font-weight:bold">ABOUT ME</h4>
              <%-- 자기소개 내용물 시작 --%>
              <div class="about_me_content pl-4">
                1.자기소개 들어갈 공간임(4줄까지 허용)<br>2<br>3<br>4
              </div>
              <%-- 자기소개 내용물 끝 --%>
            </div>
            
            <div id="hgb_skill" class="skill mt-2">
              <h4 style="font-weight:bold">SKILL</h4>
              <div class="skill_content">
                <%-- 기술 나열 --%>
                <ul class="skill d-flex">
                  <%-- Java icon --%>
                  <li><img src="<%=ctxPath%>/images/about/java.png"/></li>
                  <%-- JS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/js.png"/></li>
                  <%-- HTML5 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/html5.png"/></li>
                  <%-- CSS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/css3.png"/></li>
                  <%-- Bootstrap4 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/bootstrap.png"/></li>
                  <%-- Jquery icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jquery.png"/></li>
                  <%-- JSP icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jsp-file.png"/></li>
                  <%-- Oracle icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/oracle.png"/></li>
                </ul>
              </div>
            </div>
            
            <div id="hgb_contact_me" class="contact_me mt-2">
              <h4 style="font-weight:bold">CONTACT ME</h4>
              <div class="contact_me_content">
                <%-- 전화번호,블로그,인스타,깃주소 등 --%>
                <ul class="contact_me">
                  <li>
                    <span class="mr-2"><i class="fa-solid fa-phone fa-lg"></i></span>
                    <span>010-7423-9713</span>
                  </li>
                  <li>
                    <span class="mr-2"><i class="fa-brands fa-github fa-lg"></i></span>
                    <span>https://github.com/hyunwoocastle</span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            
          </div>
        </div>
        
        
        <div id="hgb_project_review" class="project_review">
          <div class="project_review_header">
            <h1 class="project_review_title">Project Review</h1>
          </div>
          <%-- 프로젝트 후기 내용물 시작 --%>
          <div class="project_review_content mt-2">
            1.프로젝트 후기 적는곳(10줄까지 허용)<br>2<br>3<br>4<br>5<br>6<br>7
          </div>
          <%-- 프로젝트 후기 내용물 끝 --%>
        </div>
      </div>
    </div>
    <%-------------------------------------- 황광빈 section8 끝 ------------------------------------%>
    
    
    
    
    
    
    
    
    
    
    <%-------------------------------------- 김진석 section9 시작 ------------------------------------%>
    <div id="kimjs" class="section">
      <div id="kimjs_container" class="container d-flex flex-column">
        <div class="introduce d-flex">
          <div id="kimjs_profile_image" class="profile_image">
            <div class="profile_image_box">
              <img src="<%=ctxPath%>/images/basic_profile_img.PNG"/>
            </div>
            <p class="text-center" style="font-size:18pt; font-weight:bold">kimjs</p>
          </div>
          
          <div class="introduct_my_self ml-5">
            <div id="kimjs_about_me" class="about_me">
              <h4 style="font-weight:bold">ABOUT ME</h4>
              <%-- 자기소개 내용물 시작 --%>
              <div class="about_me_content pl-4">
                1.자기소개 들어갈 공간임(4줄까지 허용)<br>2<br>3<br>4
              </div>
              <%-- 자기소개 내용물 끝 --%>
            </div>
            
            <div id="kimjs_skill" class="skill mt-2">
              <h4 style="font-weight:bold">SKILL</h4>
              <div class="skill_content">
                <%-- 기술 나열 --%>
                <ul class="skill d-flex">
                  <%-- Java icon --%>
                  <li><img src="<%=ctxPath%>/images/about/java.png"/></li>
                  <%-- JS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/js.png"/></li>
                  <%-- HTML5 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/html5.png"/></li>
                  <%-- CSS icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/css3.png"/></li>
                  <%-- Bootstrap4 icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/bootstrap.png"/></li>
                  <%-- Jquery icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jquery.png"/></li>
                  <%-- JSP icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/jsp-file.png"/></li>
                  <%-- Oracle icon --%>
                  <li class="ml-3"><img src="<%=ctxPath%>/images/about/oracle.png"/></li>
                </ul>
              </div>
            </div>
            
            <div id="kimjs_contact_me" class="contact_me mt-2">
              <h4 style="font-weight:bold">CONTACT ME</h4>
              <div class="contact_me_content">
                <%-- 전화번호,블로그,인스타,깃주소 등 --%>
                <ul class="contact_me">
                  <li>
                    <span class="mr-2"><i class="fa-solid fa-phone fa-lg"></i></span>
                    <span>010-7423-9713</span>
                  </li>
                  <li>
                    <span class="mr-2"><i class="fa-brands fa-github fa-lg"></i></span>
                    <span>https://github.com/hyunwoocastle</span>
                  </li>
                </ul>
              </div>
            </div>
            
            
            
          </div>
        </div>
        
        
        <div id="kimjs_project_review" class="project_review">
          <div class="project_review_header">
            <h1 class="project_review_title">Project Review</h1>
          </div>
          <%-- 프로젝트 후기 내용물 시작 --%>
          <div class="project_review_content mt-2">
            1.프로젝트 후기 적는곳(10줄까지 허용)<br>2<br>3<br>4<br>5<br>6<br>
          </div>
          <%-- 프로젝트 후기 내용물 끝 --%>
        </div>
      </div>
    </div>
    <%-------------------------------------- 김진석 section9 끝 ------------------------------------%>
    
    
    
    
    
    
    
    <%-- 끝 section10 시작--%>
    <div id="end_section" class="section">
      <h1 id="section_end" class="text-center" style="font-weight:bold">
        끝까지 봐주신 여러분 다들 사랑합니..
      </h1>
    </div>
    <%-- 끝 section10 끝 --%>
    
    
    
  </main>
</body>
</html>