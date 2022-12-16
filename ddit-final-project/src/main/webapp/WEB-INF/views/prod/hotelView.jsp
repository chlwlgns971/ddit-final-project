<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<security:authentication property="principal" var="principal" />


<div class="main-wrapper packages-list-left-sidebar">
<!-- ====================================
———	PAGE TITLE
===================================== -->
	<section class="page-title">
		
	  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg12.jpg);">
	    <div class="container">
	      <div class="row align-items-center justify-content-center" style="height: 200px;">
	        <div class="col-lg-6">
	          <div class="page-title-content">
	            <div class="">
	              <h2 class="text-uppercase text-white font-weight-bold">${hotelInfo.cinfoTitle }</h2>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	</section>


	<!-- ====================================
	———	PACKAGES SECTION
	===================================== -->
	<section class="py-10">
	  <div class="container">
	    <div class="row">
<!-- 	     <div><i id='heart' style="margin-top:10px;" onclick='wishList()'  class='far fa-heart' ></i></div> -->
	      <div class="col-md-5 col-lg-4 order-2">
	        <form id="searchBtn" action="${cPath }/booking/step1" method="post">
	        <security:csrfInput />
	          <div class="card border">
	            <h2 class="card-header text-uppercase text-center bg-smoke border-bottom">
	              예약하기
	            </h2>
	
	            <div class="card-body px-3 py-4">
	              <div class="border-bottom mb-5">
	                <div class="form-group mb-5">
	                  <div class="row">
	                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-end px-2">
	                      체크인:</label>
	
	                    <div class="col-xl-7">
	                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
	                      	<input type="hidden" name="selectedSdate" id="selectedSdate">
	                        <input type="text" id="resSdate" class="form-control daterange-picker-category-2 bookingInfo" name="resSdate" value="${resSdate }"
	                          >
	                      </div>
	                    </div>
	                  </div>
	                </div>
	
	                <div class="form-group mb-5">
	                  <div class="row">
	                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-end px-2">
	                      체크아웃:</label>
	
	                    <div class="col-xl-7">
	                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
	                        <input type="hidden" name="selectedEdate" id="selectedEdate">
	                        <input type="text" id="resEdate" class="form-control daterange-picker-category-2 bookingInfo" name="resEdate" value="${resEdate }"
	                          >
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                
	                <div class="form-group mb-5">
	                  <div class="row align-items-center">
	                    <label class="control-label col-xl-5 text-center text-xl-end">투숙인원</label>
	
	                    <div class="col-xl-5">
	                      <div class="count-input mx-auto">
	                        <a id="guestDecrease" class="incr-btn" data-action="decrease" href="javascript:void(0)">–</a>
	                        <input id="guest" class="quantity" type="number" name="resQty" value="${guest }">
	                        <a id="guestIncrease" class="incr-btn increase" data-action="increase" href="javascript:void(0)">+</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                <div class="form-group mb-5">
	                  <div class="row align-items-center">
	                    <label class="control-label col-xl-5 text-center text-xl-end">객실 수</label>
	
	                    <div class="col-xl-5">
	                      <div class="count-input mx-auto">
	                        <a id="decrease" class="incr-btn" data-action="decrease" href="javascript:void(0)" onclick="fn_calPrice()">–</a>
	                        <input id="room" class="quantity bookingInfo" type="number" name="room" readOnly  value="${room }">
	                        <a id="increase" class="incr-btn" data-action="increase" onclick="fn_calPrice()" href="javascript:void(0)">+</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	
	                <div class="form-group mb-5">
	                  <div class="row">
	                    <label for="inputText" class="col-xl-5 col-form-label text-center text-xl-end px-2">
	                      객실 타입:</label>
	                    <div class="col-xl-7">
	                      <div class="form-group mb-0">
	                        <div class="select-default select-category-2">
	                          <input type="hidden" name="prodNum" id="prodNum" value="">
	                          <input type="hidden" name="prodPrice" id="selectedRoomTypePrice" value="" class="bookingInfo">
	                          <select id="roomSelect" class="select-option" onchange="fn_calPrice()">
									<option>객실을 선택하세요.</option>
	                          <c:set var="roomType" value="${roomInfo}"></c:set>
	                          <c:choose>
	               				<c:when test="${not empty roomType and fn:length(roomType)!=0 }" >
	               					<c:forEach items="${roomType }" var="roomType">                         
	               						<option value="${roomType.romNum}" data-price="${roomType.romPrice }">${roomType.romNam }&nbsp&nbsp￦ <fmt:formatNumber value="${roomType.romPrice }" pattern="#,###"/></option>
	               					</c:forEach>
	               				</c:when>  
	               				<c:otherwise>
	               					<option>조회 중 에러 발생. 새로고침 후 이용하시기 바랍니다.</option> 
	               				</c:otherwise>         
	                          
	                          </c:choose>
	               	
	                          </select>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	
	
	              </div>
	
	              <div class="d-flex justify-content-between border-bottom mb-5 pb-5">
	                <span class="text-uppercase h4 mb-0">총 숙박요금</span>

	                <span></span>
	                <span id="totalPrice" class="font-weight-bold text-primary h3 mb-0">￦-</span>
	              </div>
	
	              <div class="d-grid text-center px-4">
	                <button type="submit" 
	                  class="btn btn-hover btn-lg btn-outline-secondary text-uppercase">
	                  예약하기 <span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
	                </button>
	              </div>
	            </div>
	          </div>
	        </form>
	      </div>
	
	      <div class="col-md-7 col-lg-8">
	        <div id="package-slider" class="owl-carousel owl-theme package-slider">
	          <div class="item">
	          	<img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-03.jpg" src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-03.jpg" alt="image">
	          </div>
	
	          <div class="item">
	            <img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-01.jpg" src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-01.jpg" alt="image">
	          </div>
	
	          <div class="item">
	            <img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-02.jpg" src="${pageContext.request.contextPath }/resources/images/holets/hotel-slider-02.jpg" alt="image">
	          </div>
	        </div>
	
	        <div class="mt-8">
	       
	
			<span style="font-size:30px;">${hotelInfo.cinfoTitle }
