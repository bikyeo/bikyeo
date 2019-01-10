<!-- 
파일명 : header.jsp
작성일 : 19.01.10
작성자 : 염승민
설명 : 일반 페이지 헤더 부분
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-md fixed-top">
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
<!-- 				<li class="nav-item"><a class="nav-link" rel="tooltip" -->
<!-- 					title="Like us on Facebook" data-placement="bottom" -->
<!-- 					href="https://www.facebook.com/CreativeTim" target="_blank"> <i -->
<!-- 						class="fa fa-facebook-square"></i> -->
<!-- 						<p class="d-lg-none">Facebook</p> -->
<!-- 				</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" rel="tooltip" -->
<!-- 					title="Follow us on Instagram" data-placement="bottom" -->
<!-- 					href="https://www.instagram.com/CreativeTimOfficial" -->
<!-- 					target="_blank"> <i class="fa fa-instagram"></i> -->
<!-- 						<p class="d-lg-none">Instagram</p> -->
<!-- 				</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" rel="tooltip" -->
<!-- 					title="Star on GitHub" data-placement="bottom" -->
<!-- 					href="https://www.github.com/CreativeTimOfficial/paper-kit" -->
<!-- 					target="_blank"> <i class="fa fa-github"></i> -->
<!-- 						<p class="d-lg-none">GitHub</p> -->
<!-- 				</a></li> -->
			 <li class="nav-item"><a
          href="https://www.creative-tim.com/product/paper-kit-2-pro?ref=pk2-free-local"
          target="_blank" class="nav-link d-lg-none" id="rent">대여소 정보조회</a></li>
      
				<li class="nav-item"><a
          href="https://www.creative-tim.com/product/paper-kit-2-pro?ref=pk2-free-local"
          target="_blank" class="nav-link">Sign In</a></li>
				<li class="nav-item"><a
					href="https://www.creative-tim.com/product/paper-kit-2-pro?ref=pk2-free-local"
					target="_blank" class="nav-link">Sign Up</a>
				</li>
			</ul>
		</div>
	</div>
</nav>