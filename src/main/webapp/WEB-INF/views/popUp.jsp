<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<img src="${pageContext.request.contextPath }/resources/images/popUpAdv.jpg" style="width:100%;height:95vh;"></img>
<!-- <input onclick="fn_toggle()" type="checkbox" style="margin-left: 10px;">&nbsp;다시보지 않기 -->
<input onclick="fn_toggle()" type="checkbox" style="margin-left: 10px;">&nbsp;하루 동안 다시보지 않기

<script>
function fn_toggle(){
	opener.pop_sur_change(2);
	window.close();
}    
// function fn_toggle(){
// 	let time1970 = new Date().getTime();
// 	time1970 += 60 * 60 * 24 * 1000;
// // 	time1970 += 10 * 1000;
// 	console.log(time1970);
// 	localStorage.setItem("pop_cur_time", time1970);
// 	window.close();
// }    
</script>
</body>
</html>