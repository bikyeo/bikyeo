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
//   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
//     mapOption = { 
//         center: new daum.maps.LatLng(37.4994553, 127.02924710000002), // 지도의 중심좌표
//         level: 7 // 지도의 확대 레벨
//     };

// var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// // 마커를 표시할 위치와 title 객체 배열입니다 
// var positions = [
//     {
//         title: '비트교육센터', 
//         latlng: new daum.maps.LatLng(37.4994553, 127.02924710000002),
//         image: "${root}/img/black.png"
//     },
//     {
//         title: '대사관', 
//         latlng: new daum.maps.LatLng(37.48296879999999, 127.02947629999994),
//         image: "${root}/img/red.png"
//     },
//     {
//         title: '도곡공원', 
//         latlng: new daum.maps.LatLng(37.4901432, 127.04509589999998),
//         image: "${root}/img/orange.png"
//     },
//     {
//         title: '역삼역',
//         latlng: new daum.maps.LatLng(37.5004569, 127.03651739999998),
//         image: "${root}/img/green.png"
//     }
// ];

    
// for (var i = 0; i < positions.length; i ++) {
    
//     // 마커 이미지의 이미지 크기 입니다
//     var imageSize = new daum.maps.Size(15, 15); 
    
//     // 마커 이미지를 생성합니다    
//     var markerImage = new daum.maps.MarkerImage(positions[i].image, imageSize); 
    
//     // 마커를 생성합니다
//     var marker = new daum.maps.Marker({
//         map: map, // 마커를 표시할 지도
//         position: positions[i].latlng, // 마커를 표시할 위치
//         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//         image : markerImage // 마커 이미지 
//     });

//     var infowindow = new daum.maps.InfoWindow({
//       content: '<div>근린공원</div><button>대여</button>' // 인포윈도우에 표시할 내용
//   });
//     daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
//     daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
// }
// function makeClickListener(map, marker, infowindow) {
//   console.log(marker);
//    return function() {
//      infowindow.open(map, marker);
//    };
  
// }
// function makeOutListener(infowindow) {
//   return function() {
//       infowindow.close();
//   };
// }

// var opendMarker;


// $(document).ready(function() {
//   function makeClickListener(map, marker, infowindow) {     
//     return function() {
//       if(opendMarker===infowindow){
//         opendMarker.close();
//         opendMarker=null;
//       }else{
      
//       if (opendMarker){ 
//         opendMarker.close();
//       }
//       opendMarker = infowindow;
//       infowindow.open(map, marker);
//       }
//     };
   
// }


//   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
//   mapOption = { 
//       center: new daum.maps.LatLng(37.4994553, 127.02924710000002), // 지도의 중심좌표
//       level: 7 // 지도의 확대 레벨
//   };

// var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//         $.ajax({
//             url : "${root}/resources/json/cycle.json", // test.jsp 에서 받아옴
//             dataType :"json", // 데이터타입을 json 으로 받아옴
//             success : function(data) {
              
//               $.each(data.DATA,function(index,obj){
//                 if(index<=10){
//                 var imageSize = new daum.maps.Size(15, 15); 
                
//                 // 마커 이미지를 생성합니다    
//                 var markerImage = new daum.maps.MarkerImage("${root}/img/green.png", imageSize); 
//                 var positions = [{ 
//                   title:obj.content_nm,
//                   latlng:new daum.maps.LatLng(obj.latitude,obj.longitude),
//                   image:markerImage
//                     }];
//                   // 마커를 생성합니다
//                   var move=true;
//                   var marker = new daum.maps.Marker({
//                       map: map, // 마커를 표시할 지도
//                       position: new daum.maps.LatLng(obj.latitude,obj.longitude), // 마커를 표시할 위치
//                       title : obj.content_nm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//                       image : markerImage, // 마커 이미지 
                      
                  
//                   });
//                   var html = "";
//                   html +='<div class="info">'; 
//                   html +='   <div class="title">' + obj.content_nm + '</div>';
//                   html +='</div>';

//                   var infowindow = new daum.maps.InfoWindow({
//                     content: html,
//                     removable: move// 인포윈도우에 표시할 내용
//                   });
//                   daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
                  
//                 }else{
//                   return;
//                 }     
//             })
//             }
//               ,
//             error : function(e) {
//                 console.log(e.responseText);
//             }
            
//         });
//     });
// var mapContainer = document.getElementById('map'), // 지도의 중심좌표
//     mapOption = { 
//         center: new daum.maps.LatLng(37.4994553, 127.02924710000002), // 지도의 중심좌표
//         level: 7 // 지도의 확대 레벨
//     }; 

// var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// //
//         $.ajax({
//             url : "${root}/resources/json/cycle.json", // test.jsp 에서 받아옴
//             dataType :"json", // 데이터타입을 json 으로 받아옴
//             success : function(data) {
              
