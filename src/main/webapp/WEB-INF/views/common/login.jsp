<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>한국대학교 포털시스템 로그인</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/로고호랑이까만버전.png">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">

<!--********************************** Scripts ***********************************-->
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/settings.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/gleek.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/styleSwitcher.js"></script>

<!-- 폰트어썸 스크립트 -->
<script src="https://kit.fontawesome.com/1e1c7b1db0.js" crossorigin="anonymous"></script>

<!-- 배경 이미지 전환 외부 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.1.18/jquery.backstretch.min.js"></script>

<!-- 스크롤시 한 영역씩 넘어가게 하는 fullPage 외부 스크립트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fullPage/jquery.fullpage.css" />
<script src="${pageContext.request.contextPath }/resources/fullPage/jquery.fullpage.js"></script>

<!-- 글자 타이핑 효과 TypeIt 외부 스크립트 -->
<script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>

<!-- login 내부 css 너무 많아져서 따로 파일로 뺐어요 -->
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<!-- DataTable 따로넣을게요 -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/dashboard/dashboard-1.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</head>
<style>

.dataTables_length {
	display: none;
}

.noticeSection ul li{
/* 	list-style-type : disc; */
 	line-height : 200%;
}

/* table.dataTable tr.odd { */
/* 	background-color: white; */
/* } */

th {
	color:white;
	font-size: 15px;
}

td {
	color:white;
	font-size: 15px;
}
hr{
	background-color:white;
}

.not_title{
	width:350px;
 	overflow: hidden;
  	white-space: nowrap;
  	text-overflow: ellipsis;
 	word-break: break-all;
/* 	width:427px; */
/* 	white-space:nowrap;  */
/* 	overflow:hidden; */
/* 	text-overflow: ellipsis; */
}
/* .n_title{  */
/* 	width:400px; */
	 
/* 	 }  */
/* .n_title{ */
/* 	width:540px; */
/* } */

</style>
<body class="h-100">
<c:if test="${not empty userId }">
	<c:out value="${userId }"></c:out>
</c:if>

<!-- 배경이미지 전환 처리 -->
<script>
  $.backstretch([
     "${pageContext.request.contextPath }/resources/images/background_U2.jpg"
    , "${pageContext.request.contextPath }/resources/images/background_U4.jpg"
  ], {duration: 3000, fade: 1000});
</script>

	<!--******************* Preloader start ********************-->
<!-- 	<div id="preloader"> -->
<!-- 		<div class="loader"> -->
<!-- 			<svg class="circular" viewBox="25 25 50 50"> -->
<%--                 <circle class="path" cx="50" cy="50" r="20" fill="none"	stroke-width="3" stroke-miterlimit="10" /> --%>
<!--             </svg> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!--******************* Preloader end ********************-->

<div id="fullpage">
	<div class="section"> 
		<div class="login-form-bg h-100">
			<div class="container h-100">
				<div class="row justify-content-center h-100" id="login-content-center">
					<div class="col-xl-12">
						<div class="form-input-content">
						<h1 id="simpleUsage"></h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
		
		<div class="section" id="section2">
			<div class="login-form-bg h-100">
				<div class="container h-100">
					<div class="row justify-content-center h-100" id="login-content-center">
						<div class="col-xl-12">
							<div class="form-input-content" style="padding-top : 100px;">
								<!-- 로고 -->
								<div class="d-flex justify-content-center w-100 ml-5">
									<img alt="" src="${pageContext.request.contextPath }/resources/images/로고호랑이하얀버전.png" style="width:10%; margin-left: 200px;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class=" d-flex flex-wrap align-content-center" >
									<div class="flex-fill w-100" style="font-size : 4em; color:#ffffff; font-weight:bold;">한국대학교</div>
									<div class="flex-fill w-100" style="font-size : 1.5em; color:#ffffff; letter-spacing: 4px;" >&nbsp;Hankook University</div>
									</div>
								</div>
								<br><br>
								
								<div class="card login-form mb-0 p-2" id="login-card" style="height:69%">
								<div class="row h-100">
									<div class="card-body pt-5 col-6 border-right h-100" id="login-board"	>
											<div class="card-title pt-1 mb-5">
												<h2 style="color: white; text-align: center;">HKU NEWS</h2>
											</div>

											<div class="col-12 pt-4 pl-3">
												<section class="noticeSection w-80"></section>

											</div>
											<div class="d-flex justify-content-end mt-5">
												<p style="font-size: 0.5em;">※ 상세페이지를 이용하시려면 로그인을
													진행해주세요.</p>
											</div>
										</div>
									
									<div class="card-body pt-5 col-6">
										<div class="login-body-title">
											<h2 class="login-title">LOGIN</h2><br>
											<div class="d-flex justify-content-center">
												<p style="font-size: 1em;">
													※ 포털 서비스를 이용하시려면 로그인이 필요합니다.
													<br/>서비스 이용 후 반드시 로그아웃 하시기 바랍니다.
												</p>
											</div><br>
