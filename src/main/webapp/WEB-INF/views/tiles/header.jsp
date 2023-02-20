<%-- <%@page import="java.util.Date"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.brand-logo, .brand-logo a, .brand-logo a b {
	padding : 0px 0px 0px 0px !important; 
	margin : 0px 0px 0px 0px !important; 
}

.mjLogoImg{
	max-width : 4em !important;
	margin-top : 20px !important;
	margin-left : 0px !important;
}

.mjHeaderLogoImg{
	margin-top :  9px !important;
	margin-left : 12px !important;
	width : 200px !important;
}

.mjMainSearch{
	min-height : 30px !important;
	max-height : 30px !important;
}

#alarmBox{
	max-height:300px;
	overflow:auto;
}

</style>

<div class="nav-header">
	<div class="brand-logo">
		<a href="/main/home"> 
			<b class="logo-abbr">
				<img class="mjLogoImg" src="${pageContext.request.contextPath }/resources/images/HU로고긴버전.png" alt="">
			</b> 
			<span class="logo-compact">
				<img src="${pageContext.request.contextPath }/resources/bootstrap/images/logo-compact.png" alt="">
			</span>
			<span class="brand-title"> 
				<img class="mjHeaderLogoImg" src="${pageContext.request.contextPath }/resources/images/사이드바헤더로고나눔고딕.png" alt="">
			</span>
		</a>
	</div>
</div>
<div class="header">
	<div class="header-content clearfix">

		<div class="nav-control">
			<div class="hamburger">
				<span class="toggle-icon"><i class="icon-menu"></i></span>
			</div>
		</div>
		<div class="header-left">
			<div class="input-group icons">
				<input type="search" class="form-control mjMainSearch mr-3"
					placeholder="Search Dashboard" aria-label="Search Dashboard" id="inputDot" >
				<div class="input-group-prepend" style="padding-top: 7px;">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/mic커스텀2.png" width="28px" height="30px" onclick="btnSttStart()" style="cursor: pointer;">
				</div>
				<div class="input-group-prepend">
					<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
						id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
				</div>
				<div class="drop-down animated flipInX d-md-none">
					<form action="#">
						<input type="text" class="form-control" placeholder="Search">
					</form>
				</div>
			</div>
		</div>
		<div class="header-right d-flex">
			<div class="mr-3 mt-3" id="eh_timer" style="padding-right: 15px;"> 
				
			</div>
			<div class="mr-3 mt-3"> 
				<p>|</p>
			</div>
			
			<div class="mr-3 mt-3"> 
				<span style="padding-left: 15px; cursor: pointer;" onclick="saveMyPortlet()">현재 화면 설정 저장</span>
			</div>
			<ul class="clearfix">
				<li class="icons dropdown"><a href="javascript:void(0)"
					data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i> <span
						class="badge badge-pill gradient-2 alramCount">0</span>
				</a>
					<div
						class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
						<div
							class="dropdown-content-heading d-flex justify-content-between">
							<span class="empty" id="alramEmpty">알람이 없습니다.</span> 
							<span class="badge badge-danger col-3" style="cursor:pointer;" id="allDelBtn">모두 읽기</span>
						</div>
						<div class="dropdown-content-body" id="alarmBox">
							<ul id="alramBox">
							</ul>
						</div>
					</div></li>
				
				<li class="icons dropdown">
					<div class="user-img c-pointer position-relative"
						data-toggle="dropdown">
						<span class="activity active"></span>
						<img src="${pageContext.request.contextPath }/resources/images/관리자.png" height="40" width="40" alt="" id="headerImage">
					</div>
					<div
						class="drop-down dropdown-profile animated fadeIn dropdown-menu">
						<div class="dropdown-content-body">
							<ul>
								<li><a href="/mypage/List"><i class="icon-user"></i>
										<span>마이페이지</span></a></li>
								<li><a href="javascript:void()"> <i class="icon-envelope-open"></i> <span>Inbox</span>
										<div class="badge gradient-3 badge-pill gradient-1">3</div>
								</a></li>

								<hr class="my-2">
								<li>
									<form action="/logout" method="post" name="logoutForm">
										<a href="javascript:void(0)" onclick="logoutBtn()"><i class="icon-key"></i> <span>로그아웃</span></a>
									</form>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js'></script>