<!-- 			<i id='heart' style="margin-top:10px;" class='far fa-heart' ></i> -->
			</span>	

			<br>
			<span>  
				<span class="text-warning"> 
					<c:forEach var="i" begin="1" end="${hotelInfo.romGrade}" >
					   <i class="fa fa-star" aria-hidden="true"></i>					
					</c:forEach>
				 </span>
	        </span>
	        
	
	        <div class="mb-5" >
	            <div class="row">
	              <div class="col-lg-6">
	         		${hotelInfo.comAddr } 
	              </div>
	            </div>
	          </div> 
	        </div>
			<hr>
	        <div class="mb-6" >
	          <p class="mb-5">${hotelInfo.cinfoInfo }</p>
	        </div>
	        <hr>
	        <div class="mb-7">
	          <h2 class="text-uppercase mb-6">호텔위치</h2>
	          <p class="mb-0">위치 특징</p>
	          <div id="googleMap" class="mb-7" id="map2" style="width:100%; height:400px;"></div>
<!-- 	          <div id="googleMap" style="width:700px; height:500px"> -->
<!-- 	          </div> -->
	        </div>
	        <script type="text/javascript">
	//            		function initMap() {
	//             		var map = new google.maps.Map(document.getElementById("googleMap"), {
	//             	    	center: { lat: 37.5400456, lng: 126.9921017 },                           
	//             	    	zoom: 10
	//             	  	};
	//            		}

	
		            function initMap() {     
		            	var mapOptions = { 
		            			center:new google.maps.LatLng(${hotelInfo.comLatit}, ${hotelInfo.comLngit}),
		            	        zoom:15
		            	       
		            	};
		            	var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions );
		            	const malls = [
		            	    { label: "HERE", name: "${hotelInfo.cinfoTitle}", lat: ${hotelInfo.comLatit}, lng: ${hotelInfo.comLngit} }
		            	  ];
		            	
		            	const infowindow = new google.maps.InfoWindow();
					
		            	
		            	malls.forEach(({ label, name, lat, lng }) => {
		            	    const marker = new google.maps.Marker({
		            	      	position: { lat, lng },
		            	      	label,
		            	      	map: map,
		            	    });
		            	    marker.addListener("click", () => {
		            	    	var distanceData = null;
		            	    	$.ajax({
		            	    		url : "https://cors-anywhere.herokuapp.com/"+"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&mode=transit&origins=37.5115557,127.0595261&destinations=37.5251644,126.9255491&region=KR&key=<api키>",
	// 	            				data : {"origins" : "37.541,126.986", "destinations" : "35.1595454,126.8526012", "key" : "<api키>"},
		            				success : function(resp) {
		            					console.log(JSON.stringify(resp));
	// 	            					console.log(JSON.stringify(resp.rows[0].elements[0].distance.text));
		            					distanceData = JSON.stringify(resp.rows[0].elements[0].distance.text);
		            					console.log(distanceData);
		    	            	    	map.panTo(marker.position);
		    	            	      	infowindow.setContent("<h3>"+name+"</h3><div>"+distanceData+"</div>");
		    	            	      	infowindow.open({
		    	            	        	anchor: marker,
		    	            	        	map,
		    	            	      	});
		            					
		            				},
		            				error : function(errorResp) {
		            					console.log(errorResp.status);
		            				}
		            	    	})
		            	    	
			            	});
		            	});
		            };
	            </script>
	            <script src="https://maps.googleapis.com/maps/api/js?key=<api키>&callback=initMap" ></script>
	
	        
	        <c:if test="${not empty roomInfo }">
      			<c:forEach items="${roomInfo }" var="roomInfo">
			        <div class="mb-6 border-bottom">
			          <h4 class="text-uppercase mb-5">${roomInfo.romNam }</h4>
			          <p class=""><i class="fa-thin fa-house">객실 크기: ${roomInfo.romExtnt } ㎡</i></p>
			          <p class="">최대인원: ${roomInfo.romGuest }명</p>
			
			          <div class="d-md-flex justify-content-between align-items-center mb-5">
			            <ul
			              class="list-unstyled d-flex flex-wrap justify-content-center justify-content-md-start font-weight-medium mb-md-0">
			              <li class="">
			                <a href="" class="text-gray-color hover-text-primary me-4">
			                  <img class="me-2" src="${pageContext.request.contextPath }/resources/images/packages/shape-icon-1.png" alt="Image">조식 포함
			                </a>
			              </li>
			
			              <li class="">
			                <a href="" class="text-gray-color hover-text-primary me-4">
			                  <img class="me-2" src="${pageContext.request.contextPath }/resources/images/packages/shape-icon-2.png" alt="Image">TV
			                </a>
			              </li>
			
			              <li class="">
			                <a href="" class="text-gray-color hover-text-primary">
			                  <img class="me-2" src="${pageContext.request.contextPath }/resources/images/packages/shape-icon-3.png" alt="Image">무료 wifi
			                </a>
			              </li>
			            </ul>
			
			            <h5 class="text-center text-lg-left">
			              <span class="text-gray-color font-weight-bold text-capitalize">1박당 요금:&ensp;&ensp;</span>
			              <span class="text-primary font-weight-bold"><fmt:formatNumber value="${roomInfo.romPrice }" pattern="#,###"/>원</span>
			            </h5>               
			          </div>
			
			          <div class="px-lg-2 pb-3">
			            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5">
			              <div class="col mb-2 pe-1 px-lg-1">
			                <div class="media img-overlay">
			                  <div class="media-content w-100">
			                    <img class="media-img rounded w-100 lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/double-room-img1.jpg" src="${pageContext.request.contextPath }/resources/images/packages/double-room-img1.jpg"
			                      alt="Generic placeholder image">
			                    <a href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg" data-fancybox="gallery" class="hover-img-overlay-dark"></a>
			                  </div>
			                </div>
			              </div>
			
			              <div class="col mb-2 ps-1 px-md-2 px-lg-1">
			                <div class="media img-overlay">
			                  <div class="media-content w-100">
			                    <img class="media-img rounded w-100 lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/double-room-img2.jpg" src="${pageContext.request.contextPath }/resources/images/packages/double-room-img2.jpg"
			                      alt="Generic placeholder image">
			                    <a href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-02.jpg" data-fancybox="gallery" class="hover-img-overlay-dark"></a>
			                  </div>
			                </div>
			              </div>
			
			              <div class="col mb-2 pe-1 pe-md-3 ps-md-1 px-lg-1">
			                <div class="media img-overlay">
			                  <div class="media-content w-100">
			                    <img class="media-img rounded w-100 lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/double-room-img3.jpg" src="${pageContext.request.contextPath }/resources/images/packages/double-room-img3.jpg"
			                      alt="Generic placeholder image">
			                    <a href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-03.jpg" data-fancybox="gallery" class="hover-img-overlay-dark"></a>
			                  </div>
			                </div>
			              </div>
			
			              <div class="col mb-2 ps-1 ps-md-3 pe-md-1 px-lg-1">
			                <div class="media img-overlay">
			                  <div class="media-content w-100">
			                    <img class="media-img rounded w-100 lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/double-room-img4.jpg" src="${pageContext.request.contextPath }/resources/images/packages/double-room-img4.jpg"
			                      alt="Generic placeholder image">
			                    <a href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-04.jpg" data-fancybox="gallery" class="hover-img-overlay-dark"></a>
			                  </div>
			                </div>
			              </div>
			
			              <div class="col mb-2 pe-1 px-md-2 px-lg-1">
			                <div class="media img-overlay">
			                  <div class="media-content w-100">
			                    <img class="media-img rounded w-100 lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/double-room-img5.jpg" src="${pageContext.request.contextPath }/resources/images/packages/double-room-img5.jpg"
			                      alt="Generic placeholder image">
			                    <a href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-05.jpg" data-fancybox="gallery" class="hover-img-overlay-dark"></a>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			    </c:forEach>
			</c:if>        

	