<!-- 											<ul class="checkedSM"> -->
<!-- 											<li><input type="checkbox" id="checkIdPM"> -->
<!-- 											<label for="checkIdPM"></label>  -->
<!-- 											<span class="id_font02">교직원로그인</span> -->
<!-- 											</li> -->
<!-- 											<li><input type="checkbox" id="checkIdS"> -->
<!-- 											<label for="checkIdS"></label>  -->
<!-- 											<span class="id_font02">학생로그인&nbsp;&nbsp;&nbsp;&nbsp;</span> -->
<!-- 											</li> -->
<!-- 											</ul> -->
											<!-- 자동로그인 버튼 만들어놓았어요. 타입은 버튼인데, submit으로 바꾸어도 되고 알아서 사용하세요.-->
												<div class="autoLoginBtnDiv d-flex justify-content-center">
													<button type="button" class="btn border-white autoLoginBtn" onclick="studentLogin()">학생 자동 로그인</button>&nbsp;
													<button type="button" class="btn border-white autoLoginBtn" onclick="professorLogin()">교수 자동 로그인</button>&nbsp;
													<button type="button" class="btn border-white autoLoginBtn" onclick="managerLogin()">관리자 자동 로그인</button>
												</div>
										</div>

										<form id="loginForm" class="mt-5 mb-5 login-input" action="/login" method="post">
											<div class="d-flex">
											<div class="flex-fill mr-2">
											<div class="form-group">
												<input type="text" class="form-control"	placeholder="학번/교직원번호" id="username" name="username" value="">
											</div>
											<div class="form-group">
												<input type="password" class="form-control" placeholder="비밀번호" id="password" name="password" value="">
											</div>
											</div>
											<sec:csrfInput/>
											<input type="submit" class="btn login-form__btn submit border-white" style="background-color:transparent;" value="로그인">
										</div>
										</form>
										
										<div class="mt-5 login-form__footer">
											<!--                                 <input type="checkbox" id="saveId"><label for="saveId"></label><span class="id_font">&nbsp;&nbsp;아이디저장</span> -->
											<!--                                 <a href="page-register.html" class="text-primary" id=>Sign Up</a> -->
											<ul id="IdPwOption">
												<li tabindex="0"><input type="checkbox" id="saveIdIpt">
													<label for="saveIdIpt"></label> <span class="id_font02">
														아이디 저장</span></li>
												<li>
													<span>
														<!-- 아이디 찾기  ///////아이디랑 비밀번호 찾기 신편입생 학번 조회는 일단 임시 모달창으로-->
														<a data-toggle="modal" href="#idModal"> <i class="fa-solid fa-angle-right"></i> 아이디찾기</a>
													</span> 
													<span> <!-- 비밀번호 찾기 --> 
														<a data-toggle="modal" href="#pwModal"> <i class="fa-solid fa-angle-right"></i> 비밀번호 찾기</a>
													</span>
												</li>
											</ul>
											<ul id="findNo">
												<li>
													<span> <a data-toggle="modal" href="#newIdModal"> <i class="fa-solid fa-angle-right"></i> 신/편입생 학번조회</a>
													</span>
												</li>
											</ul>
										</div>
									</div>
									
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		

