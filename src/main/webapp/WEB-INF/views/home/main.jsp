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
	</div>

	<div class="container">
		<div class="row">
			<div class="main-map text-center">
			  <h1 class="map-margin font-weight-bold">추천 코스</h1>
				<div id="map" class="map-recommend rounded"></div>
			</div>
			<div class="main-map text-center">
			<div class="text-center weather-bg border border-secondary rounded">
      <div class="font-weight-bold weather-text">현재 날씨</div>
      <hr class="no-margin">
      <div id="weather"></div>
      </div>
      <div class="text-center weather-bg border border-secondary rounded">
      <div class="font-weight-bold weather-text">미세먼지</div>
      <hr class="no-margin">
      <div id="mise">
      </div>
        <div>
         <div class="return-margin progress">
          <div class="progress-bar bg-success" id="success" role="progressbar"  aria-valuenow="" aria-valuemin="0" aria-valuemax="200"></div>
          <div class="progress-bar bg-warning" id="warning" role="progressbar"  aria-valuenow="" aria-valuemin="0" aria-valuemax="200"></div>
          <div class="progress-bar bg-danger" id="danger" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="200"></div>
       </div>
        <div class="pro-margin-left"><span class="progress-margin">50</span><span class="progress-margin">100</span><span class="progress-margin">150</span><span class="progress-margin">200</span></div>
       </div>
      </div>
      
      
		</div>
	</div>
</div>
</div>

	<script type="text/javascript">
    $(document).ready(function() {
      $('#share').click(function() {
        location.href = '${root}/cycleshare/sharemain.do';

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
$(document).ready(function(){
  //날씨 데이터   
  var url= 'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=83c62b5028f8bad78c5410a0efae908f';
       $.getJSON(url,function(data){
          var sys=data.sys;
          var city =data.name;
          var weather = data.weather;
          var main = data.main;
          var wmain =weather[0].main;
          if(wmain=="Haze"){
            wmain = "안개";
          }else{
            
          }
          var win =weather[0].id;
          var icon = weather[0].icon;
          var country =sys.country;
          var temp = main.temp;
          var temp_min =main.temp_min;
          var temp_max =main.temp_max;
          
          var html = "";
          html += '<div class="text-dark text-center"><div class="text-center"><img class="weather-icon" title="'+wmain+'" alt="'+wmain+'" src="http://api.openweathermap.org/img/w/'+icon +'.png">';
          html += '<span class="font-weight-bold temp-lg-text">'+parseInt(temp-273.15)+' ℃</span></div>';
          html += '<div><span class="temp-md-text">최저온도 </span><span class="return-margin temp-md-text text-primary">'+parseInt(temp_min-273.15)+' ℃</span>';
          html += '<span class="temp-md-text">최고온도 </span><span class="return-margin temp-md-text text-danger">'+parseInt(temp_max-273.15)+' ℃</span></div></div> ';
          $('#weather').append(html);
      });

// 미세먼지 데이터
  var url = 'http://api.airvisual.com/v2/nearest_city?lat=37.5662952&lon=126.97794509999994&rad=1000&key=EEXR8nRPQtm3MpZxK';
  $.getJSON(url,function(data){
    var mise = data.data.current.pollution.aqius;
    var misedata = "";
    var progress;
    misedata += "<div class='return-margin'><span class='temp-md-text font-weight-bold'>미세먼지 </span>:";
    if(mise<=50){
      misedata += "<span class='temp-md-text text-success'> 좋음</span>";
      progress = mise/200*100+"%";
      mise = "<span class='temp-md-text text-success'>"+mise+" </span>";
      $('#success').attr("style","width:"+progress+"");
    }else if(mise<=100){
      misedata += "<span class='temp-md-text text-warning'> 보통</span>";
      progress = mise/200*100+"%";
      mise = "<span class='temp-md-text text-warning'>"+mise+" </span>";
      $('#warning').attr("style","width:"+progress+"");
    }else {
      misedata += "<span class='temp-md-text text-danger'> 나쁨</span>";
      progress = mise/200*100+"%";
      mise = "<span class='temp-md-text text-danger'>"+mise+" </span>";
      $('#danger').attr("style","width:"+progress+"");
    }
    misedata += "</div>";
    misedata += "<div class='return-margin'><span class='temp-md-text font-weight-bold'>미세먼지 농도</span> : ";
    misedata += mise;
    misedata += "</div>";
    $('#mise').append(misedata);
    
    
    
  })
})
    
  </script>