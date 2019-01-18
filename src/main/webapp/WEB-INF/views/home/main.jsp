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
			  <div class="border border-secondary rounded">
			  <h1 class="map-margin font-weight-bold">추천 코스</h1>
			  <hr class="no-margin">
			  <div id="course"></div>
				<div id="map" class="map-recommend rounded"></div>
				</div>
			</div>
			<div class="main-map text-center weather-margin">
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
//반납하기     
      
      var msg = '${msg}';
      
      if(msg == 'success') {
        Swal({
          type: 'success',
          title: '인증 완료',
          html: '인증이 완료되었습니다.',
          confirmButtonColor: '#3085d6',
          confirmButtonText: '확인'
        });
      }
      $('#share').click(function() {
        location.href = '${root}/cycleshare/sharemain.do';

      })

      $('#return').click(function() {
        var check = '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}';
        if(check ==""){
          swal("로그인 후 이용해주세요.","","info");
          return false; 
        }
        
        var html="";
        var placenum;
        var placearray=[];
        var indexcycle;
        var c_Code;
        var placename;
        var placenamearray=[];
        
        
        $.ajax({
          url : "${root}/cycleshare/return.do", 
          contentType: "application/json;charset=utf-8",
          dateType:"json",
          beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          type: "GET",
          success : function(data) {
            if(data.length != 0){
            $('#exampleModalLabel').attr('class','font-weight-bold');
            $('#exampleModalLabel').text('대여중인 자전거');
            $('.modal-body').text('');
            html += '<span class="return-margin">반납할 자전거 : </span>';
            html += '<select class="custom-select return-margin" id="return-select">';                           
            $.each(data,function(index,obj){
             placearray.push(obj.p_Num*1);
             placenum = obj.p_Num*1;
             indexcycle = obj.c_Code.substring(5,7);
             c_Code = obj.c_Code;   
             html += '<option value="'+c_Code+'"> '+indexcycle+' 번 자전거</option>';                         
            })
            html +='</select>';
            $('.modal-body').append(html);
            var k = placearray.length;
            var url = "${root}/resources/json/cycle.json";
              $.getJSON(url,function(data){
              for(var i=0;i < k;i++){
                for(var j=0; j< data.DATA.length;j++){
                  if(placearray[i]==data.DATA[j].content_id){
                    placenamearray.push(data.DATA[j].content_nm);
                    break;
                  }
                }
              }
              for(var i=0;i < k;i++){ 
              $('#return-select').find('option').eq(i).prepend(placenamearray[i]);
              }
             })
            $('.modal-body').append('<br><span class="return-margin">반납할 지역구 : </span>');
            html = '<select class="custom-select return-margin" id="return-district">'; 
            html += '<option value="no-data">지역구</option>';
            var districts = ["도봉구","노원구","강북구","성북구","중랑구",
              "은평구","종로구","서대문구","중구","동대문구",
              "성동구","광진구","용산구","마포구","강서구",
              "양천구","영등포구","구로구","금천구","동작구",
              "관악구","서초구","강남구","송파구","강동구"];
            for(var i =0;i < districts.length;i++){
            html += '<option value="'+i+'">'+districts[i]+'</option>';
            };
            html += '</select>';
            $('.modal-body').append(html);
            
            html = '<br><span class="return-margin">반납할 대여소 : </span>';
            html += '<select class="custom-select return-margin" id="return-place">';
            html += '<option>대여소명</option>';
            $('.modal-body').append(html);
            
            $('#return-district').on('change',function(){
              $('#return-place').empty();
              $('#return-place').append('<option>대여소명</option>');
              
              var district = districts[$('#return-district').val()];
              
              var url = "${root}/resources/json/cycle.json";
              $.getJSON(url,function(data){
              
                $.each(data.DATA,function(index,obj){
                  if(district == obj.addr_gu){
                    $('#return-place').append('<option value="'+obj.content_id+'">'+obj.content_nm+'</option>');
                  }
                  
                })
              })
              
            })
            
            $('#return-place').on('change',function(){
              var place = $(this);
              var placeval = place.val();
              var placedata = {"c_Move":place.val()};
              $.ajax({
                type: "POST",
                url : "${root}/cycle/placecheck.do", 
                data : JSON.stringify(placedata),
                contentType: "application/json;charset=utf-8",
                dateType:"json",
                beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success : function(data) {
                  console.log(data);
                  if(data >= 20){
                    Swal({
                      title:'자전거를 반납할 수 없습니다.',
                      text: '대여소에 자전거가 모두 차있습니다.',
                      type: 'error',
                      confirmButtonText: '확인'
                    }).then((result) => {
                      if (result.value) {
                        place.empty();
                        place.append('<option>대여소명</option>');
                        
                      }
                      $('#return-district').val('no-data');
                     
                    })
                    
                  }
                  
                }
                
              })
              $('#return-district').focus();
            })
            
            
            $('.left-side').children().attr('id','return-submit');
            $('.left-side').children().text('반납하기');
            $('.right-side').children().attr('data-dismiss','modal');
            $('.right-side').children().text('취소');
            
            $('#myModal').modal('show');
            }else{
              Swal('대여중인 자전거가 없습니다.', '', 'info');
                     
            }
          }
        })
        
      })

      
      $(document).on('click','#return-submit',function(){
        if($('#return-district').val()=="no-data"){
          swal("지역구를 선택해주세요.","","info");    
        } else if($('#return-place').val()=="대여소명"){
          swal("대여소를 선택해주세요.","","info");
        }else{
        var data = { "c_Code": $('#return-select').val(),
                     "c_Move": $('#return-place').val()
                     };
        console.log(data);
        
        $.ajax({
          url : "${root}/cycleshare/return.do",
          data : JSON.stringify(data),
          beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          contentType: "application/json;charset=utf-8",
          dateType:"json",   
          type: "PUT",
          success : function(data) {
            console.log(data);
            var time = new Date();
            var pmam;
            var hour=time.getHours()*1;
            var rentday;
            var rent_data;
            var currentTime;
            if(time.getHours()*1 >= 13){
              hour = time.getHours()*-12;
              pmam = "PM";
            }else if(time.getHours()*1 == 12){
              pmam = "PM";
            }else if(time.getHours()*1 <= 12){
              pmam = "AM";
            }
            currentTime = hour+':'+ time.getMinutes() + pmam;
            if(data>0){
              Swal({
                title:'반납에 성공하셨습니다.',
                text: '반납시간 : '+currentTime,
                type: 'success',
                confirmButtonText: '확인'
              }).then((result) => {
                if (result.value) {
                  location.href="${root}/index.do";
                }
              })
              
            }else{
              swal("반납에 실패하였습니다.","","error");
            }
          }
        })
        }
      
      })
      
      
    })
  </script>
	<script type="text/javascript">
	var status = '${param.status}'
	if(status == 'logout'){
    Swal({
      type: 'info',
      title: '로그아웃',
      html: '성공적으로 로그아웃 되었습니다.<br>다음에 또 이용해주세요.'
    });
  }
