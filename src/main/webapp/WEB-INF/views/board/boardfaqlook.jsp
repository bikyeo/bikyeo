
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />


<div class="container">
  <div class="row board-menu">
      <span class="col-8 h5 font-weight-bold text-left">제목</span>
      <span class="col-2 text-left" >작성자</span>
      <span class="col-2 text-left">날짜</span>  
  </div>
  <div class="row">
    <span class="col-12 h5">${bno.b_Content }</span>
  
  
  </div>

</div>
      