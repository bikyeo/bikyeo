
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
$(document).ready(function(){
  
  var formObj = $("form");

  $("#delete").on('click', function(){
    
    formObj.attr("action", "${root}/board/delete.do?bno=${bno.b_Num}");
    formObj.attr("method","post");
    formObj.submit();
    
    
    
  });
  
  
  
});

</script>
<div class="container">
 <form role="form" action="${root }/board/boardmodify.do" method="post">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
  <div class="row board-menu">  
   <label class="col-2">글번호</label>
    <input type="text" class="col-10 h5 font-weight-bold text-left" name="b_Num" value="${bno.b_Num }" readonly>
  
    <label class="col-2">제목</label>
    <input type="text" class="col-10 h5 font-weight-bold text-left" name="b_Subject" value="${bno.b_Subject }">
  </div>
  
  <textarea row="50" cols="100" class="form-control" name="b_Content">${bno.b_Content }</textarea>
  <button type="submit" class="label label-default" id="BtnSubmit">수정완료</a></button>  
  
<a href="${root }/board/boardfaq.do" button type="button" class="label label-default">목록</a></button>
<button id="delete" class="label label-default">삭제</button> 

</form>
</div>
      