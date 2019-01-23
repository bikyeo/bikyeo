
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />



<div class="container">
 
  <div class="row title h1">
 FAQ
 </div>
 
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
<hr class="faq-border">

<div id="accordion" role="tablist">
  <c:forEach var="list" items="${list}">  
	  <div class="row board-list">
	    <div class="col-1 font-weight-bold text-left">Q</div>
	    <div class="col-11 text-left" role="tab" id="headingOne">
	     <a data-toggle="collapse" href="#acc${list.b_Num }" aria-expanded="true" aria-controls="collapseOne">
	       ${list.b_Subject }
	     </a>    
	    </div>
	    
	    <div id="acc${list.b_Num }" class="col-12 text-center collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
	       <div class="col-10 text-left">	         
	         ${list.b_Content}	         
	       </div>
	       <div class="col-10 text-right">
	         <a href="${root}/board/boardfaqlook.do?b_Num=${list.b_Num }" button type="button" class="btn btn-link btn-default">수정</a></button>      
	       </div> 
	    </div>
	  </div>  
  </c:forEach>
</div>
<a href="${root}/board/boardfaqform.do" button type="button" class="btn btn-link btn-default">글쓰기</a></button>


</div>