<!-- 	        <div class="mb-7"> -->
<!-- 	          <h2 class="text-uppercase mb-6">투숙객 작성 이용 후기</h2> -->
	
<!-- 	          <div class="d-flex align-items-center mb-6"> -->
<!-- 	            <h3 class="text-uppercase mb-0"> -->
<!-- 	              <span class="me-2">이용 후기 (3)</span> -->
	
<!-- 	              <span class="text-warning"> -->
<!-- 	                <i class="fa fa-star" aria-hidden="true"></i> -->
<!-- 	                <i class="fa fa-star" aria-hidden="true"></i> -->
<!-- 	                <i class="fa fa-star" aria-hidden="true"></i> -->
<!-- 	                <i class="fa fa-star" aria-hidden="true"></i> -->
<!-- 	                <i class="fas fa-star-half-alt" aria-hidden="true"></i> -->
<!-- 	              </span> -->
<!-- 	            </h3> -->
<!-- 	          </div> -->
	
<!-- 	          <div class="media mb-6"> -->
<!-- 	            <a class="me-6" href=""> -->
<%-- 	              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" alt="Generic placeholder image"> --%>
<!-- 	            </a> -->
	
<!-- 	            <div class="media-body"> -->
<!-- 	              <h5>이름</h5> -->
<!-- 	              <span class="star add-rating-default pb-1"></span> -->
<!-- 	              <p class="mb-0">굿.</p> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
	
