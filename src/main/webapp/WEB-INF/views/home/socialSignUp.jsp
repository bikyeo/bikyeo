<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="content-center section section-image section-login" style="background-image: url('${root}/img/background3.jpg');">
  <div class="container">
    <div class="col-6 card card-register login-margin ml-auto mr-auto social-sign-up">

      <h4 class="mb-3 text-center">추가 정보 입력</h4>
      <form>
         <input type="hidden" class="form-control" placeholder="이메일" id="signUpEmail" value="${param.param}">
         <input type="hidden" class="form-control" placeholder="비밀번호" id="signUpPwd" value="${param.param}">
        <label>이름</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-single-02"></i>
          </span> <input type="text" class="form-control" placeholder="이름" id="signUpName">
          
        </div>

        <label>전화번호</label>
        <div class="input-group form-group-no-border">
          <span class="input-group-addon"> <i class="nc-icon nc-mobile"></i>
          </span> <input type="text" class="form-control" placeholder="전화번호" id="signUpPhone" >
          
        </div>

        <label for="firstName">성별</label>
        <div class="form-inline">
          <div class="form-check-radio">
            <label class="form-check-label register-check-label"> <input class="form-check-input" type="radio" name="m_Gender"
                value="0" checked>남<span class="form-check-sign"></span>
            </label>
          </div>
          <div class="form-check-radio">
            <label class="form-check-label"> <input class="form-check-input" type="radio" name="m_Gender" value="1">
              여 <span class="form-check-sign"></span>
            </label>
          </div>
        </div>

        <hr class="mb-4">
        <button type="button" class="btn btn-danger btn-block btn-round" id="signUpBtn">회원 가입</button>
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
    
    $('#signUpName').keyup(function(){
      var regExp = /^[가-힣]{2,5}$/;
      keyUp(this, regExp, '이름을 입력해주세요. 2~5자 한글입니다.');
    });

    $('#signUpPhone').keyup(function () {
      var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
      keyUp(this, regExp, '전화번호 형식을 지켜주세요. Ex.012-3456-7890');
    });

    $('#signUpBtn').click(function () {
      // 각각의 값
      var email = $('#signUpEmail').val();
      var pwd = $('#signUpPwd').val();
      var name = $('#signUpName').val();
      var phone = $('#signUpPhone').val();
      
      // 각각의 정규식
      var nameRegExp = /^[가-힣]{2,5}$/;
      var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
      
      if(name.trim() == '' || name.trim == null) {
        Swal({
          type: 'error',
          title: '가입 중 에러',
          html: '이름을 입력해주세요.',
        });
        $('#signUpName').focus();
        return false;
      }
      
      if(!nameRegExp.test(name)) {
        Swal({
          type: 'error',
          title: '가입 중 에러',
          html: '이름을 입력해주세요.<br> 2~5자 한글입니다.',
        });
        $('#signUpName').focus();
        return false;
      }
      
      if(phone.trim() == '' || phone.trim == null) {
        Swal({
          type: 'error',
          title: '가입 중 에러',
          html: '전화번호를 입력해주세요.',
        });
        $('#signUpPhone').focus();
        return false;
      }
      
      if(!phoneRegExp.test(phone)) {
        Swal({
          type: 'error',
          title: '가입 중 에러',
          html: '전화번호 형식을 지켜주세요. <br> Ex.012-3456-7890',
        });
        $('#signUpPhone').focus();
        return false;
      }
      
      var gender = $('input[name="m_Gender"]:checked').val();
      
      var data = JSON.stringify({
        m_Email : email,
        m_Pwd : pwd,
        m_Name : name,
        m_Phone : phone,
        m_Gender : gender
      });
      
      $.ajax({
        type: 'post',
        url: '${root}/member/insert.do',
        dataType: 'JSON',
        contentType:'application/json; charset=UTF-8',
        data: data,
        beforeSend: function(xhr) {
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(data) {
          if (data >= 1) {
            Swal({
              type: 'success',
              title: '가입 완료',
              html: '가입이 완료되었습니다.',
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인'
            }).then(function (result) {
              if (result.value) {
               location.href="${root}/index.do"
              }
            });
          }
        }
      });
    });
    
    function keyUp(obj, regExp, message) {
      var value = $(obj).val();
      var icon = $(obj).parent('.input-group').children('.input-group-addon');
      if (!regExp.test(value)) {
        icon.addClass('text-danger');
        icon.removeClass('text-success');
        $(obj).removeClass('form-control-success');
        $(obj).tooltip({'title': message, 'placement': 'bottom'});
        $(obj).tooltip('show');
      } else {
        icon.addClass('text-success');
        icon.removeClass('text-danger');
        $(obj).removeAttr('data-toggle').removeAttr('data-placement').removeAttr('data-original-title');
        $(obj).addClass('form-control-success');
        $(obj).tooltip('dispose');
      }
    }
  });
</script>