<script>



var time = 3599; 
var min = ""; 
var sec = ""; 
var eh_timer = document.getElementById("eh_timer");


let allDelBtn = document.querySelector("#allDelBtn");
allDelBtn.onclick = function(){
	showAlram({id:null});
	alramEmpty.innerText = "알람이 없습니다.";
	alramBox.innerHTML = '';
	let alramCount = document.querySelector(".alramCount");
	alramCount.innerText = 0;
	
}

var x = setInterval(function() {

	min = parseInt(time/60); 
	sec = time%60; 

	eh_timer.innerHTML = min + "분 " + sec + "초 후 자동로그아웃";
<%-- 	eh_timer.innerHTML = "세션 시간 알아보기 > "+ <%= new Date(session.getCreationTime()) %>  --%>
<%-- 	eh_timer.innerHTML = "세션 시간 알아보기 > "+ <%= new Date(session.getLastAccessedTime()) %>  --%>
<%-- 	eh_timer.innerHTML = "세션 시간 알아보기 > "+ <%= session.getMaxInactiveInterval() %>  --%>
	time--;

	//이럴 일은 없겠지만 로그아웃되게 해야하나?
// 	if (time =< 0) {
// 		clearInterval(x); 
// 		document.getElementById("eh_timer").innerHTML = "시간초과";
// 	}
}, 1000);


function logoutBtn(){
	logoutForm.submit();
}

function searchForPage(keyword){
	
	if(keyword.indexOf('교내봉사') != -1 || keyword.indexOf('교내 봉사') != -1 ){
		location.href = "/volunteer/showList";
	}else if(keyword.indexOf('교외봉사') != -1  || keyword.indexOf('교외 봉사') != -1 ){
		location.href = "/volunteer/outList";
	}else if(keyword.indexOf('상담신청') != -1 || keyword.indexOf('상담 신청') != -1 ){
		location.href = "/student/counselApply.do";
	}else if(keyword.indexOf('성적') != -1 || keyword.indexOf('성적 조회') != -1 ){
		location.href = "/student/myLecGrade";
	}else if(keyword.indexOf('시간표') != -1 || keyword.indexOf('시간') != -1 ){
		location.href = "/schedule/sHome";
	}else if(keyword.indexOf('취업교육') != -1 || keyword.indexOf('취업 교육') != -1 ){
		location.href = "/employEducation/employEducationPage";
	}else if(keyword.indexOf('취업') != -1 || keyword.indexOf('취업 훈련') != -1 ){
		location.href = "/employ/company";
	}else if(keyword.indexOf('로그아웃') != -1 || keyword.indexOf('로그 아웃') != -1 ){
		logoutForm.submit();
	}else{
		
// 		alert("입력된 검색어에 해당된 페이지가 존재하지 않습니다!");
		
		swal({
			   title: "조회 불가",
			   text: "입력된 검색어에 해당된 페이지가 존재하지 않습니다!",
			   icon: "warning",
	           buttons:{
	              select:"확인"
	           }
	        }).then((value) => {							        	
	    		location.href = "/main/home";
	        })
		

	}
}



