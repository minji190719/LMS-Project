<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>한국대 로그인 2차</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/로고호랑이까만버전.png">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">

<!--********************************** Scripts ***********************************-->
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/settings.js"></script>

<!-- 폰트어썸 스크립트 -->
<script src="https://kit.fontawesome.com/1e1c7b1db0.js" crossorigin="anonymous"></script>

<!-- 배경 이미지 전환 외부 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.1.18/jquery.backstretch.min.js"></script>

<!-- login 내부 css 너무 많아져서 따로 파일로 뺐어요 -->
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">

</head>
<style>

 .backstretch::before {  
     position: absolute; 
     content: "";  
     top:0px;  
     left:0px;  
     width: 100%;
     height: 100%;  
     background-color: rgba(0,0,0,0.6);  
  }  
 
.second-Login-Card { 
/*   	background-color: pink !important;   */
/*  	color: #ffffff; */
  	opacity: 0.9;  
/*  	background : rgba(0,0,0,.4);  */
 } 
</style>
<body class="" style="height:965px;">

<script>
  $.backstretch([
     "${pageContext.request.contextPath }/resources/images/background_U1.jpg"
    , "${pageContext.request.contextPath }/resources/images/background_U3.jpg"
  ], {duration: 3000, fade: 1000});
</script> 
  
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader" style="display: none;">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->
	<div class="login-form-bg" style="height:100%">
		<div class="container h-100">
			<div class="row justify-content-center align-content-center h-100">
				<div class="col-xl-6">
					<div class="form-input-content">
						<div class="card login-form mb-0 pt-4 pb-4 second-Login-Card">
							<div class="card-body pt-4">
								<div class="card-title text-center mb-5">
									<h3 class="font-weight-bold pb-2">2차 본인인증</h3><hr class="text-white">
								</div>
								<div class="d-flex justify-content-center flex-wrap">
									
										<form method="post" id="secondform" action="/otp/second" class="d-flex">
<%-- 											<input type="text" id="hexKey" value="${hexKey }" readonly="readonly"><br />  --%>
											<span class="font-weight-bold" style="margin-top:6px; font-size:1.2em;" >인증 otp 입력 </span>
											<input  class="form-control-sm ml-2" type="text" id="otp" name="otp">
											<sec:csrfInput />
											<button type="submit" class="btn md-1 btn-dark ml-1">확인</button>
										</form>
								
	
									<img src="${url }"> <br> 
									<a href="/main/home">인증없이 메인으로 바로가기</a>
								

								</div>							

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>