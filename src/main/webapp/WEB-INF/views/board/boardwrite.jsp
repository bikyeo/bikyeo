<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<script>
$(document).ready(function(){
  
  $('#Btnwrite').click(function(){
    
    
  
  
});





</script>





<div class="container">
<form id="" action="boardfaq.do" method="GET">
  <h4 class="mb-3 text-center">글작성</h4>
   <div class="row">
	   <label>제목</label>
	   <input type="text" id="title">
   </div>   
 
   <div class="row">  
		<label>작성자</label>
		<input type="text" id="user" value="관리자" readonly>
   </div>

   <div class="row">  
		<label>내용</label>
		<textarea rows="5" id="content" cols="40" name="content" style="resize: none;"></textarea>
   </div>

    <div class="row">  
	    <label>날짜</label>
	    <input type="text" id="regdate">
   </div>
    
    <button id="Btnwrite" class="input-group-prepend btn btn-danger">저장</button>
    
</form>
</div>
      