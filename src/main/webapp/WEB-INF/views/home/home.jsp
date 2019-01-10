<!-- 
파일명 : home.jsp
작성일 : 19.01.09
작성자 : 송기원
설명 : 인덱스 페이지 타일즈 템플릿
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- title 영역 -->

<title><tiles:insertAttribute name="title" /></title>
<link rel="icon" type="image/png" href="${root}/img/bicycle.ico" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${root}/img/apple-icon.png" />
<!-- Bootstrap core CSS     -->
<link href="${root}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${root}/css/paper-kit.css?v=2.1.0" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="${root}/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700'
	rel='stylesheet' type='text/css' />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="${root}/css/nucleo-icons.css" rel="stylesheet" />
<script src="${root}/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${root}/js/jquery-ui-1.12.1.custom.min.js"
	type="text/javascript"></script>
<script src="${root}/js/popper.js" type="text/javascript"></script>
<script src="${root}/js/bootstrap.min.js" type="text/javascript"></script>

<!-- Switches -->
<script src="${root}/js/bootstrap-switch.min.js"></script>

<!--  Plugins for Slider -->
<script src="${root}/js/nouislider.js"></script>

<!--  Plugins for DateTimePicker -->
<script src="${root}/js/moment.min.js"></script>
<script src="${root}/js/bootstrap-datetimepicker.min.js"></script>

<!--  Paper Kit Initialization and functons -->
<script src="${root}/js/paper-kit.js?v=2.1.0"></script>
</head>
<body>
	<!-- Header  영역 -->
	<tiles:insertAttribute name="header" />
	<!-- Main 영역 -->
	<!-- Content 영역 -->
	<tiles:insertAttribute name="content" />

	<!-- Footer 영역  -->
	<tiles:insertAttribute name="footer" />
</body>

</html>