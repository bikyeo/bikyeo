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
		<select class="form-control col-3">
		  <option value="개요">개요</option>
      <option value="이용방법">이용방법</option>
      <option value="홈페이지">홈페이지</option>
      <option value="결제">결제</option>
      <option value="대여소">대여소</option>
      <option value="단말기">단말기</option>
      <option value="자전거">자전거</option>   
		  <option selected="selected">질문 선택</option>
		</select>
	<div class="input-group col-9">
      <input type="text" class="input-group form-control" placeholder="질문을 입력해주세요">		 
			<div class="form-group">
			   <button type="button" class="input-group-prepend btn btn-danger">검색</button>
			</div>  
		</div>
		
  <table class="table">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">질문</th>
      <th scope="col">답변</th>
    </tr>
  </thead>
    <tbody>
      <th scope="row">1</th>
        <td>자전거가 돈을 먹었습니다.</td>
        <td>구청에 문의하세요.</td>
        <tr>
      <th scope="row">2</th>
	      <td>따릉이가 뭔가요?</td>
	      <td>자전거입니다.</td>
	      <tr> 
    </tbody>
  
  
  </table>		
		
		
		
		
  </div>  
</div>
  

</body>
</html>