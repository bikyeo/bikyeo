<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="text-center container">
	<div class="row">
		<select class="custom-select col-2">
			<option>지역구</option>
			<option>대여소</option>
		</select>
		<div class="input-group col-10 search-padding">
			<input type="text" class="input-group form-control" placeholder="검색창">
			<button type="button" class="input-group-prepend btn btn-danger">검색</button>
		</div>
	</div>
	<div class="row">
		<div class="font-weight-bold cycle-background col-12 text-center">
			<span class="img-circle bg-dark text-white bg-circle">0대</span> <span
				class="img-circle bg-red text-dark bg-circle">1~3대</span> <span
				class="img-circle bg-orange text-dark bg-circle">4~6대</span> <span
				class="img-circle bg-green text-dark bg-circle">7대 이상</span>

		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div id="map" class="map-rent"></div>
	</div>
</div>


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