</div>

<!-- 임시 모달 -->
<div class="modal fade" id="idModal">
   <div class="modal-dialog modal-dialog-centered" role="document">
     	<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">아이디 찾기</h5>
				<button type="button" class="close" data-dismiss="modal"><span>&times;</span>
				</button>
		 	</div>
		 	<div class="modal-body">
				<form>
            		<div class="form-group">
                    	<label for="recipient-name" class="col-form-label">본인인증</label>
                    	<input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">본인인증</label>
                        <input type="text" class="form-control" id="message-text">
                    </div>
                </form>
		 	</div>
	 		<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">아이디 찾기</button>
			</div>
		</div>
	</div>
</div>

<script>
let table;

 $(function(){
     $("#fullpage").fullpage({
        //options here
        autoScrolling: true,
        scrollHorizontally: true,
//         scrollBar:true
      });
     
     
//      if(localStorage.getItem("popUp") != "yes"){
//     	 localStorage.setItem("popUp", "yes");	 
//      }
     
//      if(localStorage.getItem("popSur") != "yes"){
//     	 localStorage.setItem("popSur", "yes");	 
//      }
     
     
 })
 
 
 document.addEventListener('DOMContentLoaded', function(){
		 new TypeIt("#simpleUsage", {
			  speed: 50,
			  waitUntilVisible: true,
			  loop:true,
			  lifeLike: true,
			  deleteSpeed : 50
		})
		.type("HankookUniversity.", { delay: 100 })
		.pause(1000)
		.delete()
		.pause(1000)
		.type("한국대학교.", { delay: 2000 })
		.go();
		 
 });
 function requestList() {

		$.ajax({	
					url : "/notice/noticefive",
					type : "get",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						console.log(data);
						data.forEach(function(obj, idx) {
						html += "<ul>"
						html += "<li class='w-100'><div class='d-flex justify-content-between'><span class='not_title'>"+obj.notice_title + "</span><span>"+ obj.notice_date+"</span></div></li>"
						html += "</ul>"
				});
					$(".noticeSection").html(html);
			}
		});

	}
// 	function responseNotice(xhr, msg) {

// 		console.log(xhr);
// 		if (typeof xhr != 'undefined' || xhr != null) {
// 			console.log(Object.values(xhr.list[0].notice_no));
// 			console.log(Object.values(xhr.list[0].notice_title));
// 			for (var i = 0; i < xhr.list.length; i++) {
// 				html += "<li>" + xhr.list[i].notice_no + "</li>";
// 				html += "<li>" + xhr.list[i].notice_title + "</li>";
// 				html += "<li>" + xhr.list[i].mmem_no + "</li>";
// 				html += "<li>" + xhr.list[i].notice_date + "</li>";
// 				html += "<li>" + xhr.list[i].notice_count + "</li>";
// 			}
// 			document.getElementById('.noticeSection').innerHTML = html;
// 		} else {
// 			console.log("continue");
// 		}
// 	}
window.onload = function() {
	requestList();
}
	
	
	
	function studentLogin(){
		var username = $("#username");
		var password = $("#password");
		var loginForm = $("#loginForm");
		
		username.val("20200001");
		password.val("1111");
	
		loginForm.submit();
	}
	
	function professorLogin(){
		var username = $("#username");
		var password = $("#password");
		var loginForm = $("#loginForm");
		
		username.val("201101");
		password.val("1111");
	
		loginForm.submit();
	}
	

	function managerLogin(){
		var username = $("#username");
		var password = $("#password");
		var loginForm = $("#loginForm");
		
		username.val("20170003");
		password.val("1111");
	
		loginForm.submit();
	}
	
</script>

</body>
</html>

