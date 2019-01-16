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
        center: new daum.maps.LatLng(37.4994553, 127.02924710000002), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSize = new daum.maps.Size(15, 15); 

// 마커 이미지를 생성합니다
var markerImage;
var markerImage1 = new daum.maps.MarkerImage("${root}/img/green.png", imageSize); 
var markerImage2 = new daum.maps.MarkerImage("${root}/img/orange.png", imageSize); 
var markerImage3 = new daum.maps.MarkerImage("${root}/img/red.png", imageSize); 
var markerImage4 = new daum.maps.MarkerImage("${root}/img/black.png", imageSize); 

$.ajax({
   url : "${root}/resources/json/cycle.json", // test.jsp 에서 받아옴
   dataType :"json", // 데이터타입을 json 으로 받아옴
   success : function(data) {
     $.each(data.DATA,function(index,obj){
       if(index<=10){
         var p_Num = obj.content_id;

         // 지도에 마커를 표시합니다 
         var marker = new daum.maps.Marker({ 
             position: new daum.maps.LatLng(obj.latitude,obj.longitude)
         });
         var remove=true;
         var content = "";
         content += '<div class="text-center ma-bottom"><br>';
         content += '<div class="title-cycle">'+obj.content_nm+'</div>';
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
             content += '<hr class="no-margin">'; 
             content += '<div><span class="rent-margin font-weight-bold">대여가능 자전거 : '+ cyclecount +' / 20</span></div>'
             content += '</div>';
             var infowindow = new daum.maps.InfoWindow({
               content: content,
               removable: remove// 인포윈도우에 표시할 내용
             });
             daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow)); 
           }
         })
    
       }else{
         return;
       } 
     })
   
   }
 })
 
 $(document).on("click", "button[name='c_Code']", function() {
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
   $(document).on("change",".custom-select",function(){
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
     var currentTime = rentday+' '+ rentHour+':'+ time.getMinutes() + pmam;
     var current = "오늘 "+rentHour+':'+ time.getMinutes() + pmam;
     var body="";
     body += '<div class="text-center return-margin return-time"><span class="cycle-padding font-weight-bold">반납 예정시간</span>'+currentTime+'</div>';
     $('.modal-body').append(body);
   })
   var html = "";
   html += '<div class="text-center return-margin">'
   html += '<span class="cycle-padding font-weight-bold">대여 시간</span>';
   html += '<select class="custom-select" id="rent-time">';
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
    console.log($('#rent-time').val());
    rent_data = {"c_Code" : c_Code,
                 "p_Num" : p_Num,
                 "rent_hour":$('#rent-time').val()
                 };

    $.ajax({
       url : "${root}/cycleshare/cycle.do", 
       data: JSON.stringify(rent_data),
       contentType: "application/json;charset=utf-8",
       dateType:"json",
       type: "POST",
       success : function(data) {
         console.log(data);
         }
       })
     
   })
   
 })
 
 
})
 
</script>