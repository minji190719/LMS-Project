<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<!-- Ajax CSRF 404error발생 방지 위한 토큰 추가 -->
    <meta name="_csrf" content="${_csrf.token}">
   	<meta name="_csrf_header" content="${_csrf.headerName}">
    <title>한국대학교</title>
    <!-- toastr -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/css/toastr.min.css">
    <!-- 파비콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/로고호랑이까만버전.png">
    <!-- 피그노즈캘린더 -->
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- 차트 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist/css/chartist.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <!-- 커스텀 스타일시트 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
    <!-- 데이터 테이블 css -->
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
	<!-- 데이트피커 -->
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap4-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker/css/asColorPicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- 아이콘 && 폰트 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 개인CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customcss.css">
    <!-- 풀캘린더 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/schedule.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/fullcalendar/css/main.css">
    <!-- 슬릭 슬라이더 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<!-- gridstack -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/gridstack/gridstack.min.css"/>
	 <!-- 썸머노트 -->
	<link href="${pageContext.request.contextPath }/resources/css/summernote-lite.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/normalize.css" rel="stylesheet">
    <!-- jquery, summernote -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/summernote-lite.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js" ></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style>
		<% 
			String userId = (String)request.getSession().getAttribute("userId");
			int userIdLength = userId.length();
		%>
		
		<% if(userId.equals("20170003")){ // 관리자인 경우%>
    	.swal-button--confirm, .swal-button--select{
			color : #ffffff;
			background : var(--custom-m);
		}
		 body::-webkit-scrollbar-thumb {
		   background-color: var(--custom-m);
		 }
		
    	<% }else if(userIdLength == 8){ // 학생인 경우%>       	
    	.swal-button--confirm, .swal-button--select{
			color : #ffffff;
			background : var(--custom-s);
		}
		
		body::-webkit-scrollbar-thumb {
		   background-color: var(--custom-s);
		 }
       	<% }else if(userIdLength == 6){ // 교수인 경우%>       	
    	.swal-button--confirm, .swal-button--select{
			color : #ffffff;
			background : var(--custom-p);
		}       
		
		body::-webkit-scrollbar-thumb {
		   background-color: var(--custom-p);
		 }	
    	<% } %>	
    	

    	
	</style>
</head>
<body>

	<tiles:insertAttribute name="preloader"/>
    <div id="main-wrapper" class="show menu-toggle">
      
      <tiles:insertAttribute name="header"/>
      <tiles:insertAttribute name="sidebar"/>
      
      <div class="content-body" style="display: flex; flex-direction: row; flex-flow: nowrap; margin-bottom: 100px;">
         <div class="container-fluid pr-5" style="margin-right: 85px; margin-left: 10px;">
            <tiles:insertAttribute name="content"/>
         </div>
            <tiles:insertAttribute name="quickSidebar"/>
      </div>

		<!-- 로딩 애니메이션 시작 -->
<!-- 		<div class="loader-container" style="display: none;"> -->
<%-- 			<canvas id="canvas" width="300" height="300" --%>
<%-- 				style="background: none;"></canvas> --%>
<!-- 		</div> -->
		<!-- 로딩 애니메이션 종료 -->

		<tiles:insertAttribute name="footer"/>
      
    </div>
    <!-- 새로운  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
    <!-- 풀캘린더 -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/fullcalendar/js/main.js"></script>
	<!-- 슬릭 슬라이더 -->
	<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/Ajax.js"></script>
	<!-- 폰트어썸 -->
	<script src="https://kit.fontawesome.com/957fb022c5.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/settings.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/moment/moment.js"></script>
    <!-- 8개의 차트 유형을 지원하는 Chartjs -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- 원형 차트를 그리는 Circle progress -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- 데이터맵 -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/d3v3/index.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/topojson/topojson.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- 모리스 차트 Morrisjs -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/morris/morris.min.js"></script>
    <!-- 피그노즈 캘린더 js -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- 차트 ChartistJS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist/js/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	<!-- 데이터 테이블 js -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/js/dashboard/dashboard-1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
	<!-- 데이트피커 -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap4-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/js/plugins-init/form-pickers-init.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/clockpicker/dist/jquery-clockpicker.min.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker/js/jquery-asColorPicker.min.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/js/plugins-init/bs-daterange-picker-init.js" ></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/js/plugins-init/bs-date-picker-init.js" ></script>
	<!-- aggrid -->
    <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/js/toastr.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/js/toastr.init.js"></script>
	<!-- gridstack -->
	<script src="${pageContext.request.contextPath }/resources/plugins/gridstack/gridstack-all.js"></script>
	
	
