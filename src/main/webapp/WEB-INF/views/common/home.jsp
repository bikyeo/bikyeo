<!-- 
파일명 : home.jsp
작성일 : 19.01.10
작성자 : 염승민
설명 : 일반 페이지 타일즈 템플릿
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- title 영역 -->

<title><tiles:insertAttribute name="title" /></title>
<link rel="icon" type="image/png" href="${root}/img/bicycle.ico" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${root}/img/apple-icon.png" />
<!-- Bootstrap core CSS     -->
<link href="${root}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${root}/css/paper-kit.css?v=2.1.0" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="${root}/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700'
	rel='stylesheet' type='text/css' />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="${root}/css/nucleo-icons.css" rel="stylesheet" />
<script src="${root}/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${root}/js/jquery-ui-1.12.1.custom.min.js"
	type="text/javascript"></script>
<script src="${root}/js/popper.js" type="text/javascript"></script>
<script src="${root}/js/bootstrap.min.js" type="text/javascript"></script>

<!-- Switches -->
<script src="${root}/js/bootstrap-switch.min.js"></script>

<!--  Plugins for Slider -->
<script src="${root}/js/nouislider.js"></script>

<!--  Plugins for DateTimePicker -->
<script src="${root}/js/moment.min.js"></script>
<script src="${root}/js/bootstrap-datetimepicker.min.js"></script>

<!--  Paper Kit Initialization and functons -->
<script src="${root}/js/paper-kit.js?v=2.1.0"></script>

<!-- SweetAlert2 -->
<script src="${root}/sw2/sweetalert2.all.min.js"></script>
<script src="${root}/sw2/sweetalert2.min.js"></script>

<link rel="stylesheet" href="${root}/sw2/sweetalert2.min.css" />
<!--  각자 커스텀 css -->
<link rel="stylesheet" href="${root}/css/kw.css" />
<link rel="stylesheet" href="${root}/css/sm.css" />
<link rel="stylesheet" href="${root}/css/mk.css" />


<!-- 맵 api script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bac65a1ad27df9cef7f991882677d17"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bac65a1ad27df9cef7f991882677d17&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bac65a1ad27df9cef7f991882677d17&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bac65a1ad27df9cef7f991882677d17&libraries=services,clusterer,drawing"></script>
<!-- 카카오 로그인 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 네이버 로그인 api -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 카카오 페이 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body class="body-margin">
	<!-- Header  영역 -->
	<tiles:insertAttribute name="header" />
	<!-- Main 영역 -->
	<!-- Content 영역 -->
	<tiles:insertAttribute name="content" />

	<!-- Footer 영역  -->
	<tiles:insertAttribute name="footer" />
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
  aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">Modal
          title</h5>
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">Far far away, behind the word
        mountains, far from the countries Vokalia and Consonantia, there
        live the blind texts. Separated they live in Bookmarksgrove right at
        the coast of the Semantics, a large language ocean. A small river
        named Duden flows by their place and supplies it with the necessary
        regelialia. It is a paradisematic country, in which roasted parts of
        sentences fly into your mouth. Even the all-powerful Pointing has no
        control about the blind texts it is an almost unorthographic life
        One day however a small line of blind text by the name of Lorem
        Ipsum decided to leave for the far World of Grammar.</div>
      <div class="modal-footer">
        <div class="left-side">
          <button type="button" class="btn btn-default btn-link">Never mind</button>
        </div>
        <div class="divider"></div>
        <div class="right-side">
          <button type="button" class="btn btn-danger btn-link">Delete</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>

</html>