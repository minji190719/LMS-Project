<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${userId }
<form action="/login" method="post">
	아이디 : <input type="text" name="username">
	패스워드 : <input type="password" name="password">
	<sec:csrfInput/>
	
	<button type="submit" >전송</button>
</form>
</body>
</html>