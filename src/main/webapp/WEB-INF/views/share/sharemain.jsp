<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="text-center container">
	<div class="row">
	
<!-- 		<select class="custom-select col-2" id="search-select"> -->
<!-- 			<option value="0">지역구</option> -->
<!-- 			<option value="1">대여소</option> -->
<!-- 		</select> -->
		<div class="input-group col-12">
			<input type="text" id="cycle-search-text"
				class="input-group form-control" placeholder="지역구를 입력하세요.">
			<button type="button" id="cycle-search"
				class="input-group-prepend btn btn-danger">검색</button>
		</div>
	</div>
	<div class="row">
		<div
			class="font-weight-bold cycle-background col-12 text-center text-white">
			<span class="cycle-padding"><img class="cycle-img"
				src="${root}/img/black.png"></span><span>0대</span> <span
				class="cycle-padding"><img class="cycle-img"
				src="${root}/img/red.png"></span><span>1~3대</span> <span
				class="cycle-padding"><img class="cycle-img"
				src="${root}/img/orange.png"></span><span>4~6대</span> <span
				class="cycle-padding"><img class="cycle-img"
				src="${root}/img/green.png"></span><span>7대 이상</span>

		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div id="map" class="map-rent"></div>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
  var opendMarker;
    function makeClickListener(map, marker, infowindow) {     
      return function() {
        if(opendMarker===infowindow){
          opendMarker.close();
          opendMarker=null;
        }else{
        
        if (opendMarker){ 
          opendMarker.close();
        }
        opendMarker = infowindow;
        infowindow.open(map, marker);
        }
      };
     
  }

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new daum.maps.LatLng(37.5662952, 126.97794509999994), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
map.setZoomable(false);
var imageSize = new daum.maps.Size(15, 15); 
var markerImage;
var markerImage1 = new daum.maps.MarkerImage("${root}/img/green.png", imageSize); 
var markerImage2 = new daum.maps.MarkerImage("${root}/img/orange.png", imageSize); 
var markerImage3 = new daum.maps.MarkerImage("${root}/img/red.png", imageSize); 
var markerImage4 = new daum.maps.MarkerImage("${root}/img/black.png", imageSize); 

//시청기 좌표
  select();
 $('#cycle-search').click(function(){
    var text = $('#cycle-search-text').val();
  
    if('종로구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
          mapOption = { 
          center: new daum.maps.LatLng(37.5729503, 126.97935789999997), // 지도의 중심좌표
          level: 6 // 지도의 확대 레벨
      }; 
      map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      map.setZoomable(false);
      daum.maps.event.addListener(map, 'dragend', function() {           
        select();
      });
      select();      
    
    }else if('강남구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5172363, 127.04732480000007), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  }; 
     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();      

    }else if('도봉구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.6687738, 127.04707059999998), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }else if('노원구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.6541917, 127.05679299999997), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }else if('강북구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.6396099, 127.02565749999997), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }else if('성북구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.589116, 127.01821459999996), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }else if('은평구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.6026957, 126.92911189999995), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('서대문구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5791158, 126.93677890000004), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('중랑구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.6065602, 127.09265189999996), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('동대문구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.57436819999999, 127.04001889999995), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('중구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5640907, 126.99794029999998), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('마포구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5637561, 126.90842109999994), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('용산구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5384272, 126.96544419999998), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('성동구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5633415, 127.03710249999995), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('광진구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5384843, 127.0822938), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('강서구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5509786, 126.84953819999998), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('양천구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5168721, 126.86639850000006), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('영등포구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5263715, 126.89622830000008), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('구로구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.4954031, 126.88736900000004), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('금천구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.4518527, 126.90203580000002), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('동작구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.512402, 126.93925250000007), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('관악구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.4784063, 126.95161329999996), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('서초구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.4837121, 127.03241120000007), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('송파구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5145437, 127.10659710000004), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }
    else if('강동구'==text){
      mapContainer = document.getElementById('map'), // 지도의 중심좌표
      mapOption = { 
      center: new daum.maps.LatLng(37.5301251, 127.12376199999994), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
     }; 

     map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     map.setZoomable(false);
     daum.maps.event.addListener(map, 'dragend', function() {           
       select();
     });
     select();
       
    }else{
      swal("검색어를 다시 입력해주세요.","ex)강남구,종로구","info");
    }
    
  })
