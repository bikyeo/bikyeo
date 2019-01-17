
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />


<div class="container">
  <div class="row board-menu">
      <span class="col-10 h5 font-weight-bold text-left">${bno.b_Subject }</span>
      <span class="col-2 text-left">${bno.b_Regdate }</span>  
  </div>
  <div class="row">
    <span class="col-12 h5">${bno.b_Content }</span>
  
  
  </div>
<a href="${root}/board/boardfaq.do" button type="button" class="input-group-prepend btn btn-danger">목록</a></button>
</div>
      