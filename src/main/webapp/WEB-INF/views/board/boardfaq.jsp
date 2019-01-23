
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
	       <div class="col-12 text-right">
           <sec:authorize access="hasRole('ROLE_ADMIN')">	       
	         <a href="${root}/board/boardfaqlook.do?b_Num=${list.b_Num }"><button type="button" class="btn btn-danger">수정</button></a>
	         <button type="button" class="btn btn-danger deleteBtn" b_num="${list.b_Num }">삭제</button>
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
  });
  $('.deleteBtn').click(function() {
    var b_Num = $(this).attr('b_Num');
    Swal({
      type: 'info',
      title: 'FAQ삭제',
      html: '글을 삭제하시겠습니까?',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      confirmButtonText: '확인',
      cancelButtonColor:'#d33',
      cancelButtonText:'취소'
    }).then(function (result) {
      if(result.value){
        var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");  //Post 방식
        form.setAttribute("action", "${root}/board/delete.do?b_Num=" + b_Num); //요청 보낼 주소

        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "${_csrf.parameterName}");
        hiddenField.setAttribute("value", "${_csrf.token}");
        form.appendChild(hiddenField);
        
        document.body.appendChild(form);
        form.submit();
      }
    });
   
  });
  
})


</script>
