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
    
  <table class="table">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">질문</th>
      <th scope="col">답변상황</th>
    </tr>
  </thead>
    <tbody>
      <th scope="row">1</th>
        <td>행복구에 대여소 설치 예정이 있나요?</td>
        <td>대기 중</td>
        <tr>
      <th scope="row">2</th>
        <td>낙원동 대여소 수리를 해주세요.</td>
        <td>응답완료</td>
        <tr> 
    </tbody>
  
  
  </table>    
    
    
    
    
  </div>  
</div>
  

</body>
</html>