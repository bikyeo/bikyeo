
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<script type="text/javascript">
$(document).ready(function(){
  
  $("#BtnSubmit").on('click',function(){
    
    alert("수정되었습니다.")
   
  })
  
  
  
});

</script>


<div class="container">
<form role="form" action="${root }/board/boardfaqfix.do" method="post">

  <div class="row board-menu">
      <label class="col-2">글번호</label>
       <input type="text" class="col-10 h5 font-weight-bold text-left" name="b_Num" value="${bno.b_Num }" readonly>
  
    <label class="col-2">제목</label>
    <input type="text" class="col-10 h5 font-weight-bold text-left" name="b_Subject" value="${bno.b_Subject }">
  </div>
  
  <textarea row="50" cols="100" class="form-control" name="b_Content">${bno.b_Content }</textarea>
  <button type="submit" class="input-group-prepend btn btn-danger" id="BtnSubmit">수정완료</a></button>  
  
<a href="${root}/board/boardfaq.do" id="BtnSubmit" button type="button" class="input-group-prepend btn btn-danger">목록</a></button>

</form>
</div>
      