<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="container">
	<div class="row">
		<div class="col-3">
			<div class="card">
				<div class="card-header h3" id="userName">Featured</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a id="memberInfoViewBtn" class="text-danger" href="#">정보 보기</a></li>
					<li class="list-group-item"><a id="memberInfoUpdateBtn" class="text-danger" href="#">정보 수정</a></li>
					<li class="list-group-item"><a id="memberInfoShareCycle" class="text-danger" href="#">대여 이력 보기</a></li>
					<li class="list-group-item"><a id="memberInfoDelete" class="text-danger" href="#">회원 탈퇴</a></li>
				</ul>
			</div>
		</div>
		<div class="col-9">
		<div id="memberInfoContent">
		  
		</div>
		</div>
	</div>
</div>
<script type="text/javascript">
  $(document).on('ready', function(){
    
    memberInfo();
    
    $('#memberInfoViewBtn').click(function() {
      memberInfo();
    });
    
    $('#memberInfoUpdateBtn').click(function() {
      $.ajax({
        url : "${root}/member/info.do",
        dateType:"json",
        type: "GET",
        success : function(data) {
          var userData = JSON.parse(data);
          var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          var social;
          if(!regExp.test(userData.m_Email)) {
            social = true;
          } else {
            social =  false
          }
          if(social) {
            Swal({
              type: 'info',
              title: '정보 수정',
              html: '정보를 수정하시겠습니까?',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인',
              cancelButtonColor:'#d33',
              cancelButtonText:'취소'
            }).then(function (result) {
              $.ajax({
                url : "${root}/member/info.do",
                dateType:"json",
                type: "GET",
                success : function(data) {
                  var userData = JSON.parse(data);
                  var html = '<div class="card">';
                  html += '<div class="card-header h3">' + userData.m_Name + '님 정보 수정</div>';
                  html += '<ul class="list-group list-group-flush">';
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>이름 :</b></div> <div class="col-10">' +userData.m_Name+ '</div></div></li>';
                  var gender;
                  if(userData.m_Gender == '0') {
                    gender = '남자';
                  } else {
                    gender = '여자';
                  }
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>성별 :</b></div> <div class="col-10">' +gender+ '</div></div></li>';
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>전화번호 :</b></div> <div class="col-10"><input class="form-control" type="text" id="memberUpdatePhone" value="' +userData.m_Phone+ '"></div></div></li>';
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +userData.m_Regdate+ '</div></div></li>';
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +userData.m_Update+ '</div></div></li>';
                  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                  var social;
                  if(!regExp.test(userData.m_Email)) {
                    social = userData.m_Email.substr(0,5);
                  } else {
                    social = '소셜 가입을 하지 않았습니다.'
                  }
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>소셜 가입 여부 :</b></div> <div class="col-10">' + social + '</div></div></li>';
                  html += '<li class="list-group-item"><div class="row"><div class="col-6 text-right"><button class="btn btn-danger" type="button" id="memberUpdateConfirm">수정</button></div>';
                  html += '<div class="col-6"><button class="btn btn-default" type="button" id="memberUpdateCancel">취소</button></div></div></li>';
                  html += '</ul>';
                  html += '</div>';
                  $('#memberInfoContent').html(html);
                }
              });
            });
          } else {
            Swal({
              type: 'info',
              title: '정보 수정',
              html: '정보를 수정하시겠습니까?',
              showCancelButton: true,
              input: 'password',
              inputPlaceholder: '정보를 수정하시려면 비밀번호를 입력해주세요.',
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인',
              cancelButtonColor:'#d33',
              cancelButtonText:'취소'
            }).then(function (result) {
              $.ajax({
                url : "${root}/member/pwdConfirm.do",
                dateType:"json",
                data:JSON.stringify({m_Pwd : result.value}),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success : function(data) {
                  var jsonData = JSON.parse(data);
                  if(!jsonData.result){
                    Swal({
                      type: 'error',
                      title: '정보 수정',
                      html: '비밀번호가 맞지 않습니다.',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인'
                    });
                  } else {
                    $.ajax({
                      url : "${root}/member/info.do",
                      dateType:"json",
                      type: "GET",
                      success : function(data) {
                        var userData = JSON.parse(data);
                        var html = '<div class="card">';
                        html += '<div class="card-header h3">' + userData.m_Name + '님 정보 수정</div>';
                        html += '<ul class="list-group list-group-flush">';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>이름 :</b></div> <div class="col-10">' +userData.m_Name+ '</div></div></li>';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>비밀번호 :</b></div> <div class="col-10"><input class="form-control" type="password" id="memberUpdatePwd"></div></div></li>';
                        var gender;
                        if(userData.m_Gender == '0') {
                          gender = '남자';
                        } else {
                          gender = '여자';
                        }
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>성별 :</b></div> <div class="col-10">' +gender+ '</div></div></li>';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>전화번호 :</b></div> <div class="col-10"><input class="form-control" type="text" id="memberUpdatePhone" value="' +userData.m_Phone+ '"></div></div></li>';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +userData.m_Regdate+ '</div></div></li>';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +userData.m_Update+ '</div></div></li>';
                        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                        var social;
                        if(!regExp.test(userData.m_Email)) {
                          social = userData.m_Email.substr(0,5);
                        } else {
                          social = '소셜 가입을 하지 않았습니다.'
                        }
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>소셜 가입 여부 :</b></div> <div class="col-10">' + social + '</div></div></li>';
                        html += '<li class="list-group-item"><div class="row"><div class="col-6 text-right"><button class="btn btn-danger" type="button" id="memberUpdateConfirm">수정</button></div>';
                        html += '<div class="col-6"><button class="btn btn-default" type="button" id="memberUpdateCancel">취소</button></div></div></li>';
                        html += '</ul>';
                        html += '</div>';
                        $('#memberInfoContent').html(html);
                      }
                    });
                  }
                }
              });
            });
          }
        }
      });
    });
    
    $(document).on('click','#memberUpdateCancel',function() {
      Swal({
        type: 'info',
        title: '정보 수정',
        html: '수정을 취소하셨습니다.',
        confirmButtonColor: '#3085d6',
        confirmButtonText: '확인',
      }).then(function (result) {
        memberInfo();
      });
    });
    
    $(document).on('click','#memberUpdateConfirm',function() {
      var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var social;
      $.ajax({
        url : "${root}/member/info.do",
        dateType:"json",
        type: "GET",
        success : function(data) {
          var userData = JSON.parse(data);
          if(!emailRegExp.test(userData.m_Email)) {
            social = true;
          } else {
            social = false;
          }
          
          if(social) {
            var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
            var phone = $('#memberUpdatePhone').val();
            if(!regExp.test(phone)){
              Swal({
                type: 'error',
                title: '정보 수정',
                html: '수정 중 에러가 발생했습니다.<br>전화번호 형식을 지켜주세요.<br> Ex.012-3456-7890',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인'
              });
              return false;
            }
            $.ajax({
              url : "${root}/member/update.do",
              dateType:"json",
              data:JSON.stringify({m_Phone : phone}),
              type: "PUT",
              contentType: "application/json;charset=utf-8",
              beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(data) {
                Swal({
                  type: 'success',
                  title: '정보 수정',
                  html: '수정이 완료되었습니다.',
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: '확인',
                }).then(function (result) {
                  memberInfo();
                });
              }
            });
          } else {
            var pwdRegExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
            var pwd = $('#memberUpdatePwd').val();
            var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
            var phone = $('#memberUpdatePhone').val();
            
            if(pwd!=''&&!pwdRegExp.test(pwd)){
              Swal({
                type: 'error',
                title: '정보 수정',
                html: '수정 중 에러가 발생했습니다.<br>비밀번호 형식을 지켜주세요.<br> 비밀번호는 8~16자리, 특수문자 포함입니다.',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인'
              });
              return false;
            }
            if(!phoneRegExp.test(phone)){
              Swal({
                type: 'error',
                title: '정보 수정',
                html: '수정 중 에러가 발생했습니다.<br>전화번호 형식을 지켜주세요.<br> Ex.012-3456-7890',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인'
              });
              return false;
            }
            
            if(pwd=='') {
              var data = JSON.stringify({m_Phone : phone});
            } else {
              var data = JSON.stringify({m_Pwd : pwd, m_Phone : phone});
            }
            $.ajax({
              url : "${root}/member/update.do",
              dateType:"json",
              data:data,
              type: "PUT",
              contentType: "application/json;charset=utf-8",
              beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(data) {
                Swal({
                  type: 'success',
                  title: '정보 수정',
                  html: '수정이 완료되었습니다.',
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: '확인',
                }).then(function (result) {
                  memberInfo();
                });
              }
            });
          }
        }
      });
    });
    
    $('#memberInfoDelete').click(function() {
      $.ajax({
        url : "${root}/member/delete.do",
        contentType: "application/json;charset=utf-8",
        type: "DELETE",
        beforeSend: function(xhr) {
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success : function(data) {
          var userData = JSON.parse(data);
          if(userData.result>=1) {
            Swal({
              type: 'success',
              title: '회원 탈퇴',
              html: '그동안 Bikyeo를 이용해주셔서 감사합니다.',
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인'
            });
          } else {
            Swal({
              type: 'error',
              title: '회원 탈퇴',
              html: '탈퇴중 에러가 발생했습니다. 잠시후 다시 시도해 주세요.',
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인'
            });
          }
        }
      }).then(function() {

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
    
    $('#memberInfoShareCycle').click(function() {
      $.ajax({
        url : "${root}/member/share.do",
        contentType: "application/json;charset=utf-8",
        type: "GET",
        success : function(data) {
          var userData = JSON.parse(data)
          var html = '<div class="card">';
          html += '<div class="card-header h3">' + userData.m_Name + '님 대여이력</div>';
          html += '<ul class="list-group list-group-flush">';
          html += '<li class="list-group-item"><div class="row"><div class="col-3 text-center"><b>대여장소</b></div>';
          html += '<div class="col-3 text-center"><b>반납장소</b></div><div class="col-3 text-center"><b>대여시간</b></div><div class="col-3 text-center"><b>반납시간</b></div></div></li>';
          if(userData.jsonArray.length >= 1) {
            $.each(userData.jsonArray, function(index, data) {
              var parseData = data;
              var url = "${root}/resources/json/cycle.json";
              $.ajax({
                url : url,
                contentType: "application/json;charset=utf-8",
                type: "GET",
                async: false,
                success : function(data){
	                $.each(data.DATA, function(index, obj) {
	                  console.log(parseData.c_Move == obj.content_id*1);
		                if(parseData.c_Move == (obj.content_id*1)) {
		                  html += '<li class="list-group-item"><div class="row"><div class="col-3 text-center mypage-share">'+obj.content_nm+'</div>';
		                  if
		                  html += '<div class="col-3 text-center mypage-share">'+parseData.s_Sdate+'</div>';
		                  html += '<div class="col-3 text-center mypage-share">'+parseData.s_Sdate+'</div>';
		                    if(parseData.hasOwnProperty('s_Edate')) {
		                      html += '<div class="col-3 text-center mypage-share">'+parseData.s_Edate+'</div>';  
		                    }else {
		                      html += '<div class="col-3 text-center"><button type="button" class="btn btn-sm btn-danger">반납하기</button></div>';  
		                    }
		                  html += '</div></li>';
		                }
	                });
                }
              });
            });
          }  else {
            html += '<li class="list-group-item"><div class="row"><div class="col-12 text-center"><b>대여 이력이 없습니다.</b></div></div></li>';
          }
          html += '</ul>';
          html += '</div>';
          console.log(html);
          $('#memberInfoContent').html(html);
        }
      })
    });
    
    function memberInfo() {
      $.ajax({
        url : "${root}/member/info.do",
        dateType:"json",
        type: "GET",
        success : function(data) {
          var userData = JSON.parse(data);
          $('#userName').html('MyPage');
          var html = '<div class="card">';
          html += '<div class="card-header h3">' + userData.m_Name + '님 정보 보기</div>';
          html += '<ul class="list-group list-group-flush">';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>이름 :</b></div> <div class="col-10">' +userData.m_Name+ '</div></div></li>';
          var gender;
          if(userData.m_Gender == '0') {
            gender = '남자';
          } else {
            gender = '여자';
          }
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>성별 :</b></div> <div class="col-10">' +gender+ '</div></div></li>';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>전화번호 :</b></div> <div class="col-10">' +userData.m_Phone+ '</div></div></li>';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +userData.m_Regdate+ '</div></div></li>';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +userData.m_Update+ '</div></div></li>';
          var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          var social;
          if(!regExp.test(userData.m_Email)) {
            social = userData.m_Email.substr(0,5);
          } else {
            social = '소셜 가입을 하지 않았습니다.'
          }
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>소셜 가입 여부 :</b></div> <div class="col-10">' + social + '</div></div></li>';
          html += '</ul>';
          html += '</div>';
          $('#memberInfoContent').html(html);
        }
      });
    }
    
  });
</script>