//               $.each(data.DATA,function(index,obj){
//                 if(index<=10){
//                 var imageSize = new daum.maps.Size(15, 15); 
                
//                 // 마커 이미지를 생성합니다    
//                 var markerImage = new daum.maps.MarkerImage("${root}/img/green.png", imageSize); 
//                 var positions = [{ 
//                   title:obj.content_nm,
//                   latlng:new daum.maps.LatLng(obj.latitude,obj.longitude),
//                   image:markerImage
//                     }];
//                   // 마커를 생성합니다
//                   var move=true;
//                   var marker = new daum.maps.Marker({
//                       map: map, // 마커를 표시할 지도
//                       position: new daum.maps.LatLng(obj.latitude,obj.longitude), // 마커를 표시할 위치
//                       image : markerImage, // 마커 이미지 
                      
                  
//                   });
//                   var content = '<div class="wrap">' + 
//                   '    <div class="info">' + 
//                   '        <div class="title">' + 
//                   '            카카오 스페이스닷원' + 
//                   '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
//                   '        </div>' + 
//                   '        <div class="body">' + 
//                   '            <div class="img">' +
//                   '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
//                   '           </div>' + 
//                   '            <div class="desc">' + 
//                   '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
//                   '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
//                   '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
//                   '            </div>' + 
//                   '        </div>' + 
//                   '    </div>' +    
//                   '</div>';

//                   var overlay = new daum.maps.CustomOverlay({
//                     content: content,
//                     map: map,
//                     position: marker.getPosition()       
//                 });
//                   daum.maps.event.addListener(marker, 'click', function() {
//                     overlay.setMap(map);
//                 });

//                 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
//                 function closeOverlay() {
//                     overlay.setMap(null);     
//                 }

                   
//                 }else{
//                   return;
//                 }     
//             })
//             }
//               ,
//             error : function(e) {
//                 console.log(e.responseText);
//             }
            
//         });
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
var markerImage = new daum.maps.MarkerImage("${root}/img/green.png", imageSize); 
 $.ajax({
   url : "${root}/resources/json/cycle.json", // test.jsp 에서 받아옴
   dataType :"json", // 데이터타입을 json 으로 받아옴
   success : function(data) {
     $.each(data.DATA,function(index,obj){
       if(index<=10){
          // 지도에 마커를 표시합니다 
         var marker = new daum.maps.Marker({
             map: map, 
             position: new daum.maps.LatLng(obj.latitude,obj.longitude),
             image: markerImage
         });
         var move=true;
         // 커스텀 오버레이에 표시할 컨텐츠 입니다
         // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
         // 별도의 이벤트 메소드를 제공하지 않습니다 
         console.log(obj.content_id);

         var content = "";
         $.ajax({
           url : "${root}/cycle/cycle.do", // test.jsp 에서 받아옴
           data: {"p_Num":obj.content_id},
           type: "GET",
           dataType :"json", // 데이터타입을 json 으로 받아옴
           success : function(data) {
             
           }
         })
         content += '<div class="text-center ma-bottom"><br><div class="title-cycle">'+obj.content_nm+'</div>';
          content += '<hr class="no-margin"><div><span class="rent-margin">'+index+' 번 자전거</span><span><button class="btn btn-primary rent-button">대여</button></span></div>';
          content += '<div><span class="rent-margin">'+index+' 번 자전거</span><span><button class="btn btn-primary rent-button">대여</button></span></div>';
          content += '</div>';
         var infowindow = new daum.maps.InfoWindow({
           content: content,
           removable: move// 인포윈도우에 표시할 내용
         });
         daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
         
       }else{
         return;
       } 
     })
   
   }
 })
})
          // 마커 위에 커스텀오버레이를 표시합니다
         // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        
         // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
       

  

// // 지도에 마커를 표시합니다 
// var marker = new daum.maps.Marker({
//     map: map, 
//     position: new daum.maps.LatLng(37.4994553, 127.02924710000002),
//     image: markerImage
// });

// // 커스텀 오버레이에 표시할 컨텐츠 입니다
// // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// // 별도의 이벤트 메소드를 제공하지 않습니다 
// var content = '<div class="wrap">' + 
//             '    <div class="info">' + 
//             '        <div class="title">' + 
//             '            카카오 스페이스닷원' + 
//             '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
//             '        </div>' + 
//             '        <div class="body">' + 
//             '            <div class="img">' +
//             '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
//             '           </div>' + 
//             '            <div class="desc">' + 
//             '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
//             '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
//             '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
//             '            </div>' + 
//             '        </div>' + 
//             '    </div>' +    
//             '</div>';

// // 마커 위에 커스텀오버레이를 표시합니다
// // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// var overlay = new daum.maps.CustomOverlay({
//     content: content,
//     position: marker.getPosition()       
// });

// // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// daum.maps.event.addListener(marker, 'click', function() {
//     overlay.setMap(map);
// });

// // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
// function closeOverlay() {
//     overlay.setMap(null);     
// }
</script>