//마우스 드래그 이벤트
daum.maps.event.addListener(map, 'dragend', function() {           
  select();
});
function select(){
  var bounds = map.getBounds();
  
  var swLatLng = bounds.getSouthWest(); 
  
  var neLatLng = bounds.getNorthEast(); 
 
  $.ajax({
    url : "${root}/resources/json/cycle.json", // test.jsp 에서 받아옴
    dataType :"json", // 데이터타입을 json 으로 받아옴
    success : function(data) {
      console.log(data);
      $.each(data.DATA,function(index,obj){
        
        if(swLatLng.getLat() < obj.latitude && obj.latitude < neLatLng.getLat()
                && swLatLng.getLng() < obj.longitude && obj.longitude < neLatLng.getLng()){
          var p_Num = obj.content_id;

          // 지도에 마커를 표시합니다 
          var marker = new daum.maps.Marker({ 
              position: new daum.maps.LatLng(obj.latitude,obj.longitude)
          });
          var remove=true;
          var content = "";
          content += '<div class="text-center ma-bottom"><br>';
          content += '<div class="title-cycle rent-mabottom rent-subject">'+obj.content_nm+'</div>';
          content += '<hr class="no-margin">'; 
          $.ajax({
            url : "${root}/cycle/cycle.do", // test.jsp 에서 받아옴
            data: {
              "p_Num":p_Num
                    },
            type: "GET",
            dataType :"json", // 데이터타입을 json 으로 받아옴
            success : function(data) {
              var cyclecount;
              $.each(data,function(index,obj){
                cyclecount = obj.cyclecount;
                if(obj.cyclecount==0){
                  markerImage = markerImage4;
                }else if(obj.cyclecount <=3){
                  markerImage = markerImage3;
                }else if(obj.cyclecount <=7){
                  markerImage = markerImage2;
                }else{
                  markerImage = markerImage1;
                }
                marker.setImage(markerImage);
                marker.setMap(map);
                index *= 1;
                index = index+1;
                if(obj.cyclecount>=1){
                content += '<div><span class="rent-margin">'+ index +' 번 자전거</span>';
                if(obj.c_Status == 0){
                content += '<span><button type="button" class="btn btn-primary rent-button" name="c_Code" p_Num="'+obj.p_Num+'" c_Code="'+obj.c_Code+'">대여</button></span></div>';    
                }else{
                  content += '<span><button type="button" class="btn btn-danger rent-button rented-button" disabled>대여중</button></span></div>'; 
                }
                }
                  
              })
              content += '<hr class="rent-mabottom">'; 
              content += '<div><span class="rent-margin font-weight-bold">대여가능 자전거 : '+ cyclecount +' / 20</span></div>'
              content += '</div>';
              var infowindow = new daum.maps.InfoWindow({
                content: content,
                removable: remove// 인포윈도우에 표시할 내용
              });
              daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow)); 
            }
          })
     
        }
      })
    }
  })  
}  

