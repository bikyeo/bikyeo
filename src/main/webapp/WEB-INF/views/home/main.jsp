<!-- 
파일명 : main.jsp
작성일 : 19.01.09
작성자 : 송기원
설명 : 인덱스 main페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


<div class="wrapper">
	<div class="page-header section-dark"
		style="background-image: url('${root}/img/background.jpg')">
		<div class="filter"></div>
		<div class="content-center">
			<div class="container">
				<div class="title-brand">
					<p class="presentation-title main-text">Bikyeo</p>
				</div>
				<div class="text-center">
					<button class="main-button btn btn-success" id="share">대여하기</button>

					<button class="main-button btn btn-danger" id="return">반납하기</button>
				</div>
				<h2 class="presentation-subtitle text-center"></h2>
			</div>
		</div>
		<h6 class="category category-absolute">Designed and coded by
			Bikyeo</h6>
	</div>

	<div class="container">
		<div class="row">
			<div class="main-map">
			  <h1>추천 코스</h1>
				<div id="map" class="map-recommend"></div>
			</div>

		</div>
	</div>
</div>

	<script type="text/javascript">
    $(document).ready(function() {
      $('#share').click(function() {
        location.href = '${root}/cycle/sharemain.do';

      })

      $('#return').click(function() {
        Swal('Good job!', 'You clicked the button!', 'success')
        $('#myModal').modal('show');

      })

    })
  </script>
	<script type="text/javascript">
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
      center: new daum.maps.LatLng(37.4994553, 127.02924710000002), //지도의 중심좌표.
      level: 3
    //지도의 레벨(확대, 축소 정도)
    };

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

    var markerPosition = new daum.maps.LatLng(37.4994553, 127.02924710000002);

    //마커를 생성합니다
    var marker = new daum.maps.Marker({
      position: markerPosition
    });

    //마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    //아래 코드는 지도 위의 마커를 제거하는 코드입니다
    //marker.setMap(null);
  </script>