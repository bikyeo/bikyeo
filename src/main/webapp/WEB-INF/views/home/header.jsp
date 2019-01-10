<!-- 
파일명 : header.jsp
작성일 : 19.01.09
작성자 : 송기원
설명 : 인덱스 페이지 헤더 부분
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-md fixed-top navbar-transparent"
	color-on-scroll="500">
	<div class="container">
		<div class="navbar-translate">
			<button class="navbar-toggler navbar-toggler-right navbar-burger"
				type="button" data-toggle="collapse" data-target="#navbarToggler"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar"></span> <span
					class="navbar-toggler-bar"></span> <span class="navbar-toggler-bar"></span>
			</button>
			<a class="navbar-brand" href="${root}/index.do">Bikyeo</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarToggler">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="" target="_blank"
					class="nav-link d-lg-none none_link">대여소 정보조회</a></li>
				<li class="nav-item"><a href="" target="_blank"
					class="nav-link d-lg-none none_link">FAQ게시판</a></li>
				<li class="nav-item"><a href="" target="_blank"
					class="nav-link d-lg-none none_link">QnA게시판</a></li>
				<li class="nav-item"><a href="" target="_blank"
					class="nav-link">Sign In</a></li>
				<li class="nav-item"><a href="" target="_blank"
					class="nav-link">Sign Up</a></li>
			</ul>
		</div>
	</div>
</nav>