// 마커 이미지를 생성합니다

 
 $(document).on("click", "button[name='c_Code']", function() {
   var check = '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}';
   if(check ==""){
     swal("로그인 후 이용해주세요.","","info");
     return false; 
   }
   var c_Code = $(this).attr('c_code');
   var p_Num = $(this).attr('p_Num');
   $('#exampleModalLabel').attr('class','font-weight-bold');
   $('#exampleModalLabel').text('자전거 대여');
   $('.modal-body').text('');
   var time = new Date(); 
   var pmam;
   var rentHour;
   var rentday;
   var rent_data;
   var currentTime;
   var returnTime;
   var pay;
   $(document).on("change","#rent-time",function(){
    
     $('.return-time').remove();
     rentHour = time.getHours()*1 + $('#rent-time').val()*1;
     rentday = "오늘";
     if(rentHour >= 24){
       rentHour = rentHour -24;
       rentday = "익일";
       pmam="AM";
     }else if(rentHour >= 13){
       rentHour = rentHour-12;
       pmam="PM";
     }else if(rentHour == 12){
       pmam="PM";
     }else if(rentHour <= 12){
       pmam="AM";
     }else if($('#rent-time').val().trim()=="no-time"){
       Swal({
         title: '시간을 선택해주세요.',
         type: 'warning',
         confirmButtonText: '확인'
       }).then((result) => {
         if (result.value) {
           $('.return-time').remove();
         }
       }) 
     }
     pay = $('#rent-time').val()*1*1000;
     currentTime = rentday+' '+ rentHour+':'+ time.getMinutes() + pmam;
     
     returnTime = '<div class="text-center return-margin return-time"><span class="returnInfo font-weight-bold">반납 예정시간</span>'+currentTime+'</div>';
     returnTime += '<div class="text-center return-margin return-time"><span class="payInfo font-weight-bold">결제금액</span>'+pay+' 원</div>';
     $('.modal-body').append(returnTime);
   })
   var html = "";
   html += '<div class="text-center return-margin">'
   html += '<span class="cycle-padding font-weight-bold">대여 시간</span>';
   html += '<select class="custom-select selectInfo" id="rent-time">';
   html += '<option value="no-time">시간</value>';
   html += '<option value="1">1시간</value>';
   html += '<option value="2">2시간</value>';
   html += '<option value="3">3시간</value>';
   html += '<option value="4">4시간</value>';
   html += '<option value="5">5시간</value>';
   html += '<option value="6">6시간</value>';
   html += '<option value="7">7시간</value>';
   html += '<option value="8">8시간</value>';
   html += '<option value="9">9시간</value>';
   html += '<option value="10">10시간</value>';
   html += '<option value="11">11시간</value>';
   html += '<option value="12">12시간</value>';
   html += '</select>';
   html += '</div>';
   $('.modal-body').append(html);
   $('.left-side').children().attr('id','rent');
   $('.left-side').children().text('대여하기');
   $('.right-side').children().attr('data-dismiss','modal');
   $('.right-side').children().text('취소');
   $('#myModal').modal('show');
   
   $(document).on("click", "#rent", function() {
    if($('#rent-time').val()=='no-time'){
      swal("시간을 선택해주세요.","","warning");
    }else{
      var m_Phone;
      var m_Name;
      var m_Email;
      $.ajax({
        url : "${root}/member/info.do", // test.jsp 에서 받아옴
        type: "GET",
        dataType :"json", // 데이터타입을 json 으로 받아옴
        success : function(data) {
          m_Phone = data.m_Phone;
          m_Name = data.m_Name;
          m_Email = data.m_Email;
 
        //카카오 페이
          IMP.init('imp31057577');
          IMP.request_pay({
              pg : 'kakaopay',
              pay_method : 'card',
              merchant_uid : 'merchant_' + new Date().getTime(),
              name : '자전거대여',
              amount : pay,
              buyer_email : m_Email,
              buyer_name : m_Name,
              buyer_tel : m_Phone,
          }, function(rsp) {
              if ( rsp.success ) {
                   rent_data = {"c_Code" : c_Code,
                           "p_Num" : p_Num,
                           "rent_hour":$('#rent-time').val(),
                           "paymentDto" : {
                             "sp_Pay":rsp.paid_amount
                             }
                           };
                  $.ajax({
                     url : "${root}/cycleshare/cycle.do", 
                     data: JSON.stringify(rent_data),
                     contentType: "application/json;charset=utf-8",
                     dateType:"json",
                     beforeSend: function(xhr) {
                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                     },
                     type: "POST",
                     success : function(data) {
                       if(data ==1){
                       Swal({
                         title:'대여에 성공하셨습니다.',
                         text: '반납예정시간 : '+currentTime,
                         type: 'success',
                         confirmButtonText: '확인'
                       }).then((result) => {
                         if (result.value) {
                           location.href="${root}/cycleshare/sharemain.do";
                         }
                       })
                       }else{
                         swal("대여에 실패하였습니다.","","info");
                       } 
                       },
                       error:function(request, status, error) {
                         swal("대여에 실패하였습니다.","","error");

                       }

                     })           
              } else {
                swal("대여에 실패하였습니다.","","error");
              }

          });
        }
      })

    }
   })
   
 })
 
 
})
//자동 완성 기능

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + " autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + " autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var districts = ["도봉구","노원구","강북구","성북구","중랑구",
                 "은평구","종로구","서대문구","중구","동대문구",
                 "성동구","광진구","용산구","마포구","강서구",
                 "양천구","영등포구","구로구","금천구","동작구",
                 "관악구","서초구","강남구","송파구","강동구"];
/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("cycle-search-text"), districts);

 </script>
