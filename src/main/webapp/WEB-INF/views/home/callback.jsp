<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
  var naverLogin = new naver.LoginWithNaverId({
    clientId: "FRBVx6KQixHBggYi2adi",
    callbackUrl: "${root}/callback.do",
    isPopup: false,
    callbackHandle: true
  /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
  });

  /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
  naverLogin.init();

  /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
  window.addEventListener('load', function() {
    naverLogin.getLoginStatus(function(status) {
      if (status) {
        var id = naverLogin.user.getId();
        var naverId = 'Naver_' + id;
        $.ajax({
          type: 'GET',
          url: '${root}/searchId.do',
          dataType: 'JSON',
          contentType:'application/json; charset=UTF-8',
          data: {m_Email: naverId},
          success: function (data) {
            if (data >= 1) {
              console.log(data);
              var form = document.createElement("form");
              form.setAttribute("charset", "UTF-8");
              form.setAttribute("method", "Post");  //Post 방식
              form.setAttribute("action", "${root}/login.do"); //요청 보낼 주소
              
              var id = document.createElement("input");
              id.setAttribute("type", "hidden");
              id.setAttribute("name", "m_Email");
              id.setAttribute("value", naverId);
              form.appendChild(id);
              
              
              var pwd = document.createElement("input");
              pwd.setAttribute("type", "hidden");
              pwd.setAttribute("name", "m_Pwd");
              pwd.setAttribute("value", naverId);
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
                  location.href="${root}/socialSignUp.do?param="+naverId;
                } else {
                  location.href="${root}/index.do";
                }
              });
            }
          }
        });
        
//         window.location.replace("http://"
//                 + window.location.hostname
//                 + ((location.port == "" || location.port == undefined) ? ""
//                         : ":" + location.port) + "${root}/index.do");
      } else {
        console.log("callback 처리에 실패하였습니다.");
      }
    });
  });
</script>