//추천코스 
//여의도 중심 37.5215695, 126.92731149999993
//월드컵 상암코스 37.57199999999, 126.893999997
//청계천 코스 37.5745263, 126.9877290000006
var mapContainer ;
var random = Math.round(Math.random()*2)

var place1=[];
if(random==0){
  place1.push(new daum.maps.LatLng(37.5215695, 126.92431149999993));
  place1.push(new daum.maps.LatLng(37.518436, 126.92037979999998));
  place1.push(new daum.maps.LatLng(37.5193776, 126.94021029999999));
  place1.push(new daum.maps.LatLng(37.5284017, 126.93430119999994));
  place1.push(new daum.maps.LatLng(37.523816, 126.91891599999997));
  mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = { 
      center: new daum.maps.LatLng(37.5215695, 126.92731149999993), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  };
  $('#course').append('여의도 코스');
}else if(random==1){
  place1.push(new daum.maps.LatLng(37.56965599999999, 126.89905799999997));
  place1.push(new daum.maps.LatLng(37.5623116, 126.89510459999997));
  place1.push(new daum.maps.LatLng(37.5674467, 126.88545499999998));
  place1.push(new daum.maps.LatLng(37.5722114, 126.88606159999995));
  place1.push(new daum.maps.LatLng(37.579203, 126.88929600000006));
  mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = { 
      center: new daum.maps.LatLng(37.57199999999, 126.893999997), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  };
  $('#course').append('상암 코스');
}else if(random==2){
  place1.push(new daum.maps.LatLng(37.5705263, 126.97657290000006));
  place1.push(new daum.maps.LatLng(37.5794091, 126.98036909999996));
  place1.push(new daum.maps.LatLng(37.579617, 126.97704099999999));
  place1.push(new daum.maps.LatLng(37.5658049, 126.97514610000007));
  place1.push(new daum.maps.LatLng(37.5687861, 126.97925250000003));
  place1.push(new daum.maps.LatLng(37.5698006, 127.00168180000003));
  mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = { 
      center: new daum.maps.LatLng(37.5745263, 126.9877290000006), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  };
  $('#course').append('청계천 코스');
}
               
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
map.setZoomable(false);
var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
// daum.maps.event.addListener(map, 'click', function(mouseEvent) {
$(document).ready(function(){
    // 마우스로 클릭한 위치입니다 
//     var clickPosition = mouseEvent.latLng;
    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
//     if (!drawingFlag) {

        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
//         drawingFlag = true;
        
        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
        deleteClickLine();
        
        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
        deleteDistnce();
       
            
        var recommend = [];
        deleteCircleDot();
        clickLine = new daum.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [place1[0]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
        moveLine = new daum.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다    
        });
    
        // 클릭한 지점에 대한 정보를 지도에 표시합니다
        displayCircleDot(place1[0], 0);

            
//     } else { // 선이 그려지고 있는 상태이면

        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
        for(var i=0;i < place1.length-1;i++){
        var path = clickLine.getPath();

        // 좌표 배열에 클릭한 위치를 추가합니다
        path.push(place1[i+1]);
        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
        // 그려진 선의 거리정보를 지도에 표시합니다
        showDistance(content, path[path.length-1]);  
        displayCircleDot(place1[i+1], distance);
        }
//         console.log(clickLine.getPath());
//     }
});
    
       

// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
function showDistance(content, position) {
  var place1dis = new daum.maps.LatLng(37.517, 126.91891599999997);
  var place2dis = new daum.maps.LatLng(37.57899999999, 126.893999997);
  var place3dis = new daum.maps.LatLng(37.5745263, 126.9877290000006);
  
    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
      var place1 = new daum.maps.LatLng(37.523816, 126.91891599999997);
      var place2 = new daum.maps.LatLng(37.579203, 126.88929600000006);
      var place3 = new daum.maps.LatLng(37.5698006, 127.00168180000003);
     distanceOverlay.setContent(content);       
       if(position.jb == place1.jb){
        distanceOverlay.setPosition(place1dis);
       
        }else if(position.jb == place2.jb){
          distanceOverlay.setPosition(place2dis);
        }else if(position.jb == place3.jb){
          distanceOverlay.setPosition(place3dis);
        }        
    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
        
        // 커스텀 오버레이를 생성하고 지도에 표시합니다
        distanceOverlay = new daum.maps.CustomOverlay({
            map: map, // 커스텀오버레이를 표시할 지도입니다
            content: content,  // 커스텀오버레이에 표시할 내용입니다
            position: position, // 커스텀오버레이를 표시할 위치입니다.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3  
        });      
    }
}

// 그려지고 있는 선의 총거리 정보와 
// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
function displayCircleDot(position, distance) {

    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
    var circleOverlay = new daum.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // 지도에 표시합니다
    circleOverlay.setMap(map);
    if(distance==0){
      var distanceOverlay = new daum.maps.CustomOverlay({
        content: '<div class="dotOverlay font-weight-bold">출발위치</div>',
        position: position,
        yAnchor: 1,
        zIndex: 2
    });

    // 지도에 표시합니다
    distanceOverlay.setMap(map);
    
    }
    
    if (distance > 0) {
        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
        var distanceOverlay = new daum.maps.CustomOverlay({
            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // 지도에 표시합니다
        distanceOverlay.setMap(map);
    }

    // 배열에 추가합니다
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
// HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
    var bycicleTime = distance / 227 | 0;
    var bycicleHour = '', bycicleMin = '';

    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '<li>';
    content += '<span class="text-dark label">총거리</span><span class="number">' + distance + '</span> m';
    content += '</li>';
    content += '<li>';
    content += '<span class="distInfo text-dark label">자전거</span>' + bycicleHour + bycicleMin;
    content += '</li>';
    content += '</ul>'

    return content;
}
	
	
	
$(document).ready(function(){
  //날씨 데이터   
  var url= 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=83c62b5028f8bad78c5410a0efae908f';
       $.getJSON(url,function(data){
          var sys=data.sys;
          var city =data.name;
          var weather = data.weather;
          var main = data.main;
          var wmain =weather[0].main;
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
  var url = 'http://api.airvisual.com/v2/nearest_city?lat=37.5662952&lon=126.97794509999994&rad=500&key=EEXR8nRPQtm3MpZxK';
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