<!-- 	          <div class="media mb-6"> -->
<!-- 	            <a class="me-6" href=""> -->
<%-- 	              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" alt="Generic placeholder image"> --%>
<!-- 	            </a> -->
	
<!-- 	            <div class="media-body"> -->
<!-- 	              <h5>이름</h5> -->
<!-- 	              <span class="star add-rating-default pb-1"></span> -->
<!-- 	              <p class="mb-0">낫베드</p> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
	
<!-- 	          <div class="media"> -->
<!-- 	            <a class="me-6" href=""> -->
<%-- 	              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" alt="Generic placeholder image"> --%>
<!-- 	            </a> -->
<!-- 	            <div class="media-body"> -->
<!-- 	              <h5>이름</h5> -->
<!-- 	              <span class="star add-rating-default pb-1"></span> -->
<!-- 	              <p class="mb-0">쏘쏘</p> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
	
<!-- 	        <form class="mb-9 mb-md-0"> -->
<!-- 	          <h3 class="text-uppercase mb-6">이용 후기를 남겨주세요</h3> -->
	
<!-- 	          <p class="rating-view d-flex align-items-center"> -->
<!-- 	            <span class="content-view">평점 주기</span> -->
<!-- 	            <span class="star add-rating-default ms-2"></span> -->
<!-- 	          </p> -->
	
