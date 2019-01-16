<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


<div class="container background-color: #819FF7;">

	<div class="row">
		<select class="custom-select col-3">
		  <option value="개요">개요</option>
      <option value="이용방법">이용방법</option>
      <option value="홈페이지">홈페이지</option>
      <option value="결제">결제</option>
      <option value="대여소">대여소</option>
      <option value="단말기">단말기</option>
      <option value="자전거">자전거</option>   
		  <option selected="selected">FAQ질문 선택</option>
		</select>
	<div class="input-group col-9">
      <input type="text" class="input-group form-control" placeholder="질문을 입력해주세요">		 
			   <button type="button" class="input-group-prepend btn btn-danger">검색</button>		  
	</div>
  </div>  
  <br>

   <div class="row menu-background"> 
		    <span class="col-2 text-left">글번호</span>
		    <span class="col-5 text-center">질문</span>
		    <span class="col-5 text-center">답변</span>   
  </div>
<c:forEach var="list" items="${list}">  
  <div class="row">
 
    <span class="col-2 foreachlistcolor text-left input-group-addon">${list.b_Num }</span>
    <span class="col-5 foreachlist text-center input-group-addon">${list.b_Subject }</span>
    <span class="col-5 text-center input-group-addon">${list.b_Content }</span>
    
  </div>
</c:forEach>

</div>
<a href="${root}/board/boardwrite.do" button type="button" class="input-group-prepend btn btn-danger">글쓰기</a></button>

