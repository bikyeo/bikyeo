<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="content-center section section-image section-login"
	style="background-image: url('${root}/img/background3.jpg');">
	<div class="container">
		<div class="col-6 card card-register login-margin ml-auto mr-auto ">

			<h4 class="mb-3 text-center">회원 가입</h4>
			<form class="needs-validation" novalidate>


				<label for="firstName">이메일</label>
				<div class="input-group form-group-no-border">
					<span class="input-group-addon"> <i
						class="nc-icon nc-email-85"></i>
					</span> <input type="text" class="form-control" placeholder="이메일">
					<div class="invalid-feedback">.</div>
				</div>

				<label>비밀번호</label>
				<div class="input-group form-group-no-border">
					<span class="input-group-addon"> <i
						class="nc-icon nc-key-25"></i>
					</span> <input type="password" class="form-control" placeholder="비밀번호">
					<div class="invalid-feedback">.</div>
				</div>

				<label>비밀번호 확인</label>
				<div class="input-group form-group-no-border">
					<span class="input-group-addon"> <i
						class="nc-icon nc-key-25"></i>
					</span> <input type="password" class="form-control" placeholder="비밀번호 확인">
					<div class="invalid-feedback">.</div>
				</div>

				<label>이름</label>
				<div class="input-group form-group-no-border">
					<span class="input-group-addon"> <i
						class="nc-icon nc-single-02"></i>
					</span> <input type="text" class="form-control" placeholder="이름">
					<div class="invalid-feedback">.</div>
				</div>

				<label>전화번호</label>
				<div class="input-group form-group-no-border">
					<span class="input-group-addon"> <i
						class="nc-icon nc-mobile"></i>
					</span> <input type="text" class="form-control" placeholder="전화번호">
					<div class="invalid-feedback">.</div>
				</div>

				<label for="firstName">성별</label>
				<div class="form-inline">
					<div class="form-check-radio">
						<label class="form-check-label register-check-label"> <input
							class="form-check-input" type="radio" name="gender"
							id="exampleRadios1" value="0" checked>남<span
							class="form-check-sign"></span>
						</label>
					</div>
					<div class="form-check-radio">
						<label class="form-check-label"> <input
							class="form-check-input" type="radio" name="gender"
							id="exampleRadios1" value="1"> 여 <span
							class="form-check-sign"></span>
						</label>
					</div>
				</div>

				<hr class="mb-4">
				<button class="btn btn-danger btn-block btn-round">회원 가입</button>
			</form>
		</div>
	</div>
	<h6 class="category category-absolute">Designed and coded by
		Bikyeo</h6>
</div>