function btnSttStart(){
	document.getElementById('inputDot').value = "입력받는 중...";

	annyang.setLanguage('ko');
    annyang.start({ autoRestart: false, continuous: true})
    
	var recognition = annyang.getSpeechRecognizer();
	var final_transcript = '';
	recognition.interimResults = true;
	
	
	recognition.onresult = function(event) {
	
		var interim_transcript = '';
		final_transcript = '';
		for (var i = event.resultIndex; i < event.results.length; ++i) {
			
			console.log("event.resultIndex",event.resultIndex);
			console.log("event.results.length",event.results.length);
			
			if (event.results[i].isFinal) {
				final_transcript += event.results[i][0].transcript;
				console.log("final_transcript="+final_transcript);
				//annyang.trigger(final_transcript); //If the sentence is "final" for the Web Speech API, we can try to trigger the sentence
			} else {
				interim_transcript += event.results[i][0].transcript;
				console.log("interim_transcript="+interim_transcript);
			}
		}
// 		document.getElementById('result').innerHTML =  '중간값:='+interim_transcript+'<br/>결과값='+final_transcript;
		document.getElementById('inputDot').value = final_transcript;
		console.log('interim='+interim_transcript+'|final='+final_transcript);
		
		
		setTimeout(function() {
			searchForPage(final_transcript);
			}, 1500);
	};
}

// 현재 포틀릿 설정 저장
function saveMyPortlet(){
	
    delete serializedFull;
    serializedData = grid.save();
    let gridData = JSON.stringify(serializedData, null, '  ');
    gridData = JSON.parse(gridData);
	
    console.log(gridData);
    
	let number = "";

	for(let i = 0; i < gridData.length; i++){
    	let content = gridData[i].content;
		<%
			String userId = (String)request.getSession().getAttribute("userId");
			int userIdLength = userId.length(); 
		%>
		<% if(userId.equals("20170003") || userIdLength==6){ // 관리자/교수인 경우 %> databaseData = "${admin.portlet }";
		
	    	if(content.includes('일정')){ number += "0";}
	    	else if(content.includes('오늘의 식단')){ number += "1";}
	    	else if(content.includes('오늘의 날씨')){ number += "2";}
	    	else if(content.includes('나의 도서관')){ number += "3";}
	    	else if(content.includes('차트')){ number += "4";}
	    	
		<% }else if(userIdLength == 8){ // 학생인 경우 %> databaseData = "${student.portlet }";
	    	if(content.includes('일정')){ number += "0";}
	    	else if(content.includes('나의 시간표')){ number += "1";}
	    	else if(content.includes('오늘의 식단')){ number += "2";}
	    	else if(content.includes('이수 정보')){ number += "3";}
	    	else if(content.includes('커뮤니티')){ number += "4";}
	    	else if(content.includes('오늘의 날씨')){ number += "5";}
	    	else if(content.includes('나의 도서관')){ number += "6";}
	    	else if(content.includes('나의 역량')){ number += "7";}
		<%}%>   
    }
	
	
	/*// 그리드스택 내에서 변경된 사항은 제대로 잡히지가 않음.
	let parent = document.querySelector(".grid-stack");
 	let stackItem = document.querySelectorAll(".grid-stack-item");
    
	for(let i = 0; i < stackItem.length; i++){
		let stack = stackItem[i];
	    let stackNumber = stackItem[i].className;
	    const regex = /[^0-9]/g;
	  	stackNumber = stackNumber.replaceAll(regex, "");
        number += stackNumber;
 	}
	*/
	console.log(number);
 	
    let savePortlet = {
    		"savePortlet" : number
    };
    console.log(savePortlet);
    
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/mainPagePortlet/update", true);
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("성공적으로 업데이트 되었습니다.");

			toastr.options = {
					  "closeButton": false,
					  "debug": false,
					  "newestOnTop": false,
					  "progressBar": true,
					  "positionClass": "toast-top-center",
					  "preventDuplicates": false,
					  "onclick": null,
					  "showDuration": "100",
					  "hideDuration": "1000",
					  "timeOut": "1000",
					  "extendedTimeOut": "1000",
					  "showEasing": "swing",
					  "hideEasing": "linear",
					  "showMethod": "fadeIn",
					  "hideMethod": "fadeOut"
			};
			
			toastr.success('화면 설정이 저장되었습니다.');
		}
	}
	xhr.send(JSON.stringify(savePortlet));
}


</script>