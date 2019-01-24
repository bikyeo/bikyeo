<!-- 
파일명 : header.jsp
작성일 : 19.01.09
작성자 : 송기원
설명 : 인덱스 페이지 헤더 부분
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
				<li class="nav-item"><a href="${root}/cycleshare/sharemain.do"
					class="nav-link d-lg-none none_link">대여소 정보조회</a></li>
				<li class="nav-item"><a href="${root}/board/boardfaq.do"
					class="nav-link d-lg-none none_link">FAQ 게시판</a></li>
				<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a href="${root}/login.do"
					class="nav-link text-white">Sign In</a></li>
				<li class="nav-item"><a href="${root}/signup.do"
					class="nav-link text-white">Sign Up</a></li>
			  </sec:authorize>
			  <sec:authorize access="isAuthenticated()">
			  <li class="nav-item"><a href="${root}/member/myPage.do"
          class="nav-link text-white">My Page</a></li>
        <li class="nav-item"><a href="#" id="logoutBtn"
          class="nav-link text-white">Log Out</a></li>
			  </sec:authorize>
			</ul>
		</div>
	</div>
</nav>
<script type="text/javascript">
$(document).ready(function(){
  $('#logoutBtn').click(function(){
    var user = '${pageContext.request.userPrincipal.name}';
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(!regExp.test(user)) {
	    var company = user.substr(0,5);
	    if(company=='kakao') {
	      Kakao.init('7bac65a1ad27df9cef7f991882677d17');
	      Kakao.Auth.logout();
	      console.log('a');
	    }
    }
    var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "${root}/logout.do"); //요청 보낼 주소

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "${_csrf.parameterName}");
    hiddenField.setAttribute("value", "${_csrf.token}");
    form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    form.submit();
    
  });
});

</script>