<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta name="_csrf" content="34454bcc-95fb-4dd5-9273-8cb0feae6a88">
<meta name="_csrf_header" content="X-CSRF-TOKEN">
<style type="text/css">
	.qus{
/* 		border: 1px dotted #EDEDED; */
/* 		background-color: #EDEDED; */

	}
	
	@font-face {
	    font-family: 'NanumSquareNeo-Variable';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	#frm{
	    margin-top: 40px;
   		margin-left: 50px;
	}

	.font{
		margin: 20px;
		color: var(--custom-m);
		font-family: 'NanumSquareNeo-Variable';
		font-size: 20px;
		display: inline-block;
	}
	
	body{
   		background-image: linear-gradient( rgba( 255, 255, 255, 0.1), rgba( 255, 255, 255, 0.9) ), url('/resources/images/popup.jpg'); /* #DAECF8; */
	    background-repeat: no-repeat;
	    background-size: cover;
	}
	
	.con{
		font-family: 'NanumSquareNeo-Variable';
		font-weight: bolder;
		font-size: 14px;
		float:left;
		text-align: center;
		margin-left: 50px;
	}
	
	.img{
		width: 30px;
		height: 30px;
	}
</style>
</head>
<body>
	<form id="frm">
		<div class="qus">
			<span class="font"><img class="img" src="${pageContext.request.contextPath }/resources/images/questionIcon.png">&nbsp;??????????????? ??????????????? ?????? ???????????? ??????????????????.</span><br>
			<br>
			<span class="con">
				<input type="radio" name="q1" value="1"><br>?????? ?????????
			</span>	
			<span class="con">
				<input type="radio" name="q1" value="2"><br>?????????
			</span>	
			<span class="con">
				<input type="radio" name="q1" value="3"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q1" value="4"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q1" value="5"><br>?????? ??????
			</span>	
			<br><br>
		</div>
		<br>
		<div class="qus">
			<span class="font"><img class="img" src="${pageContext.request.contextPath }/resources/images/questionIcon.png">&nbsp;???????????? ????????? ?????? ??? ?????? ?????? ???????????????????</span><br>
			<br>
			<span class="con">
				<input type="radio" name="q2" value="1"><br>?????? ?????????
			</span>	
			<span class="con">
				<input type="radio" name="q2" value="2"><br>?????????
			</span>	
			<span class="con">
				<input type="radio" name="q2" value="3"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q2" value="4"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q2" value="5"><br>?????? ??????
			</span>	
			<br><br>
		</div>
		<br>
		<div class="qus">
			<span class="font"><img class="img" src="${pageContext.request.contextPath }/resources/images/questionIcon.png">&nbsp;????????? ???????????? ?????? ????????? ?????? ???????????????????</span><br>
			<br>
			<span class="con">
				<input type="radio" name="q3" value="1"><br>?????? ?????????
			</span>	
			<span class="con">
				<input type="radio" name="q3" value="2"><br>?????????
			</span>	
			<span class="con">
				<input type="radio" name="q3" value="3"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q3" value="4"><br>??????
			</span>	
			<span class="con">
				<input type="radio" name="q3" value="5"><br>?????? ??????
			</span>		
		</div>
	</form>
	<br><br><br><br>
	<div style="display: inline-block; margin-left: 10px;">
<!-- 		<input onclick="fn_toggle()" type="checkbox">&nbsp;?????? ?????? ?????? -->
		<input onclick="fn_toggle()" type="checkbox">&nbsp;?????? ?????? ?????? ?????? ??????
		&nbsp;&nbsp;
		<input type="button" class="btn mb-1 btn-outline-info" value="??????" onclick="register()">
	</div>
</body>
<script>
function fn_toggle(){
	opener.pop_sur_change(1);
	window.close();
}
// function fn_toggle(){
// 	let time1970 = new Date().getTime();
// 	time1970 += 60 * 60 * 24 * 1000;
// // 	time1970 += 10 * 1000;
// 	console.log(time1970);
// 	localStorage.setItem("pop_sur_cur_time", time1970);
// 	window.close();
// }

function register(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let form = document.querySelector("#frm");
	let surv_answer1 = form.q1.value;
	let surv_answer2 = form.q2.value;
	let surv_answer3 = form.q3.value;	
	
	swal({
		  title: "?????? ??????",
		  text: "????????? ?????? ???????????????.",
		  icon: "success",
		  button: "??????",
		})
		.then((value) =>{
			opener.closeSurvey();
			opener.survRegister(surv_answer1, surv_answer2, surv_answer3);
	});

}

</script>
</html>