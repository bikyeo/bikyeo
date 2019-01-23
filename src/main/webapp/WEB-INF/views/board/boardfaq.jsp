
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />



<div class="container">
 
  <div class="row title h1">
 FAQ
 </div>
   
  <br>
<hr class="faq-border">

<div id="accordion" role="tablist">
  <c:forEach var="list" items="${list}">  
	  <div class="row board-list">
	    <div class="col-1 font-weight-bold text-left">Q</div>
	    <div class="col-11 text-left" role="tab" id="headingOne">
	     <a data-toggle="collapse" class="text-dark accor" href="#acc${list.b_Num }" aria-expanded="true" aria-controls="collapseOne">
	       ${list.b_Subject}
	     </a>    
	    </div>
	    
	    <div id="acc${list.b_Num }" class="faq-text col-12 text-center collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
	       <div class="text-left">	         
	         ${list.b_Content}	         
	       </div>
	       <div class="col-10 text-right">
           <sec:authorize access="hasRole('ROLE_ADMIN')">	       
	         <a href="${root}/board/boardfaqlook.do?b_Num=${list.b_Num }"><button type="button" class="btn btn-danger">수정</button></a>     
	         </sec:authorize>
	       </div> 
	    </div>
	  </div>  
  </c:forEach>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="${root}/board/boardfaqform.do"><button type="button" class="btn btn-danger">글쓰기</button></a>
</sec:authorize>

</div>

<script type="text/javascript">
$(document).ready(function(){
  $('.accor').click(function(){
    if($(this).attr('class').substring(0,16)=='font-weight-bold'){
      $('.accor').attr('class','accor text-dark');
      $(this).attr('class','accor text-dark');  
    }
    else{
      $('.accor').attr('class','accor text-dark');
      $(this).attr('class','font-weight-bold accor text-dark');
    }
  })
  
})


</script>
