<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

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
		<div class="font-weight-bold cycle-background col-12 text-center text-white">
			<span class="cycle-padding"><img class="cycle-img" src="${root}/img/black.png"></span><span>0대</span>
			<span class="cycle-padding"><img class="cycle-img" src="${root}/img/red.png"></span><span>1~3대</span>
			<span class="cycle-padding"><img class="cycle-img" src="${root}/img/orange.png"></span><span>4~6대</span>
			<span class="cycle-padding"><img class="cycle-img" src="${root}/img/green.png"></span><span>7대 이상</span>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div id="map" class="map-rent"></div>
	</div>
</div>


<script type="text/javascript">
//   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
//   var options = { //지도를 생성할 때 필요한 기본 옵션
//     center: new daum.maps.LatLng(37.4994553, 127.02924710000002), //지도의 중심좌표.
//     level: 3
//   //지도의 레벨(확대, 축소 정도)
//   };

//   var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

//   var markerPosition = new daum.maps.LatLng(37.4994553, 127.02924710000002);

//   //마커를 생성합니다
//   var marker = new daum.maps.Marker({
//     position: markerPosition
//   });

//   //마커가 지도 위에 표시되도록 설정합니다
//   marker.setMap(map);

//   //아래 코드는 지도 위의 마커를 제거하는 코드입니다
//   //marker.setMap(null);
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.4994553, 127.02924710000002), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '비트교육센터', 
        latlng: new daum.maps.LatLng(37.4994553, 127.02924710000002),
        image: "${root}/img/black.png"
    },
    {
        title: '생태연못', 
        latlng: new daum.maps.LatLng(37.4994553, 126.02924710000002),
        image: "${root}/img/red.png"
    },
    {
        title: '텃밭', 
        latlng: new daum.maps.LatLng(36.4994553, 127.02924710000002),
        image: "${root}/img/orange.png"
    },
    {
        title: '근린공원',
        latlng: new daum.maps.LatLng(36.8994553, 127.02924710000002),
        image: "${root}/img/green.png"
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(15, 15); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(positions[i].image, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>