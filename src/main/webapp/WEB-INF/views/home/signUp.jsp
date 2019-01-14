<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="content-center section section-image section-login" style="background-image: url('${root}/img/background3.jpg');">
  <div class="container">
    <div class="col-6 card card-register login-margin ml-auto mr-auto ">

      <h4 class="mb-3 text-center">회원 가입</h4>
      <form class="needs-validation" novalidate>

        <label for="firstName">이메일</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-email-85"></i>
          </span> <input type="email" class="form-control" placeholder="이메일" id="signUpEmail">
          <div class="form-control-feedback text-dark font-weight-bold"></div>
        </div>

        <label>비밀번호</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-key-25"></i>
          </span> <input type="password" class="form-control" placeholder="비밀번호" id="signUpPwd">
          <div class="form-control-feedback text-dark font-weight-bold"></div>
        </div>

        <label>비밀번호 확인</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-key-25"></i>
          </span> <input type="password" class="form-control" placeholder="비밀번호 확인" id="signUpPwdConfirm">
          <div class="form-control-feedback text-dark font-weight-bold"></div>
        </div>

        <label>이름</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-single-02"></i>
          </span> <input type="text" class="form-control" placeholder="이름">
          <div class="form-control-feedback text-dark font-weight-bold"></div>
        </div>

        <label>전화번호</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-mobile"></i>
          </span> <input type="text" class="form-control" placeholder="전화번호" id="signUpPhone">
          <div class="form-control-feedback text-dark font-weight-bold"></div>
        </div>

        <label for="firstName">성별</label>
        <div class="form-inline">
          <div class="form-check-radio">
            <label class="form-check-label register-check-label"> <input class="form-check-input" type="radio" name="gender"
                value="0" checked>남<span class="form-check-sign"></span>
            </label>
          </div>
          <div class="form-check-radio">
            <label class="form-check-label"> <input class="form-check-input" type="radio" name="gender" value="1">
              여 <span class="form-check-sign"></span>
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
<script type="text/javascript">
  /*
   작성일 : 19.01.11
   작성자 : 염승민 
   설명 : 회원 가입 유효성 체크
   */
  $(document).on('ready', function () {

    $('#signUpEmail').keyup(function () {
      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      keyUp(this, regExp, '이메일 형식을 지켜주세요!');
    });

    $('#signUpPwd').keyup(function () {
      var regExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
      keyUp(this, regExp, '비밀번호는 8~16자리, 특수문자 포함입니다.');
    });

    $('#signUpPwdConfirm').keyup(function () {
      var regExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
      keyUp(this, regExp, '비밀번호는 8~16자리, 특수문자 포함입니다.');
    });

    $('#signUpPhone').keyup(function () {
      var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
      keyUp(this, regExp, '전화번호 형식을 지켜주세요.');
    });

    $('#signUpEmail').focusout(function () {
      var email = $(this).val();
      var feedback = $(this).parent('.input-group').children('.form-control-feedback');
      var icon = $(this).parent('.input-group').children('.input-group-addon');
      $.ajax({
        method: 'GET',
        url: '${root}/searchId.do',
        dataType: 'json',
        data: {'email':email},
        contentType:'application/json,charset=UTF-8',
        success: function (data) {
          if (data >= 1) {
            feedback.text('비밀번호가 틀립니다. 다시 확인해주세요.');
            icon.addClass('text-danger');
            icon.removeClass('text-success');
            $(this).removeClass('form-control-success');
            $(this).focusin;
          } else {
            feedback.text('사용 가능합니다.');
            icon.addClass('text-success');
            icon.removeClass('text-danger');
            $(this).addClass('form-control-success');
          }
        }
      })
    });

    $('#signUpPwdConfirm').focusout(function () {
      var pwd = $('#signUpPwd').val();
      var pwdConfirm = $(this).val();
      var feedback = $(this).parent('.input-group').children('.form-control-feedback');
      var icon = $(this).parent('.input-group').children('.input-group-addon');
      if (pwd == pwdConfirm) {
        return;
      } else {
        feedback.text('비밀번호가 틀립니다. 다시 확인해주세요.');
        icon.addClass('text-danger');
        icon.removeClass('text-success');
        $(this).removeClass('form-control-success');
        $(this).focusin;
      }
    });

    function keyUp(obj, regExp, message) {
      var value = $(obj).val();
      var feedback = $(obj).parent('.input-group').children('.form-control-feedback');
      var icon = $(obj).parent('.input-group').children('.input-group-addon');
      if (!regExp.test(value)) {
        feedback.text(message);
        icon.addClass('text-danger');
        icon.removeClass('text-success');
        $(obj).removeClass('form-control-success');
      } else {
        feedback.text('');
        icon.addClass('text-success');
        icon.removeClass('text-danger');
        $(obj).addClass('form-control-success');
      }
    }
  });
</script>