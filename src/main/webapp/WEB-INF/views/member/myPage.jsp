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
					<li class="list-group-item"><a id="memberInfoSharePayment" class="text-danger" href="#">결제 이력 보기</a></li>
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
                  var date = new Date(userData.m_Regdate);
                  var dateString = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ';                 
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +dateString+ '</div></div></li>';
                  date = new Date(userData.m_Update);
                  dateString = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ';
                  html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +dateString+ '</div></div></li>';
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
                        var regDate = new Date(userData.m_Regdate);
                        var regDateString = regDate.getFullYear() + '년 ' + (regDate.getMonth() + 1) + '월 ' + regDate.getDate() + '일 ';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +regDateString+ '</div></div></li>';
                        var upDate = new Date(userData.m_Regdate);
                        var upDateString = upDate.getFullYear() + '년 ' + (upDate.getMonth() + 1) + '월 ' + upDate.getDate() + '일 ';
                        html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +upDateString+ '</div></div></li>';
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
      Swal({
        type: 'info',
        title: '회원 탈퇴',
        html: '그동안 Bikyeo를 이용해주셔서 감사합니다.',
        confirmButtonColor: '#3085d6',
        confirmButtonText: '확인'
      }).then(function(result) {
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
      
    });
    
    $('#memberInfoShareCycle').click(function() {
      memberShareInfo();
    });
    
    $('#memberInfoSharePayment').click(function(){
      $.ajax({
        url : '${root}/member/payment.do',
        contentType: "application/json;charset=utf-8",
        type: "GET",
        success : function(data){
          var userData = JSON.parse(data);
          var html = '<div class="card">';
          html += '<div class="card-header h3">' + userData.m_Name + '님 결제 이력</div>';
          html += '<ul class="list-group list-group-flush">';
          html += '<li class="list-group-item"><div class="row"><div class="col-4 text-center"><b>결제시간</b></div>';
          html += '<div class="col-4 text-center"><b>결제금액</b></div><div class="col-4 text-center"><b>결제사유</b></div></div></li>';
          if(userData.jsonArray.length >= 1) {
            $.each(userData.jsonArray, function(index, data) {
              html +='<li class="list-group-item"><div class="row">';
              var date = new Date(data.sp_Date);
              var dateString = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ';
              dateString += date.getHours() + '시 ' + date.getMinutes() + '분';
              html += '<div class="col-4 text-center mypage-share">'+dateString+'</div>';
              html += '<div class="col-4 text-center mypage-share">'+data.sp_Pay+'원</div>';
              if(data.sp_Status == 0) {
                html += '<div class="col-4 text-center mypage-share text-success">대여</div>';  
              } else {
                html += '<div class="col-4 text-center mypage-share text-danger">연체</div>';
              }
            });
            html += '</div>';
            html += '</li>';
          } else {
            html += '<li class="list-group-item"><div class="row"><div class="col-12 text-center"><b>결제 이력이 없습니다.</b></div></div></li>';
          }
          html += '</ul>';
          html += '</div>';
          $('#memberInfoContent').html(html);
        }
      });
    });
    
  //반납하기     
    $(document).on('click','.returnBtn',function() {
      
      var html="";
      var placenum;
      var placearray=[];
      var indexcycle;
      var pdate = $(this).attr('s_Pdate');
      var c_Code = $(this).attr('c_Code');
      console.log(c_Code);
      var placename;
      var placenamearray=[];
      var fine;
      
      $.ajax({
        url : "${root}/cycleshare/return.do", 
        contentType: "application/json;charset=utf-8",
        dateType:"json",
        async:false,
        beforeSend: function(xhr) {
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        type: "GET",
        success : function(data) {
          if(data.length != 0){
          $('#exampleModalLabel').attr('class','font-weight-bold');
          $('#exampleModalLabel').text('대여중인 자전거');
          $('.modal-body').text('');
          var k = placearray.length;
          var url = "${root}/resources/json/cycle.json";
            $.getJSON(url,function(data){
            for(var i=0;i < k;i++){
              for(var j=0; j< data.DATA.length;j++){
                if(placearray[i]==data.DATA[j].content_id){
                  placenamearray.push(data.DATA[j].content_nm);
                  break;
                }
              }
            }
            for(var i=1;i < k+1;i++){ 
            $('#return-select').find('option').eq(i).append(placenamearray[i-1]);
            }
           })
          $('.modal-body').append('<br><span class="return-margin">반납할 지역구 : </span>');
          html = '<select class="custom-select return-margin" id="return-district">'; 
          html += '<option value="no-data">지역구</option>';
          var districts = ["도봉구","노원구","강북구","성북구","중랑구",
            "은평구","종로구","서대문구","중구","동대문구",
            "성동구","광진구","용산구","마포구","강서구",
            "양천구","영등포구","구로구","금천구","동작구",
            "관악구","서초구","강남구","송파구","강동구"];
          for(var i =0;i < districts.length;i++){
          html += '<option value="'+i+'">'+districts[i]+'</option>';
          };
          html += '</select>';
          $('.modal-body').append(html);
          
          html = '<br><span class="return-margin">반납할 대여소 : </span>';
          html += '<select class="custom-select return-margin" id="return-place">';
          html += '<option>대여소명</option>';
          $('.modal-body').append(html);
          
        
          
          var deadline = new Date(pdate);
          var currenthour = new Date();
          var hour;
          var pmam;
          if(pdate.substring(11,13)*1 >= 24){
            hour = pdate.substring(11,13)*1 -24;
            pmam="AM";
          }else if(pdate.substring(11,13)*1 >= 13){
            hour = pdate.substring(11,13)*1-12;
             pmam="PM";
          }else if(pdate.substring(11,13)*1 == 12){
            hour = pdate.substring(11,13)*1
            pmam="PM";
          }else if(pdate.substring(11,13)*1 <= 12){
            hour = pdate.substring(11,13)*1
            pmam="AM";
          }
          pdate = pdate.substring(0,10)+' '+hour+ pdate.substring(13,16) +' '+ pmam ;
          html = '<div id="returntime"><br><span class="return-margin">반납 예정시간 : </span>';
          html += '<span class="return-margin">'+pdate+'</span></div>'; 
          if(deadline > currenthour){
            fine=0;
            
          }else{
            var deadhour = currenthour.getHours()-deadline.getHours();
            var deadminutes = deadline.getMinutes()-currenthour.getMinutes();
            if(deadhour == 0){
              fine = 2000;
            }else{
              if(deadminutes < 0) {
                deadhour = deadhour+1;
              }
              fine = deadhour*2000;
            }
            html += '<div id="fine" class="text-center font-weight-bold rent-subject"><br><span class="return-margin">연체 금액 </span>';
            html += '<span class="return-margin" id="pay" fine="'+fine+'">'+fine+' 원</span></div>';
           }
          console.log(fine);
          
          $('#returntime').remove();
          $('#fine').remove();
          $('.modal-body').append(html);
          
              
          
          
          $('#return-district').on('change',function(){
            $('#return-place').empty();
            $('#return-place').append('<option>대여소명</option>');
            
            var district = districts[$('#return-district').val()];
            
            var url = "${root}/resources/json/cycle.json";
            $.getJSON(url,function(data){
            
              $.each(data.DATA,function(index,obj){
                if(district == obj.addr_gu){
                  $('#return-place').append('<option value="'+obj.content_id+'">'+obj.content_nm+'</option>');
                }
                
              })
            })
            
          })
          
          $('#return-place').on('change',function(){
            var place = $(this);
            var placeval = place.val();
            var placedata = {"c_Move":place.val()};
            $.ajax({
              type: "POST",
              url : "${root}/cycle/placecheck.do", 
              data : JSON.stringify(placedata),
              contentType: "application/json;charset=utf-8",
              dateType:"json",
              async:false,
              beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success : function(data) {
                console.log(data);
                if(data >= 20){
                  Swal({
                    title:'자전거를 반납할 수 없습니다.',
                    text: '대여소에 자전거가 모두 차있습니다.',
                    type: 'error',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.value) {
                      place.empty();
                      place.append('<option>대여소명</option>');
                      
                    }
                    $('#return-district').val('no-data');
                   
                  })
                  
                }
                
              }
              
            })
            $('#return-district').focus();
          })
          
          
          $('.left-side').children().attr('id','return-submit');
          $('.left-side').children().attr('c_Code',c_Code);
          $('.left-side').children().text('반납하기');
          $('.right-side').children().attr('data-dismiss','modal');
          $('.right-side').children().text('취소');
          
          $('#myModal').modal('show');
          }else{
            Swal('대여중인 자전거가 없습니다.', '', 'info');
                   
          }
        }
      })
      
    })
    
        $(document).on('click','#return-submit',function(){
          var c_Code = $(this).attr('c_Code');
        if($('#return-select').val()=="no-data"){
          swal("반납할 자전거를 선택해주세요.","","info");    
             
        }
        else if($('#return-district').val()=="no-data"){
          swal("지역구를 선택해주세요.","","info");    
        }else if($('#return-place').val()=="대여소명"){
          swal("대여소를 선택해주세요.","","info");
        }else{
          console.log($('#pay').attr('fine')*1);
         if($('#pay').attr('fine') == null){
        
           var data = { "c_Code": c_Code,
                        "c_Move": $('#return-place').val()
                       };
//         console.log(data);
        $.ajax({
          url : "${root}/cycleshare/return.do",
          data : JSON.stringify(data),
          beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          contentType: "application/json;charset=utf-8",
          dateType:"json",   
          type: "POST",
          success : function(data) {
            console.log(data);
            var time = new Date();
            var pmam;
            var hour=time.getHours()*1;
            var rentday;
            var rent_data;
            var currentTime;
            if(time.getHours()*1 >= 13){
              hour = time.getHours()*1-12;
              pmam = "PM";
            }else if(time.getHours()*1 == 12){
              pmam = "PM";
            }else if(time.getHours()*1 <= 12){
              pmam = "AM";
            }
            currentTime = hour+':'+ time.getMinutes() + pmam;
            if(data>0){
              Swal({
                title:'반납에 성공하셨습니다.',
                text: '반납시간 : '+currentTime,
                type: 'success',
                confirmButtonText: '확인'
              }).then((result) => {
                if (result.value) {
                  memberShareInfo();
                  $('#myModal').modal('hide');
                }
              })
              
            }else{
              swal("반납에 실패하였습니다.","","error");
            }
          }
        })
         } 
         else{
//            swal("결제를 하셔야합니다.","","warning");
//            console.log(fine);
      var m_Phone;
      var m_Name;
      var m_Email;
      $.ajax({
        url : "${root}/member/info.do", // test.jsp 에서 받아옴
        type: "GET",
        dataType :"json",
        async:false,// 데이터타입을 json 으로 받아옴
        success : function(data) {
          m_Phone = data.m_Phone;
          m_Name = data.m_Name;
          m_Email = data.m_Email;
//카카오 페이
          IMP.init('imp31057577');
          IMP.request_pay({
              pg : 'kakaopay',
              pay_method : 'card',
              merchant_uid : 'merchant_' + new Date().getTime(),
              name : '자전거반납',
              amount : $('#pay').attr('fine')*1,
              buyer_email : m_Email,
              buyer_name : m_Name,
              buyer_tel : m_Phone,
          }, function(rsp) {
              if ( rsp.success ) {
                
                var data = { "c_Code" : c_Code,
                             "c_Move" : $('#return-place').val(),
                             "paymentDto" : {"sp_Pay" : $('#pay').attr('fine')*1}      
                };
           
           $.ajax({
             url : "${root}/cycleshare/return.do",
             data : JSON.stringify(data),
             beforeSend: function(xhr) {
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             contentType: "application/json;charset=utf-8",
             dateType:"json",  
             async:false,
             type: "POST",
             success : function(data) {
//                console.log(data);
               var time = new Date();
               var pmam;
               var hour=time.getHours()*1;
               var rentday;
               var rent_data;
               var currentTime;
               if(time.getHours()*1 >= 13){
                 hour = time.getHours()*1-12;
                 pmam = "PM";
               }else if(time.getHours()*1 == 12){
                 pmam = "PM";
               }else if(time.getHours()*1 <= 12){
                 pmam = "AM";
               }
               currentTime = hour+':'+ time.getMinutes() + pmam;
               if(data>0){
                 Swal({
                   title:'반납에 성공하셨습니다.',
                   text: '반납시간 : '+currentTime,
                   type: 'success',
                   confirmButtonText: '확인'
                 }).then((result) => {
                   if (result.value) {
                     memberShareInfo();
                     $('#myModal').modal('hide');
                   }
                 })
                 
               }else{
                 swal("반납에 실패하였습니다.","","error");
               }
             }, error:function(request, status, error) {
               swal("반납에 실패하였습니다.","","error");

             }
           })
                
                
              }
              else {
                swal("반납에 실패하였습니다.","","error");
              }
          })
          }
        })
         }
        }
      
      })
    
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
          var regDate = new Date(userData.m_Regdate);
          var regDateString = regDate.getFullYear() + '년 ' + (regDate.getMonth() + 1) + '월 ' + regDate.getDate() + '일 ';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>가입날짜 :</b></div> <div class="col-10">' +regDateString+ '</div></div></li>';
          var upDate = new Date(userData.m_Regdate);
          var upDateString = upDate.getFullYear() + '년 ' + (upDate.getMonth() + 1) + '월 ' + upDate.getDate() + '일 ';
          html += '<li class="list-group-item"><div class="row"><div class="col-2 text-right"><b>수정날짜 :</b></div> <div class="col-10">' +upDateString+ '</div></div></li>';
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
    
    function memberShareInfo() {
      $.ajax({
        url : "${root}/member/share.do",
        contentType: "application/json;charset=utf-8",
        type: "GET",
        success : function(data) {
          var userData = JSON.parse(data)
          var html = '<div class="card">';
          html += '<div class="card-header h3">' + userData.m_Name + '님 대여 이력</div>';
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
                    if(parseData.c_Prev == (obj.content_id*1)) {
                      html += '<li class="list-group-item"><div class="row"><div class="col-3 text-center mypage-share">'+obj.content_nm+'</div>';
                    }
                  });
                  
                  if(parseData.c_Status == 0) {
                    $.each(data.DATA, function(index, obj) {
                      if(parseData.c_Move == (obj.content_id*1)) {
                        html += '<div class="col-3 text-center mypage-share">'+obj.content_nm+'</div>';
                      }
                    }); 
                  }else {
                    html += '<div class="col-3 text-center mypage-share"></div>';
                  }
                  var date = new Date(parseData.s_Sdate);
                  var dateString = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ';
                  dateString += date.getHours() + '시 ' + date.getMinutes() + '분';
                  html += '<div class="col-3 text-center mypage-share">'+dateString+'</div>';
                  if(parseData.c_Status == 0){
                    date = new Date(parseData.s_Edate);
                    dateString = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ';
                    dateString += date.getHours() + '시 ' + date.getMinutes() + '분';
                    html += '<div class="col-3 text-center mypage-share">'+dateString+'</div>';  
                  }else {
                    console.log(parseData);
                    html += '<div class="col-3 text-center"><button type="button" class="btn btn-sm btn-danger returnBtn" s_Pdate="'+parseData.s_Pdate+'" c_Code="'+parseData.c_Code+'">반납하기</button></div>';
                  }
                  html += '</div></li>';
                }
              });
            });
          }  else {
            html += '<li class="list-group-item"><div class="row"><div class="col-12 text-center"><b>대여 이력이 없습니다.</b></div></div></li>';
          }
          html += '</ul>';
          html += '</div>';
          $('#memberInfoContent').html(html);
        }
      })
    }
    
  });
</script>