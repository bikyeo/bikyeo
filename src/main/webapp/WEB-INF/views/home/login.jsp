<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<div class="content-center section section-image section-login"
	style="background-image: url('${root}/img/background.jpg');">
	<div class="container">
		<div class="row">
			<div class="col-md-4 ml-auto mr-auto">
				<div class="card card-register login-margin">
					<h3 class="title">환영합니다!</h3>
					<form class="register-form">
						<label>이메일</label>
						<div class="input-group form-group-no-border">
							<span class="input-group-addon"> <i
								class="nc-icon nc-email-85"></i>
							</span> <input type="text" class="form-control" placeholder="이메일">
						</div>

						<label>비밀번호</label>
						<div class="input-group form-group-no-border">
							<span class="input-group-addon"> <i
								class="nc-icon nc-key-25"></i>
							</span> <input type="text" class="form-control" placeholder="비밀번호">
						</div>
						<button class="btn btn-danger btn-block btn-round">로그인</button>
						<button class="btn btn-naver btn-block btn-round">네이버 아이디로 로그인</button>
						<button class="btn btn-kakao btn-block btn-round">카카오 아이디로 로그인</button>
					</form>
					<div class="forgot">
						<a href="#" class="btn btn-link btn-danger">이메일/비밀번호찾기</a>
					</div>
				</div>
				<div class="col text-center">
					<a href=""
						class="btn btn-outline-neutral btn-round btn-lg" target="_blank">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<h6 class="category category-absolute">Designed and coded by Bikyeo</h6>
</div>
