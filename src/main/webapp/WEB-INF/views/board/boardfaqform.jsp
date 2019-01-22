
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
$(document).ready(function(){

  $("#BtnSubmit").on('click',function(){
    location.replace("${root}/board/boardfaq.do")
  }) 
});

</script>
<div class="container">
 <form  action="${root }/board/boardfaqwrite.do" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
  <div class="row board-menu">
   
    <label class="col-2">제목</label>
    <input type="text" class="col-10 h5 font-weight-bold text-left" name="b_Subject" value="${bno.b_Subject }">
  </div>
  <div class="row board-menu">
  
    <label class="col-2">작성자</label>
    <input type="text" class="col-10 h5 font-weight-bold text-left" name="m_Email" value="bikyeo.masters@gamil.com" readonly>
  </div>
  <textarea row="50" cols="100" class="form-control" name="b_Content">${_bno.b_Content }</textarea>
  <button type="submit" class="input-group-prepend btn btn-danger" id="BtnSubmit">등록완료</a></button>
  <a href="${root }/board/boardfaq.do" button type="button" class="input-group-prepend btn btn-danger">목록</a></button>







</form>
</div>
      