<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


<div class="container" style="height: auto; width: 100%; border:1px solid black;">
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
  
    <div class="row" style="heigth:auto; width:100%;">
    <span class="col-4">글번호</span>
    <span class="col-4">질문</span>
    <span class="col-4">답변</span>

  </div>
  <div class="row">
    <span class="col-4">1</span>
    <span class="col-4">따릉이가 뭔가요?</span>
    <span class="col-4">자전거입니다.</span>
  </div>
  <div class="row">
    <span class="col-4">2</span>
    <span class="col-4">이달 예산은 충분한가요?</span>
    <span class="col-4">아뇨</span>
  </div>
</div>

