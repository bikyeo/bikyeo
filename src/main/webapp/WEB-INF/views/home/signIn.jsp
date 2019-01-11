<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="content-center section section-image section-login"
	style="background-image: url('${root}/img/background.jpg');">
	<div class="container">
		<div class="col-6 card card-register login-margin ml-auto mr-auto ">

			<h4 class="mb-3 text-center">회원 가입</h4>
			<form class="needs-validation" novalidate>

				<div class="col-12">
					<label for="firstName">이메일</label> <input type="email"
						class="form-control" id="" placeholder="" value="" required>
					<div class="invalid-feedback">.</div>
				</div>

				<div class="col-12">
					<label for="firstName">비밀번호</label> <input type="text"
						class="form-control" id="" placeholder="" value="" required>
					<div class="invalid-feedback">.</div>
				</div>

				<div class="col-12">
					<label for="firstName">비밀번호 확인</label> <input type="text"
						class="form-control" id="" placeholder="" value="" required>
					<div class="invalid-feedback">.</div>
				</div>

				<div class="col-12">
					<label for="firstName">이름</label> <input type="text"
						class="form-control" id="" placeholder="" value="" required>
					<div class="invalid-feedback">.</div>
				</div>
				
				<div class="col-12 register-check">
          <label for="firstName">전화번호</label>
            <div class="form-inline">
            <select class="custom-select">
              <option selected="selected">010</option>
              <option>011</option>
              <option>017</option>
              <option>018</option>
              <option>019</option>
            </select> - 
            <input type="text"
            class="form-control col-4" id="" placeholder="" value="" required> - 
            <input type="text"
            class="form-control col-4" id="" placeholder="" value="" required>
            </div>
          <div class="invalid-feedback">.</div>
        </div>

				<div class="col-12">
					<label for="firstName">성별</label>
					<div class="form-inline">
						<div class="form-check-radio">
							<label class="form-check-label register-check-label"> <input
								class="form-check-input" type="radio" name="exampleRadios"
								id="exampleRadios1" value="option1">남<span
								class="form-check-sign"></span>
							</label>
						</div>
						<div class="form-check-radio">
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="exampleRadios"
								id="exampleRadios1" value="option1" checked> 여 <span
								class="form-check-sign"></span>
							</label>
						</div>
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
