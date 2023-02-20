<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.quickItemTop{
	-moz-border-radius : 37px 37px 0 0;
	-webkit-border-radius: 37px 37px 0 0;
	border-radius: 37px 37px 0 0;
}

.quickItemDown{
	-moz-border-radius : 0 0 37px 37px;
	-webkit-border-radius: 0 0 37px 37px;
	border-radius: 0 0 37px 37px;	
}

.moveTop{
	margin: 0;
	display: block; 
	position: fixed; 
	bottom: 10px;
	right: 0px;
	z-index: 99999; 
	outline: none; 
	color: rgba(0,0,0,0.7); 
	cursor: pointer; 
	padding: 15px 20px; 
}

.moveTop button{
	border-radius: 100%;
}

.sidebarContainer{
	height:auto;
	position:fixed;
	top:300px;
	left:94%;
	z-index:99999;
}


<% 
	String userId = (String)request.getSession().getAttribute("userId");
	int userIdLength = userId.length();
%>

<% if(userId.equals("20170003")){ // 관리자인 경우%>

				.custom-sidebar{
					top: 300px;
					height: 380px;
					position: sticky !important;
					background-color: var(--custom-m);
					border: 4px solid var(--custom-m);
					opacity: 0.8;
					border-radius: 0.5rem;
					width: 105px;
					overflow: hidden;
				}
				
				.custom-sidebar div:first-child {
					text-align: center; background-color:var(--custom-m); color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar div:not(:first-child) {
					text-align: center; color: var(--custom-m); background-color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar i{
					color: var(--custom-m);
				}

  	<% }else if(userIdLength == 8){ // 학생인 경우%>       	
				.custom-sidebar{
					top: 300px;
					height: 380px;
					position: sticky !important;
					background-color: var(--custom-s);
					border: 4px solid var(--custom-s);
					opacity: 0.8;
					border-radius: 0.5rem;
					width: 105px;
					overflow: hidden;
				}
				
				.custom-sidebar div:first-child {
					text-align: center; background-color:var(--custom-s); color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar div:not(:first-child) {
					text-align: center; color: var(--custom-s); background-color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar i{
					color: var(--custom-s);
				}
    
    <% }else if(userIdLength == 6){ // 교수인 경우%>       	
				.custom-sidebar{
					top: 300px;
					height: 380px;
					position: sticky !important;
					background-color: var(--custom-p);
					border: 4px solid var(--custom-p);
					opacity: 0.8;
					border-radius: 0.5rem;
					width: 105px;
					overflow: hidden;
				}
				
				.custom-sidebar div:first-child {
					text-align: center; background-color:var(--custom-p); color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar div:not(:first-child) {
					text-align: center; color: var(--custom-p); background-color: white; width: 100%; padding: 10px;
				}
				
				.custom-sidebar i{
					color: var(--custom-p);
				}
	
<% } %>	
</style>

<div class="quickmenu sidebarContainer">
	<div class="custom-sidebar btn-group-vertical">
		<div>
			Q U I C K<br/>M E N U
		</div>
		<div>
			<a href="/mypage/List">
				<i class="fa-solid fa-circle-info"></i><br/>
				마이페이지
			</a>
		</div>
		<div>
			<a href="/seat/seatReserve">
				<i class="fa-sharp fa-solid fa-building-columns"></i><br/>
				열람실
			</a>
		</div>
		<div>
			<a href="/student/bookList">
				<i class="fa-solid fa-book"></i><br/>
				도서관
			</a>
		</div>
		<div>
			<a href="/student/certificate">
				<i class="fa-solid fa-circle-info"></i><br/>
				증명서발급
			</a>
		</div>
		<div>
			<a href="/notice/main">
				<i class="fa-sharp fa-solid fa-flag menu-icon"></i><br/>
				공지사항
			</a>
		</div>


		<a href="#" class="moveTop"><button class="btn btn-flat btn btn-light" type="button">TOP</button></a>
	</div>
</div>
<script type="text/javascript">

</script>