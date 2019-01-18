<!-- 
파일명 : footer.jsp
작성일 : 19.01.10
작성자 : 송기원
설명 : 일반 페이지 푸터 부분
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
    
 <footer class="footer">
        <div class="container">
            <div class="row">
                <nav class="footer-nav">
                    <ul>
                        <li><a href="${root}/index.do">Team Bikyeo</a></li>
                    </ul>
                </nav>
                <div class="credits ml-auto">
                    <span class="copyright">
                        © <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by Bikyeo
                    </span>
                </div>
            </div>
        </div>
    </footer>