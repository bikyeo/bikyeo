
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
$(document).on('ready', function(){
  $('#summernote').summernote({
    tabsize: 2,
    height: 500,
    disableResizeEditor : true
  });
  $('#summernote').summernote('editor.insertText', '${bno.b_Content}');
  $('#BtnSubmit').click(function(){
    Swal({
      type: 'info',
      title: 'FAQ수정',
      html: '글을 수정하시겠습니까?',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      confirmButtonText: '확인',
      cancelButtonColor:'#d33',
      cancelButtonText:'취소'
    }).then(function (result) {
      if (result.value) {
        var content = document.createElement("input");
        content.setAttribute("type", "hidden");
        content.setAttribute("name", "b_Content");
        content.setAttribute("value", $('#summernote').summernote('code'));
        $('#updateBoardForm').append(content);
        $('#updateBoardForm').submit();
      }
    });
    
  });
});  
 
</script>
<div class="container">
 <form id="updateBoardForm" role="form" action="${root}/board/boardmodify.do" method="POST">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    <input type="hidden" name="b_Num" value="${bno.b_Num}">
  <div class="row board-insert-row">
   <input type="hidden" id="select" value="${bno.b_Content}">
    <label class="col-2 mypage-share h5 text-right">제목</label>
    <input type="text" class="form-control col-9 font-weight-bold text-left" name="b_Subject" value="${bno.b_Subject}">
  </div>
  <div class="row board-insert-row">
    <label class="col-2 mypage-share h5 text-right">작성자</label>
    <input type="text" class="form-control col-9 font-weight-bold text-left" name="m_Email" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly>
  </div>
  <div class="row board-insert-row">
    <div class="col-12">
      <div id="summernote" class="text-dark"></div>
    </div>
  </div>
  <div class="row text-center">
    <div class="col-12">
     <button type="button" class="input-group-prepend btn btn-danger" id="BtnSubmit">수정완료</button>  
     <a href="${root}/board/boardfaq.do"  class="btn btn-danger">취소</a>
    </div>
  </div>
</form>
</div>
      