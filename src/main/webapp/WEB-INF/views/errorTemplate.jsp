<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>index</title>
    <!-- 파비콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/bootstrap/images/favicon.png">
    <!-- 피그노즈캘린더 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- 차트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- 커스텀 스타일시트 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">

</head>

<body>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    
	<tiles:insertAttribute name="content"/>

    <script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/settings.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/styleSwitcher.js"></script>
</body>
</html>