<script>
// 헤더 색상 세팅
(function($) {
    "use strict"
    
    if(location.pathname != '/mypage/List'){
		 if("" == ${state}){
// 	         alert("신규 학생입니다. 개인정보 등록 후 사용이 가능합니다.")
// 	         location.href="/mypage/List";
	         swal("신규 학생입니다. 개인정보 등록 후 사용이 가능합니다.",{
	             buttons:{
	                select:"확인"
	             },
	             closeOnClickOutside:false

	          }).then((value)=>{
	             
	             switch(value){
	             case "select":
	            	location.href="/mypage/List";
	                break;
	             default:
	                break;
	             }
	          })
	      }
    }
    
    new quixSettings({
        version: "light", //2 options "light" and "dark"
        layout: "vertical", //2 options, "vertical" and "horizontal"

        <%
    	if(userId.equals("20170003")){ // 관리자인 경우	
	    %>
	        navheaderBg: "color_3", //8
	        headerBg: "color_3", //8
		<%	
	    	}else if(userIdLength == 8){ // 학생인 경우
	    %>
	    	
		    navheaderBg: "color_2", //9
	        headerBg: "color_2", //9
	    <%		
	    	}else if(userIdLength == 6){ // 교수인 경우
	    %>
		    navheaderBg: "color_4", //10
	        headerBg: "color_4", //10
	    <%		
	    	}
	    %>        

        sidebarStyle: "vertical", //defines how sidebar should look like, options are: "full", "compact", "mini" and "overlay". If layout is "horizontal", sidebarStyle won't take "overlay" argument anymore, this will turn into "full" automatically!
        sidebarBg: "color_1", //have 10 options, "color_1" to "color_10"
        sidebarPosition: "static", //have two options, "static" and "fixed"
        headerPosition: "static", //have two options, "static" and "fixed"
        containerLayout: "wide",  //"boxed" and  "wide". If layout "vertical" and containerLayout "boxed", sidebarStyle will automatically turn into "overlay".
        direction: "ltr" //"ltr" = Left to Right; "rtl" = Right to Left
    });
    
    $('.loader-container').display = "";  
    
    $('.loader-container').fadeIn('slow', function() {
   // 애니메이션 끝난 뒤 실행할 코드 넣기
    });    
   

})(jQuery);


// window.addEventListener("click", function(e){
// 	var div = document.createElement("div");
// 	div.setAttribute("class","click-wave")
// 	div.style.top = e.pageY+ "px";
// 	div.style.left = e.pageX + "px";
// 	body.append(div);
	
// 	setTimeout(function(){
// 		div.remove();
// 	},350)
// })

// 웹 소켓
// var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/main";
var wsUri = "wss://${pageContext.request.serverName}${pageContext.request.contextPath}/websocket/main";
console.log("URl : ", `${pageContext.request.serverName}${pageContext.request.contextPath}`);
//웹 소켓
// 소켓 객체 생성
var websocketMain = new WebSocket(wsUri);

console.log("mainOn")
// window.onload = function(){
connect();
// }


window.onbeforeunload = function(){
	onClose();
}

function connect(){
	websocketMain.onopen = onOpen;
	websocketMain.onmessage = onMessage;
	websocketMain.onclose = onClose;
}

function onOpen(){
	let jsonObject = {
         state : "0",
         userId : "${userId}",
         msg : "hihi"
	}
	
	websocketMain.send(JSON.stringify(jsonObject));
}
function sendMessage(content){
	console.log(content)
	websocketMain.send(content);
}


// toastr.success('<h6 class="notification-heading">한상훈님이  친구요청하셨습니다.</h6>', '친구요청');
const alramBox = document.querySelector("#alramBox");
const alramCount = document.querySelectorAll(".alramCount");
const alramEmpty = document.querySelector("#alramEmpty");


