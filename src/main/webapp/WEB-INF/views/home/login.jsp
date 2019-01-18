<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<div class="content-center section section-image section-login"
	style="background-image: url('${root}/img/background2.jpg');">
	<div class="container">
		<div class="row">
			<div class="col-md-4 ml-auto mr-auto">
				<div class="card card-register login-margin">
					<h3 class="title">환영합니다!</h3>
					<form id="loginForm" class="register-form" method="post" action="login.do">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
					<input type="hidden" name="loginRedirect" value="${loginRedirect}" >
						<label>이메일</label>
						<div class="input-group form-group-no-border">
							<span class="input-group-addon"> <i
								class="nc-icon nc-email-85"></i>
							</span> <input type="text" class="form-control" placeholder="이메일" name="m_Email">
						</div>

						<label>비밀번호</label>
						<div class="input-group form-group-no-border">
							<span class="input-group-addon"> <i
								class="nc-icon nc-key-25"></i>
							</span> <input type="password" class="form-control" placeholder="비밀번호" name="m_Pwd">
						</div>
						<button type="button" class="btn btn-danger btn-block btn-round" id="loginBtn">로그인</button>
						<button type="button" class="btn btn-naver btn-block btn-round">네이버 아이디로 로그인</button>
						<button type="button" class="btn btn-kakao btn-block btn-round">카카오 아이디로 로그인</button>
					</form>
					<div class="forgot">
						<a href="#" class="btn btn-link btn-danger">이메일/비밀번호찾기</a>
					</div>
				</div>
				<div class="col text-center">
					<a href="${root}/signup.do"
						class="btn btn-outline-neutral btn-round btn-lg">회원가입</a>
				</div>
			</div>
		</div>
		<h6 class="category category-absolute">Designed and coded by Bikyeo</h6>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
	  var status = "${param.status}";
	  if(status == 'fail') {
	    Swal({
        type: 'error',
        title: '로그인 에러',
        html: '${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}'
      });
	  }
	    
	  $('#loginBtn').click(function() {
	    var m_Email = $('input[name=m_Email]').val();
	    var m_Pwd = $('input[name=m_Pwd]').val();
	    
	    if(m_Email == '' && m_Pwd =='') {
	      Swal({
          type: 'error',
          title: '로그인 에러',
          html: '이메일과 비밀번호를 입력해 주세요.'
        });
	      $('input[name=m_Email]').focus();
	      return false;
	    }
	    
	    if(m_Email == '') {
	      Swal({
          type: 'error',
          title: '로그인 에러',
          html: '이메일을 입력해 주세요.'
        });
	      $('input[name=m_Email]').focus();
	      return false;
      }
	    
	    if(m_Pwd =='') {
	      Swal({
          type: 'error',
          title: '로그인 에러',
          html: '비밀번호를 입력해 주세요.'
        });
	      $('input[name=m_Pwd]').focus();
	      return false;
      }
	    
	    $('#loginForm').submit();
	  });
	  
	});
</script>
