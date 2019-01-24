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
						<a href="#" id="findEmailPwd" class="btn btn-link btn-danger">이메일/비밀번호찾기</a>
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
	  var msg = '${msg}';
    
    if(msg == 'reset') {
      Swal({
        type: 'info',
        title: '비밀번호 변경',
        html: '이메일 찾기입니다. <br><input type="password" id="swal-pwd" class="swal2-input" placeholder="비밀번호를 입력하세요">' +
        '<input type="password" id="swal-pwdConfirm" class="swal2-input" placeholder="비밀번호를 한번 더 입력하세요"><br>'+
        '<button id="editPwdBtn" class="btn-sm-swal swal2-styled">비밀번호 변경</button>',
        showConfirmButton: false,
        onBeforeOpen: function() {
          $('#editPwdBtn').click(function() {
            var pwdRegExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;          
            if($('#swal-pwd').val().trim() == '') {
              Swal({
                type: 'error',
                title: '비밀번호 변경',
                html: '비밀번호를 입력해주세요.'
              });
              return false;
            }
            
            if(!pwdRegExp.test($('#swal-pwd').val())) {
              Swal({
                type: 'error',
                title: '비밀번호 변경',
                html: '비밀번호의 형식을 지켜주세요. 비밀번호는 8~16자리, 특수문자 포함입니다.'
              });
              return false;
            }
            
            if($('#swal-pwdConfirm').val().trim() == '') {
              Swal({
                type: 'error',
                title: '비밀번호 변경',
                html: '비밀번호 확인을 입력해주세요.'
              });
              return false;
            }
            
            if(!pwdRegExp.test($('#swal-pwdConfirm').val())) {
              Swal({
                type: 'error',
                title: '비밀번호 변경',
                html: '비밀번호의 형식을 지켜주세요. 비밀번호는 8~16자리, 특수문자 포함입니다.'
              });
              return false;
            }
            
            if($('#swal-pwd').val()!=$('#swal-pwdConfirm').val()) {
              Swal({
                type: 'error',
                title: '비밀번호 변경',
                html: '비밀번호가 같지 않습니다.'
              });
              return false;
            }
            
            $.ajax({
              type: 'PUT',
              url: '${root}/member/editPwd.do',
              dataType: 'JSON',
              contentType:'application/json; charset=UTF-8',
              data: JSON.stringify({
                m_Email : '${m_Email}',
                m_Pwd : $('#swal-pwd').val()
              }),
              beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(data) {
                if(data.success>=1) {
                  Swal({
                    type: 'success',
                    title: '비밀번호 변경',
                    html: '비밀번호가 변경되었습니다. 다시 로그인해주세요.'
                  });
                } else {
                  Swal({
                    type: 'error',
                    title: '비밀번호 변경',
                    html: '비밀번호 변경 중 에러가 났습니다.<br>잠시 후 다시 이용해주세요.'
                  });
                }
              }
            });
          });
        }
      });
    }
	  
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
              var kakaoId = 'Kakao_' + resultObj.id;
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
    
    $('#findEmailPwd').click(function(){
      Swal({
        type: 'info',
        title: '이메일 찾기 / 비밀번호 변경',
        html: '어떤 작업을 하시겠습니까?<br><button id="findEmail" class="btn-sm-swal swal2-styled">이메일 찾기</button>' +
        '&nbsp;<button id="findPwd" class="btn-sm-swal swal2-styled">비밀번호 변경</button>',
        showConfirmButton: false,
        onBeforeOpen: function() {
          $('#findEmail').click(function(){
            Swal({
              type: 'info',
              title: '이메일 찾기',
              html: '이메일 찾기입니다. <br><input id="swal-name" class="swal2-input" placeholder="이름을 입력하세요">' +
              '<input id="swal-phone" class="swal2-input" placeholder="전화번호를 입력하세요"><br>'+
              '<button id="findMemberEmail" class="btn-sm-swal swal2-styled">이메일 찾기</button>',
              showConfirmButton: false,
              onBeforeOpen: function() {
                $('#findMemberEmail').click(function() {
                  var nameRegExp = /^[가-힣]{2,5}$/;
                  var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
                  
                  if($('#swal-name').val().trim() == '') {
                    Swal({
                      type: 'error',
                      title: '이메일 찾기',
                      html: '이름을 입력해주세요.'
                    });
                    return false;
                  }
                  
                  if(!nameRegExp.test($('#swal-name').val())) {
                    Swal({
                      type: 'error',
                      title: '이메일 찾기',
                      html: '이름을 정확히 입력해주세요.'
                    });
                    return false;
                  }
                  
                  if($('#swal-phone').val().trim() == '') {
                    Swal({
                      type: 'error',
                      title: '이메일 찾기',
                      html: '전화번호를 입력해주세요.'
                    });
                    return false;
                  }
                  
                  if(!phoneRegExp.test($('#swal-phone').val())) {
                    Swal({
                      type: 'error',
                      title: '이메일 찾기',
                      html: '전화번호 형식이 아닙니다.'
                    });
                    return false;
                  }
                  
                  $.ajax({
                    type: 'GET',
                    url: '${root}/member/searchEmail.do',
                    dataType: 'JSON',
                    contentType:'application/json; charset=UTF-8',
                    data: {
                      m_Name: $('#swal-name').val(),
                      m_Phone: $('#swal-phone').val()
                    },
                    success: function (data) {
                      if (!$.isEmptyObject(data)) {
                        var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                        if(emailRegExp.test(data.m_Email)){
                          Swal({
                            type: 'success',
                            title: '이메일 찾기',
                            html: '가입하신 이메일은 ' + data.m_Email + '입니다.'
                          });
                        } else {
                          Swal({
                            type: 'error',
                            title: '이메일 찾기',
                            html: '이메일이 아닌 소셜로그인을 이용하셨습니다.<br> 네이버아이디 또는 카카오아이디로 로그인해주세요.',
                          });
                        }
                      } else {
                        Swal({
                          type: 'error',
                          title: '이메일 찾기',
                          html: '가입된 이메일을 찾을 수 없습니다.'
                        });
                      }
                    }
                  });
                });
              }
            });
          });
          
          $('#findPwd').click(function(){
            Swal({
              type: 'info',
              title: '비밀번호 변경',
              html: '비밀번호 변경입니다.<br>' +
              '<input id="swal-email" class="swal2-input" placeholder="이메일을 입력하세요"><br>'+
              '<button id="findMemberPwd" class="btn-sm-swal swal2-styled">비밀번호 변경</button>',
              showConfirmButton: false,
              onBeforeOpen: function() {
                $('#findMemberPwd').click(function(){
                  var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                  
                  if($('#swal-email').val().trim() == '') {
                    Swal({
                      type: 'error',
                      title: '비밀번호 변경',
                      html: '이메일을 입력해주세요.'
                    });
                    return false;
                  }
                  if(!emailRegExp.test($('#swal-email').val())) {
                    Swal({
                      type: 'error',
                      title: '비밀번호 변경',
                      html: '이메일을 정확히 입력해주세요.'
                    });
                    return false;
                  }
                  
                  $.ajax({
                    type: 'GET',
                    url: '${root}/member/searchPwd.do',
                    data: {
                      m_Email: $('#swal-email').val()
                    },
                    contentType: 'application/json;charset=UTF-8',
                    success: function (data) {
                      if (!$.isEmptyObject(data)) {
	                      Swal({
	                        type: 'success',
	                        title: '비밀번호 변경',
	                        html: '비밀번호 초기화 메일을 보냈습니다. 확인해주세요.',
	                      });
                      } else {
                        Swal({
                          type: 'error',
                          title: '비밀번호 변경',
                          html: '가입된 이메일을 찾을 수 없습니다.'
                        });
                      }
                    }
                  });
                });
              }
            });
          });
        }
      });
    });
	});
</script>