toastr.options.timeOut = 3000;
toastr.options.progressBar = true;
function onMessage(msg){
	let data = msg.data;
	let jsonData = JSON.parse(data);

	console.log(jsonData)
	
	if(jsonData.state == "0"){
		console.log(jsonData.userId+"님이 입장하셨습니다.")
		return;
	}
	
	if(jsonData.state == "1"){
		
		// 친구요청
		if(jsonData.purpose=="0"){
			
			let text = createRequest(jsonData);
			alramBox.innerHTML += text;
		}
		
		// 화상회의 URL전송
		if(jsonData.purpose=="1"){
		   toastr.success("ZOOM 비대면 상담 링크가 도착했습니다 !");
		   let text = "<a href='" +jsonData.msg+ "'>ZOOM 비대면 상담 링크 바로가기</a>";
		   
		   alramBox.innerHTML += text;
		   
		}
		
		// 댓글 알람용
		if(jsonData.purpose=="2"){
			
			toastr.success("게시글에 댓글이 달렸습니다.");
			
			let text= alramBoxCreate(jsonData);
			alramBox.innerHTML += text;
			fn_alramCount(1);
			if(alramEmpty.classList.contains("empty")){
				alramEmpty.classList.toggle("empty");
				alramEmpty.innerHTML = "<span id='alramNumber'>1</span>개의 새로운 알람"
			}else{
				document.querySelector("#alramNumber").innerText = document.querySelector("#alramNumber").innerText*(1)+1;
			}
		}
				
	}
	
	if(jsonData.state == "2"){
		console.log(jsonData.userId+"님이 퇴장하셨습니다..")
		return;
	}
}



function alramBoxCreate(data){
	text='';
	text+='<li id="'+data.alarmNo+'" onclick="showAlram(this)"><a href="'+data.url+'"> <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>';
	text+='<div class="notification-content">';
	text+='<h6 class="notification-heading">'+data.sender+'님이 '+data.content+'.</h6>';
	text+='<span class="notification-text">앞으로 5일 이내에</span>';
	text+='</div>';
	text+='</a></li>';
	
	return text;
}

function fn_alramCount(data){
	if(data == 1){
		alramCount.forEach((value,i)=>{
			value.innerText = value.innerText*(1) + 1;
		})
	}else{
		alramCount.forEach((value,i)=>{
			value.innerText = value.innerText*(1) - 1;
		})
	}
	
}

function showAlram(data){
	
	let xhr = new XMLHttpRequest();
	xhr.open("get",'/alarm/delete/'+data.id, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			if(data.id == null){
				alert(123)
			}
			
			
			if(data.parentElement.children.length == 1){
				data.parentElement.innerText = "알람이 없습니다.";
				alramEmpty.classList.toggle("empty");
				alramEmpty.innerText = "알람이 없습니다.";
			}
			data.remove();
			fn_alramCount(0);
		}
	}
	xhr.send();
	

}

function onClose(){
	let jsonObject = {
			state:"2",
	         userId:"${userId}",
	         msg : "byebye"
	}
	
	websocketMain.send(JSON.stringify(jsonObject));
}

function createRequest(jsonData){
	// 알림띄우기
	toastr.success('<h6 class="notification-heading">'+jsonData.sender+'님이  친구요청하셨습니다.</h6>', '친구요청');
	
	// 카운트 올리기
	fn_alramCount(1);
	
	let tmpJson = jsonData;
	jsonData.SMEM_NO = tmpJson.sender;
	delete jsonData.sender;
	let jsonArray = [];
	jsonArray.push(jsonData);

	if(selectListBox.value=="request"){
		text = createFriendRequest(jsonArray);
		if(friendWait.innerHTML == "친구요청 목록이 없습니다."){
			friendWait.innerHTML = text;
		}else{
			friendWait.innerHTML += text;
		}
	}
	
	// div박스 만들기
	text = '<li><a href="javascript:void()"><span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>';
	text+= '<div class="notification-content">';
	text+= '<h6 class="notification-heading">'+jsonData.SMEM_NO+'님이  친구요청하셨습니다.</h6>';
	text+= '</div>';
	text+= '</a></li>';
	
	return text;
}

alarmSetting();

