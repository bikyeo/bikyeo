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
						<div id="naverIdLogin"></div>
						<button type="button" class="btn btn-danger btn-block btn-round" id="loginBtn">로그인</button>
						<button type="button" class="btn btn-naver btn-block btn-round" id="naverLoginBtn">네이버 아이디로 로그인</button>
						<button type="button" class="btn btn-kakao btn-block btn-round" id="kakaoLoginBtn">카카오 아이디로 로그인</button>
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
	  
	  $('#kakaoLoginBtn').click(function() {
	    Kakao.init('7bac65a1ad27df9cef7f991882677d17');
	    Kakao.Auth.login({
        success: function(authObj) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(resultObj) {
              var kakaoId = 'kakao_' + resultObj.id;
              $.ajax({
                type: 'GET',
                url: '${root}/searchId.do',
                dataType: 'JSON',
                contentType:'application/json; charset=UTF-8',
                data: {m_Email: kakaoId},
                success: function (data) {
                  if (data >= 1) {
                    
                    var form = document.createElement("form");
                    form.setAttribute("charset", "UTF-8");
                    form.setAttribute("method", "Post");  //Post 방식
                    form.setAttribute("action", "${root}/login.do"); //요청 보낼 주소
                    
                    var id = document.createElement("input");
                    id.setAttribute("type", "hidden");
                    id.setAttribute("name", "m_Email");
                    id.setAttribute("value", kakaoId);
                    form.appendChild(id);
                    
                    
                    var pwd = document.createElement("input");
                    pwd.setAttribute("type", "hidden");
                    pwd.setAttribute("name", "m_Pwd");
                    pwd.setAttribute("value", kakaoId);
                    form.appendChild(pwd);
                    
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "${_csrf.parameterName}");
                    hiddenField.setAttribute("value", "${_csrf.token}");
                    form.appendChild(hiddenField);
                    
                    document.body.appendChild(form);
                    form.submit();
                    
                  } else {
                    Swal({
                      type: 'info',
                      title: '추가정보 입력',
                      html: '사이트 이용시 추가정보가 필요합니다.',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      cancelButtonColor:'#d33',
                      cancelButtonText:'취소'
                    }).then(function (result) {
                      if (result.value) {
                        location.href="${root}/socialSignUp.do?param=" + kakaoId;
                      }
                    });
                  }
                }
              });
            }
          });
        },
        fail: function(err) {
          console.log(JSON.stringify(err));
        }
	    
      });
    });
	  
	  var naverLogin = new naver.LoginWithNaverId({
      clientId: "FRBVx6KQixHBggYi2adi",
      callbackUrl: "http://localhost:8090${root}/callback.do",
      isPopup: false, /* 팝업을 통한 연동처리 여부 */
      loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
    });
          
    /* 설정정보를 초기화하고 연동을 준비 */
    naverLogin.init();
    
    
    $('#naverIdLogin_loginButton').attr('hidden',true);
    
    
    $('#naverLoginBtn').click(function() {
      
      $("#naverIdLogin_loginButton").get(0).click();
    });
	});
</script>