<!-- 	          <div class="form-group mb-6"> -->
<!-- 	            <textarea class="form-control border-0 bg-smoke" placeholder="내용" rows="6"></textarea> -->
<!-- 	          </div> -->
	
<!-- 	          <div class=""> -->
<!-- 	            <button type="button" onclick="location.href='javascript:void(0)';" -->
<!-- 	              class="btn btn-hover btn-outline-secondary text-uppercase">작성하기 -->
<!-- 	            </button> -->
<!-- 	          </div> -->
<!-- 	        </form> -->
	      </div>
	    </div>
	  </div>
	</section>

</div>

<script>

//체크아웃 - 체크인 계산
let sDate = $("#resSdate");
let eDate = $("#resEdate");
let resSdate = sDate.val();
let resEdate = eDate.val();
let checkIn = new Date(resSdate);
let checkOut = new Date(resEdate);
let dayIn = checkIn.getTime();
let dayOut = checkOut.getTime();
let dayOfStay = (dayOut - dayIn)/1000/60/60/24;
console.log("몇 박?:", dayOfStay );
let roomValue = $("#room");

let totalPrice = $("#totalPrice");




//예약form에서 예약기간, 객실 수, 객실 타입 바뀌면 총금액 출력하기

$("#roomSelect").on("change", function(event){
	let roomSelect = $("#roomSelect").val();
	let selectedRoomTypePrice = $("#selectedRoomTypePrice")
	let roomPrice = $("#roomSelect option:selected").data("price");	

	let calcRoomPrice = roomPrice * roomValue.val() * dayOfStay;

	totalPrice.html('￦ '+calcRoomPrice);
	selectedRoomTypePrice.val(calcRoomPrice);
	$("#prodNum").val(roomSelect);	
	
	
	
// 	let totalPrice = roomPrice* parseInt(roomCnt) * parseInt(dayOfStay);
// 	console.log(totalPrice);
});

function fn_realCalPrice(){
	let roomPrice = $("#roomSelect option:selected").data("price");
	if(!roomPrice){
		//alert("객실타입을 먼저 고르셔야지용용");
		return;
	}

    let calcRoomPrice = roomPrice * roomValue.val() * dayOfStay;
    
	console.log(roomValue);
	console.log("================================");
	console.log("가격:",roomPrice);
	console.log("방갯수:",roomValue.val());
	console.log("숙박일",dayOfStay);
	console.log("총금액",calcRoomPrice);
	console.log("================================");
	totalPrice.html('￦ '+calcRoomPrice);	
}

function fn_calPrice(){
	setTimeout(fn_realCalPrice,100);  // 좋은 방법은 아니나 부트스트랩 js와 이벤트가 겹치는 부분이 생겨 미봉책으로 시간 딜레이 사용!
} 







let roomCount = $("#room");
$("#guestIncrease").on("click", function(event) { //인원 버튼에 클릭이벤트 발생시 작동하는 함수
	let guest = $("#guest"); //투숙인원수
	if (parseInt(guest.val()) % 2 == 0) {
		roomCount.val(parseInt(roomCount.val()) + 1);
		fn_calPrice();
	}
});



//하트 > 빨간하트로 바뀜
//한번 더 누르면 delete 위시리스트 하고
//누르면 위시리스트 테이블에 insert 
//하트는 하얀색으로
//로그인 정보가 있을 때에 위시추가되고
//없으면 메세지 띄운다(로그인 후 이용 가능)


// if(null=={principal }){
	
// }

// $("#heart").on("click",function(event){
	
// 	console.log("memId",memId);
	
// 	if(memId != null && memId !=""){
		
// 	}else{
		
// 	}
	
// });



















</script>