function alarmSetting(){
	//아작스 통신을 위한 csrf 인증 토큰
	let header = '${_csrf.headerName}';
	let token = '${_csrf.token}';
	
	let xhr = new XMLHttpRequest();
	xhr.open("get","/alarm/list", true);
	xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText)
			let jsonData = JSON.parse(xhr.responseText);
			let text = '';
			jsonData.forEach((value,i)=>{
				text += alramBoxCreate(value);
			})
			alramCount.forEach((value,i)=>{
				console.log(jsonData.length)
				value.innerText = jsonData.length;
			})
			document.querySelector("#alramEmpty").innerHTML = '<span id="alramNumber">'+jsonData.length+'</span>개의 새로운 알람</span>';
			alramBox.innerHTML = text;
			
		}
	}
	xhr.setRequestHeader(header,token);
	xhr.send();
	
}

/* [spinnerStart 시작 이벤트 호출] */
/*
function spinnerStart(){
	
	console.log(""); 
	console.log("[spinnerStart] : " + "[start]");           
	console.log("");

	// [로딩 부모 컨테이너 동적 생성] 회색화면
	var createLayDiv = document.createElement("div");
	
	// 설정
	createLayDiv.setAttribute("id", "spinnerLay1000");
	var createLayDivStyle = "width:100%; height:100%; margin:0 auto; padding:0; border:none;";
	createLayDivStyle = createLayDivStyle + " float:top; position:fixed; top:0%; z-index:1000;";
	createLayDivStyle = createLayDivStyle + " background-color:rgba(0, 0, 0, 0.3);"; // 불투명도 설정 >> 자식에게 적용 안됨
	createLayDiv.setAttribute("style", createLayDivStyle);
	
	document.body.appendChild(createLayDiv); //body에 추가 실시


	// [실제 스핀 수행 컨테이너 동적 생성] 스피너
	var createSpinDiv = document.createElement("div");
	
	//설정
	createSpinDiv.setAttribute("id", "spinnerContainer1000");
	var createSpinDivStyle = "width:100px; height:100px; margin:0 auto; padding:0; border:none;"; // 스핀 컨테이너 크기 조절
	createSpinDivStyle = createSpinDivStyle + " float:top; position:relative; top:40%;";
	//createSpinDivStyle = createSpinDivStyle + " background-color:#ff0000;";  
	createSpinDiv.setAttribute("style", createSpinDivStyle);
	
	document.getElementById("spinnerLay1000").appendChild(createSpinDiv); //spinnerLay에 추가 실시


	// [스핀 옵션 지정 실시]
	var opts = {
		lines: 10, // 그릴 선의 수 [20=원형 / 10=막대] [The number of lines to draw]
		length: 10, // 각 줄의 길이 [0=원형 / 10=막대] [The length of each line]
		width: 15, // 선 두께 [The line thickness]
		radius: 42, // 내부 원의 반지름 [The radius of the inner circle]
		scale: 0.85, // 스피너의 전체 크기 지정 [Scales overall size of the spinner]
		corners: 1, // 모서리 라운드 [Corner roundness (0..1)]
		color: '#003399', // 로딩 CSS 색상 [CSS color or array of colors]
		fadeColor: 'transparent', // 로딩 CSS 색상 [CSS color or array of colors]
		opacity: 0.05, // 선 불투명도 [Opacity of the lines]
		rotate: 0, // 회전 오프셋 각도 [The rotation offset]
		direction: 1, // 회전 방향 시계 방향, 반시계 방향 [1: clockwise, -1: counterclockwise]
		speed: 1, // 회전 속도 [Rounds per second]
		trail: 74, // 꼬리 잔광 비율 [Afterglow percentage]
		fps: 20, // 초당 프레임 수 [Frames per second when using setTimeout() as a fallback in IE 9]
		zIndex: 2e9 // 인덱스 설정 [The z-index (defaults to 2000000000)]
	};


	// [스피너 매핑 및 실행 시작]
	var target = document.getElementById("spinnerContainer1000");
	var spinner = new Spinner(opts).spin(target);
};


/* [spinnerStop 중지 이벤트 호출] */

/*
function spinnerStop(){
	console.log("");
	console.log("[spinnerStop] : " + "[start]");
	console.log("");
	try {
		// [로딩 부모 컨테이너 삭제 실시]
		var tagId = document.getElementById("spinnerLay1000");
		document.body.removeChild(tagId); //body에서 삭제 실시 
	}
	catch (exception) {
		// console.error("catch : " + "not find spinnerLay1000");
	}

};
*/
</script>
   
</body>
</html>