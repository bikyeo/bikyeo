<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>

<div class="container">
  <div class="row">
    <select class="custom-select col-3">
      <option value="개요">개요</option>
      <option value="이용방법">이용방법</option>
      <option value="홈페이지">홈페이지</option>
      <option value="결제">결제</option>
      <option value="대여소">대여소</option>
      <option value="단말기">단말기</option>
      <option value="자전거">자전거</option>   
      <option selected="selected">QNA질문 선택</option>
    </select>
    <div class="input-group col-9">
      <input type="text" class="input-group form-control" placeholder="질문을 입력해주세요">    
      <button type="button" class="input-group-prepend btn btn-danger">검색</button>
    </div>
  </div>

  <div class="row">
    <span class="col-4">글번호</span>
    <span class="col-4">질문</span>
    <span class="col-4">답변상황</span>

  </div>
  <div class="row">
    <span class="col-4">1</span>
    <span class="col-4">행복구에 대여소를 설치할 예정이 있나요?</span>
    <span class="col-4">답변완료</span>
  </div>
  <div class="row">
    <span class="col-4">2</span>
    <span class="col-4">이달 예산은 충분한가요?</span>
    <span class="col-4">대기 중</span>
  </div>
</div>

  
    
    
    
    
    

    
    
    

</body>
</html>