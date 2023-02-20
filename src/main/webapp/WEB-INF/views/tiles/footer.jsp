<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
<%  String userId = (String)request.getSession().getAttribute("userId");
	int userIdLength = userId.length(); %>

<% if(userId.equals("20170003")){ // 관리자인 경우%>
	.footer{ background-color: var(--custom-m); padding-left: 0; opacity:0.8;}
	
<% }else if(userIdLength == 8){ // 학생인 경우%>  
	.footer{ background-color: var(--custom-s); padding-left: 0; opacity:0.8;}
 
<% }else if(userIdLength == 6){ // 교수인 경우%>  
	.footer{ background-color: var(--custom-p); padding-left: 0; opacity:0.8;}
<% } %>	 
.footer>.footer-menubar{
	display: flex;
	justify-content: space-around;
	padding : 30px 0;
}

.footer>.footer-menubar>div li{
	color : #ffffff;
}

.footer-icons{
	display: flex;
	justify-content: center;
}

.footer-icons span{
	margin: 10px;
}

.footer-icons span i{
	color : #ffffff;
	cursor: pointer;
}

</style>
<div class="footer">
	<div class="footer-menubar">
		<div>
			<div>
				<img src="/resources/images/한국대학교_로고2.png" width="100px;" height="100px;">
			</div>
			<div>
				<ul>
					<li>대전광역시 중구 계룡로 846, 3-4층</li>
					<li>Copyright (C) 2016 HANKOOK UNIVERSITY All Rights Reserved.</li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="footer-icons">
			<span><i class="fa-brands fa-instagram fa-2x"></i></span>
			<span><i class="fa-brands fa-youtube fa-2x"></i></span>
			<span><i class="fa-brands fa-facebook fa-2x"></i></span>
		</div>
	</div>
</div>