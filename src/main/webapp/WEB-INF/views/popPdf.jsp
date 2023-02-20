<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<a class="btn mb-1 btn-primary custom-btn-s" href="/resources/pdf/${pdfName}.pdf" download >다운로드</a><br>
	
<iframe src="/resources/pdf/${pdfName}.pdf#toolbar=0&navpanes=0&scrollbar=0" style="width:100%;height:100vh;"></iframe>

</body>
</html>