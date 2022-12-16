<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
#searchFlight {
	width: 100%;
	height: 200px;
	background-color: #111236;
	margin: 5% auto auto;
	border-radius: 5px;
	color: white;
	padding: 30px 50px;
}

.radioStyle {
	margin-right: 2px;
}
.labels {
	color: white;
	width: 80px;
}
#passenger{
 border-bottom: 1px solid #969696;
 border-top: none;
 border-right: none;
 border-left: none;
  font:"Montserrat", sans-serif;
  font-size: 13px;
  padding: 11px 17px;
  text-transform: capitalize;
  transition: all .4s;
  color: #6c757d;
  width: 100%;
  background-color:transparent;
}
   #nemo {

        display: none;
        position: absolute;
    }




</style>


<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg7.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold">항공권</h2>
						</div>
						<p class="text-white mb-0"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="bg-dark-light py-7">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-xl-3">
				<div class="section-title-bg mb-1 mb-lg-3 mb-xl-0">
					<h1 class="text-white text-uppercase mb-0">이제</h1>
					<h2 class="text-white text-uppercase font-weight-bold mb-0">
						여행을 <span class="text-primary">시작하세요</span>
					</h2>
				</div>
			</div>

			<div class="col-xl-9">
				<form id="searchInfo">
					<div class="row">
						<div class="col-lg-10">
<!-- 							<label class="labels"><input type="radio" -->
<!-- 								name="flightType" class="radioStyle" aria-label="왕복" checked>왕복</label> -->
<!-- 									<label class="labels"><input type="radio" -->
<!-- 								name="flightType" class="radioStyle" aria-label="편도">편도</label> -->
							<div class="row">
								<div class="row">

									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<label style="color:white">출발지</label>
													<select id="continentsSelect" class="select-option">
														<option>대륙을 선택하세요</option>
														<c:set var="continentsList" value="${continentsList }"></c:set>

														<c:choose>
															<c:when
																test="${not empty continentsList and fn:length(continentsList)!=0 }">
																<c:forEach items="${continentsList}" var="category">
									 									<option value="${category.catCode}">${category.catNam }</option>
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

									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<label style="color:white">도착지</label>
													<select id="continentsSelect2" class="select-option">
														<option>대륙을 선택하세요</option>
														<c:set var="continentsList" value="${continentsList }"></c:set>

														<c:choose>
															<c:when
																test="${not empty continentsList and fn:length(continentsList)!=0 }">
																<c:forEach items="${continentsList}" var="category">
									 									<option value="${category.catCode}">${category.catNam }</option>
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
									<div class="col-md-6 col-lg-3">
										<div class="mb-3 form-group-icon mb-lg-0">
											<label style="color:white">날짜	좌석등급	승객</label>
											 <input
												type="date" id="departureDate" class="form-control daterange-picker searchInfo"
												autocomplete="off" name="departureDate" value=""
												placeholder="출발일" />
										</div>
									</div>
									<div class="col-lg-2" style="color: #6c757d; margin-left: 20px; padding-top:30px">
										<input id="nonStop" type="checkbox" style="color: #6c757d; " > 직항만
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<select id="countrySelect" name="countrySelect"
														class="select-option">
														<option>국가를 선택하세요</option>
													</select>
												</div>
											</div>
										</div>
									</div>
										<div class="col-md-6 col-lg-3">
									<div class="select-dropdown">
										<div class="mb-3 mb-lg-0">
											<div class="select-default select-search-box">
												<select id="countrySelect2" name="countrySelect"
													class="select-option">
													<option>국가를 선택하세요</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-lg-3">
									<div class="mb-3 form-group-icon mb-lg-0">
										<input
											type="date" id="returnDate" class="form-control daterange-picker searchInfo"
											autocomplete="off" name="returnDate" value=""
											placeholder="도착일" />
									</div>
								</div>

								<div class="col-lg-2" style="color: #6c757d; margin-left: 20px" >

									<button class="btn btn-primary text-uppercase"
										style="width: 200px" type="button"
										onclick="fn_searchFlight()">항공권검색</button>
								</div>

							</div>

								<div class="row">
									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<select id="citySelect" class="select-option searchInfo"
														name="cityName">
														<option>도시를 선택하세요</option>

													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<select id="citySelect2" class="select-option searchInfo"
														name="cityName2">
														<option>도시를 선택하세요</option>

													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6 col-lg-3">
										<div class="select-dropdown">
											<div class="mb-3 mb-lg-0">
												<div class="select-default select-search-box">
													<input onclick="f_open(this)" id="passenger" style="text-align:left; padding-left:0;" type="button" value="좌석등급 및 승객           ▼">
												</div>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<!-- ====================================
———	실시간 인기 검색 여행지
===================================== -->
<div id="searchResult">
	<section class="bg-smoke py-8 py-lg-9">
	<div class="container">
		<div class="text-center section-title">
			<h2 class="text-uppercase font-weight-bold position-relative">
				<span class="bg-smoke"> 영감이 필요하신가요? </span>
			</h2>
			<p class="text-capitalize text-center">현재 가장 인기있는 여행지를 확인하고 여행계획을
				세워 보세요.</p>
		</div>

		<div class="row grid">
			<div class="col-md-6 col-lg-4 element-item america">
				<div
					class="media media-hoverable justify-content-center mb-2 mb-md-4 mb-lg-6">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-1.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-1.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px; ">
						<div class="media-object">
							<h3 class="text-uppercase mb-0">1위</h3>
							<h3 class="text-uppercase mb-0">파리</h3>
						</div>
						<div class="media-img-overlay"></div>
					</a>
				</div>
			</div>
			
			<div class="col-md-6 col-lg-4 element-item america">
				<div
					class="media media-hoverable justify-content-center mb-2 mb-md-0">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-5.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-5.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px; ">
						<div class="media-object" style="width: 370px; height: 280px; ">
							<h3 class="text-uppercase mb-0">2위</h3>
							<h3 class="text-uppercase mb-0">제주도</h3>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 element-item asia america">
				<div
					class="media media-hoverable justify-content-center mb-2 mb-md-4 mb-lg-6">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-3.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-3.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px; ">
						<div class="media-object">
							<h3 class="text-uppercase mb-0">3위</h3>
							<h3 class="text-uppercase mb-0">서울</h3>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 element-item africa">
				<div
					class="media media-hoverable justify-content-center mb-2 mb-md-4 mb-lg-6">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-2.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-2.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px; ">
						<div class="media-object">
							<h3 class="text-uppercase mb-0">4위</h3>
							<h3 class="text-uppercase mb-0">캐나다</h3>
						</div>
					</a>
				</div>
			</div>
			
			<div class="col-md-6 col-lg-4 element-item asia africa">
				<div
					class="media media-hoverable justify-content-center mb-2 mb-md-4 mb-lg-0">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-4.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-4.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px;">
						<div class="media-object">
							<h3 class="text-uppercase mb-0">5위</h3>
							<h3 class="text-uppercase mb-0">로마</h3>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 element-item asia africa">
				<div class="media media-hoverable justify-content-center">
					<a href="single-package-fullwidth.html" class="media-content">
						<img class="media-img lazyestload"
						data-src="${pageContext.request.contextPath }/resources/images/home/packages/packages-6.jpg"
						src="${pageContext.request.contextPath }/resources/images/home/packages/packages-6.jpg"
						alt="Generic placeholder image" style="width: 370px; height: 280px; ">
						<div class="media-object" >
							<h3 class="text-uppercase mb-0">6위</h3>
							<h3 class="text-uppercase mb-0">런던</h3>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
</div>



	<div id="nemo" class="form-group mb-5" style="width:300px; height:380px; background-color:white; padding:30px 60px; border-radius: 10px; box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.5)">
		<div class="select-default select-category-1" style="width:70%">
			<h3>좌석등급</h3>
			<input type="hidden" value="" />
			<select id="seatClass" class="select-option"
				name="seatClass" required>
				<option>이코노미</option>
				<option>비즈니스</option>
				<option>퍼스트</option>
			</select>
		</div>
		<br>
		<div class="row align-items-center">
			<h3>성인</h3>
			<br>
			<div class="col-7 col-lg-12 col-xl-7">
				<div class="count-input me-0 mx-lg-auto me-xl-0">
					<a id="adultDec" class="incr-btn " data-action="decrease"
						href="javascript:void(0)">–</a> <input id="adult"
						class="quantity" type="number"
						value="1" name="adult">
					<a id="adultAdd" class="incr-btn adultAdd" data-action="increase"
						href="javascript:void(0)">+</a>
				</div>
			</div>
		</div>
		<br>
		<div class="row align-items-center">
			<h3>유아</h3>
			<br>
			<div class="col-7 col-lg-12 col-xl-7">
				<div class="count-input me-0 mx-lg-auto me-xl-0">
					<a id="childrenDec" class="incr-btn " data-action="decrease"
						href="javascript:void(0)">–</a> <input id="children"
						class="quantity" type="number"
						value="1" name="children">
					<a id="childrenAdd" class="incr-btn childrenAdd" data-action="increase"
						href="javascript:void(0)">+</a>
				</div>
			</div>
		</div>
		<div class="col-lg-2" style="display:flex; height:40px; width:70px; float:right">
			<button class="btn btn-primary text-uppercase"
				style="width: 100px; height: 40px; margin-top: 10px; padding:5px 0px" type="button"
				onclick="fn_displayNone()">완료</button>
		</div>
	</div>







<script>
//완료 버튼 누르면 다시 숨겨지게 하기
function fn_displayNone(){
	$("#nemo").hide();
}

//숨겨진 좌석선택 박스 나오게하기
let lnemo = document.querySelector("#nemo");
function f_open(pThis){
    let pos = pThis.getBoundingClientRect();
    console.log(pos);
    lnemo.style.left = 50 + pos.left + "px";
//     console.log("화긴:",pThis.offsetTop);
    lnemo.style.top = 0 + pThis.offsetTop + pos.height + "px";
    lnemo.style.display="block";
   // console.log(pThis.getBoundingClientRect());
}



//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
$("#continentsSelect").on('change', function(event){
	let continentName = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/country",
		data : { name: continentName},
		dataType : "json",
		success : function(resp) {
			$('#countrySelect').find("option").remove();   //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
			let nationsList = resp;
			let options = [];

			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"국가를 선택하세요"));


			$.each(nationsList, function(index, category){
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#countrySelect').append(options);
			$('#countrySelect').selectric('init'); 	//selectric 초기화
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});


//국가 선택하면 국가에 속한 도시리스트 가져오기
$("#countrySelect").on('change', function(event){
	let countryName = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/city",
		data : { name: countryName},
		dataType : "json",
		success : function(resp) {
			$('#citySelect').find("option").remove();
			let nationsList = resp;
			let options = [];

			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"도시를 선택하세요"));

			$.each(nationsList, function(index, category){
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#citySelect').append(options);
			$('#citySelect').selectric('init');
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});
//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
$("#continentsSelect2").on('change', function(event){
	let continentName2 = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/country",
		data : { name: continentName2},
		dataType : "json",
		success : function(resp) {
			$('#countrySelect2').find("option").remove();   //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
			let nationsList = resp;
			let options = [];

			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"국가를 선택하세요"));


			$.each(nationsList, function(index, category){
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#countrySelect2').append(options);
			$('#countrySelect2').selectric('init'); 	//selectric 초기화
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});


//국가 선택하면 국가에 속한 도시리스트 가져오기
$("#countrySelect2").on('change', function(event){
	let countryName2 = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/city",
		data : { name: countryName2},
		dataType : "json",
		success : function(resp) {
			$('#citySelect2').find("option").remove();
			let nationsList = resp;
			let options = [];

			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"도시를 선택하세요"));

			$.each(nationsList, function(index, category){
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#citySelect2').append(options);
			$('#citySelect2').selectric('init');
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});

//기본 날짜 현재날짜/ 내일날짜로 셋팅하기
let today = new Date();
let tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);
let setToday = today.toISOString().substring(0, 10);
let setTomorrow = tomorrow.toISOString().substring(0, 10);
$("#departureDate").val(setToday);
$("#returnDate").val(setTomorrow);


// 출발지, 출발일, 도착지, 도착일, 좌석등급, 성인, 유아 변수 선언
	let originLocationCode="";
	let departureDate="";
	let destinationLocationCode="";
	let returnDate="";
	let seatClass="ECONOMY";
	let adult="1";
	let children="1";
	let nonStop= false;


	$("#result").html(originLocationCode);



//출발 도시가 설정되었을 때 값 세팅
	$("#citySelect").on("change", function(event){
		console.log(event);
		originLocationCode = event.target.value;
		console.log(originLocationCode);
		if(originLocationCode=="KR001"){
			originLocationCode = "ICN";
		}
		console.log(originLocationCode);
	});
//도착 도시가 설정되었을 때 값 세팅
	$("#citySelect2").on("change", function(event){
		console.log(event);
		destinationLocationCode = event.target.value;
		console.log(destinationLocationCode);
		if(destinationLocationCode=="FR001"){
			destinationLocationCode = "CDG";
		}
		console.log(destinationLocationCode);
	});
//출발일이 설정되었을 때 값 세팅
	$("#departureDate").on("change", function(event){
		console.log(event);
		departureDate = event.target.value;
		console.log(departureDate);
	});
//도착일이 설정되었을 때 값 세팅
	$("#returnDate").on("change", function(event){
		console.log(event);
		returnDate = event.target.value;
		console.log(returnDate);
	});
//좌석등급이 설정되었을 때 값 세팅
	$("#seatClass").on("change", function(event){
		console.log(event);
		seatClass = event.target.value;
		console.log(seatClass);
		if(seatClass=="이코노미"){
			seatClass = "ECONOMY";

		}else if(seatClass=="비즈니스"){
			seatClass = "BUSINESS";

		}else if(seatClass=="퍼스트"){
			seatClass = "FIRST";

		}
	});
 //성인이 설정되었을 때 값 세팅
 	$("#adultAdd").on("click", function(event){

 		let oAdult = $("#adult").val();
 		adult = parseInt(oAdult)+1;
 		console.log(adult);
 	});
 //성인이 설정되었을 때 값 세팅
 	$("#adultDec").on("click", function(event){

 		let oAdult = $("#adult").val();
 		adult = parseInt(oAdult)-1;
 		console.log(adult);
 	});
 //유아가 설정되었을 때 값 세팅
 	$("#childrenAdd").on("click", function(event){

 		let oChildren = $("#children").val();
 		children = parseInt(oChildren)+1;
 		console.log(children);
 	});
 //유아가 설정되었을 때 값 세팅
 	$("#childrenDec").on("click", function(event){

 		let oChildren = $("#children").val();
 		children = parseInt(oChildren)-1;
 		console.log(children);
 	});

 //직항 체크 여부 세팅
 	$("#nonStop").on("change", function(event){

    if($(this).is(":checked")){ //대상이 체크 되어 있을 때

       	nonStop = true;
    	console.log(nonStop);

    }else{ //대상이 체크 해제 되어 있을 때

       nonStop = false;
       console.log(nonStop);
    }

});


 let searchResultArea = $("#searchResultArea");



/*
	출국편정보	flgtInfoArray[i].itineraries[0].duration -소요시간
		  	flgtInfoArray[i].itineraries[0].segments[0].carrierCode -항공편명
			flgtInfoArray[i].itineraries[0].segments[0].number - 항공편명(번호)
		  	flgtInfoArray[i].itineraries[0].segments[0].departure.iataCode -출발공항
		  	flgtInfoArray[i].itineraries[0].segments[0].departure.terminal -터미널
		  	flgtInfoArray[i].itineraries[0].segments[0].departure.at - 출발날짜 시간

	귀국편정보 	flgtInfoArray[i].itineraries[1].duration -소요시간
	  		flgtInfoArray[i].itineraries[1].segments[0].carrierCode -항공편명
		    flgtInfoArray[i].itineraries[1].segments[0].number - 항공편명(번호)
		    flgtInfoArray[i].itineraries[1].segments[0].departure.iataCode -출발공항
		    flgtInfoArray[i].itineraries[1].segments[0].departure.terminal -터미널
		    flgtInfoArray[i].itineraries[1].segments[0].departure.at - 출발날짜 시간
	가격정보      flgtInfoArray[i].price.currency + flgtInfoArray[i].price.total
	운항항공사   flgtInfoArray[i].validatingAirlineCodes

*/


function fn_searchFlight(){
//  Amadeus API
    fetch("https://test.api.amadeus.com/v1/security/oauth2/token", {
    	  body: "grant_type=client_credentials&client_id=<api키>&client_secret=<api키>",
    	  headers: {
    	    "Content-Type": "application/x-www-form-urlencoded"
    	  },
    	  method: "POST"
    	}).then((response) => response.json())
			// 위 fetch결과. 토큰알려줌.
    	  .then((data) => {
    		  console.log("TOKEN:",data);
    		  console.log("TOKEN:",data.access_token);
    		  console.log("TOKEN:","'Bearer "+data.access_token+"'");
    		  tokenData = '"Bearer '+data.access_token+'"';
    		  console.log("data",data);

    		    fetch("https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode="+originLocationCode+"&destinationLocationCode="+destinationLocationCode+"&departureDate="+departureDate+"&returnDate="+returnDate+"&adults="+adult+"&children="+children+"&travelClass="+seatClass+"&nonStop="+nonStop+"&currencyCode=KRW&max=20", {
    		    	  headers: {
    		    	    Authorization: tokenData
    		    	  }
    		    	}).then((response) => response.json())
    		  	  .then((data) => {
    		  		    //출력하려는 부분

    		  		    let html ='';
   		  	    	 	let flgtInfoArray = data.data;
   		  		  		console.log(flgtInfoArray);


   		  				html += '<section class="py-9">   ';
   		  				html += '<div  class="container">   ';
   		  				html += '<div class="table-dashboard mb-7">          ';
   		  				html += '<div class="row">                           ';
		  				html += '<div class="col-12">                        ';
   		  				html += '<h2 class="text-uppercase mb-3">검색결과</h2>';
   		  				html += '<table class="table table-hover">           ';
   		  				html += '<tbody>                                     ';

	    		  		// 검색결과(왕복) 한 건씩 처리하는 for문
	    		  		for(let i=0;i<flgtInfoArray.length; i++){

		    		  		html += '<tr>                                                                                             ';
		    		  		html += '<th scope="row">			                                                                     ';
		    		  		html += '<div>                                                                      ';
		    		  		html += '<span>                                                                           ';

		    		  		if(flgtInfoArray[i].validatingAirlineCodes[0] == 'OZ'){
		    		  			html += '<img src="${pageContext.request.contextPath }/resources/images/asianaFullLogo.png" alt="AsianaAir" style="width:120px; height:60px">  ';
		    		  		}
		    		  		else if(flgtInfoArray[i].validatingAirlineCodes[0] == 'KE'){
		    		  			html += '<img src="${pageContext.request.contextPath }/resources/images/Korean-Air-logo.jpg" alt="KoreanAir" style="width:120px; height:60px">  ';
		    		  		}
		    		  		else if(flgtInfoArray[i].validatingAirlineCodes[0] == 'AF'){
		    		  			html += '<img src="${pageContext.request.contextPath }/resources/images/airFranceLogo.png" alt="AirFrance" style="width:120px; height:60px">  ';
		    		  		}
		    		  		else {

		    		  			html += '<img src="${pageContext.request.contextPath }/resources/images/Korean-Air-logo.jpg" alt="KoreanAir" style="width:120px; height:60px">  ';
		    		  		}


		    		  		html += '</span>                                                                                          ';
		    		  		html += '</div>                                                                                           ';
		    		  		html += '</th>                                                                                            ';
		    		  		html += '<td class="second-child" style="padding:5px">  ';
		    		  		html += '<div >                                                                                            ';
		    		  		html += '<p style="width:50px" class="hover-text-info">'+flgtInfoArray[i].itineraries[0].segments[0].departure.iataCode+'</p>';
		    		  		html += '<h2 style="color:black">'+flgtInfoArray[i].itineraries[0].segments[0].departure.at.substr(11,5)+'</h2>				 ';
		    		  		html += '</div>																							 ';
							html += '<div style="width:170px; padding-left: 85px"> 													 ';
							html += '<p class="hover-text-info" >'+flgtInfoArray[i].itineraries[0].duration.substr(2).replace("H", "시간").replace("M", "분")+'</p>    ';
							html += '<i class="fa fa fa-plane" aria-hidden="true"></i>  																			 ';
							html += '</div>                                             																			 ';
							html += '<div >                                            																				 ';
							html += '<p class="hover-text-info" style="width:130px; padding-left:50%">'+flgtInfoArray[i].itineraries[0].segments[0].arrival.iataCode+'</p>                 				 ';
							html += '<h2 style="color:black">'+flgtInfoArray[i].itineraries[0].segments[0].arrival.at.substr(11,5)+' </h2>                          		             ';
							html += '</div>                                                                                                                          ';
							html += '</td>                                                                                                                           ';
							html += '<td class="second-child" style="padding:5px">                                                                                     ';
							html += '<div>                                                                                                                           ';
							html += '<p class="hover-text-info" style="width:50px">'+flgtInfoArray[i].itineraries[1].segments[0].departure.iataCode+'</p>                               ';
							html += '<h2 style="color:black">'+flgtInfoArray[i].itineraries[1].segments[0].departure.at.substr(11,5)+'</h2>                                              ';
							html += '</div>                                                                                                                            ';
							html += '<div style="width:170px; padding-left: 85px">                                                                                 ';
							html += '<p class="hover-text-info" >'+flgtInfoArray[i].itineraries[1].duration.substr(2).replace("H", "시간").replace("M", "분")+'</p>       ';
							html += '<i class="fa fa fa-plane" aria-hidden="true"></i>                                                                                 ';
							html += '</div>                                                                                                                            ';
							html += '<div>                                                                                                                             ';
							html += '<p class="hover-text-info" style="width:130px; padding-left:50%">'+flgtInfoArray[i].itineraries[1].segments[0].arrival.iataCode+'</p>                                   ';
							html += '<h2 style="color:black">'+flgtInfoArray[i].itineraries[1].segments[0].arrival.at.substr(11,5)+'</h2>                                                  ';
							html += '</div>                                                                                                                            ';
							html += '</td>                                                                                                                             ';
		    		  		html += '<td>                                                                                                                              ';
		    		  		html += '<ul class="list-unstyled">                                                                                                        ';
		    		  		html += '<li class="">                                                                                                                     ';
		    		  		html += '<h2 class="text-info">'+flgtInfoArray[i].price.currency.replace("KRW", "￦")+''+flgtInfoArray[i].price.total.substring(0,7)+'</h2> ';
		    		  		html += '</li>                                                                                                                             ';
		    		  		html += '</ul>                                                                                                                             ';
		    		  		html += '</td>																							                                   ';
		    		  		html += '</tr>                                                                                                                             ';


	    		  			console.log("*************************************************************************");
	    		  			console.log("출국편소요시간: ", (flgtInfoArray[i].itineraries[0].duration).substr(2).replace('H', '시간').replace('M', '분'));
	    		  			console.log("항공편명+(번호): ", flgtInfoArray[i].itineraries[0].segments[0].carrierCode, flgtInfoArray[i].itineraries[0].segments[0].number);
	    		  			console.log("출발공항: ", flgtInfoArray[i].itineraries[0].segments[0].departure.iataCode);
	    		  			console.log("터미널: ", flgtInfoArray[i].itineraries[0].segments[0].departure.terminal);
	    		  			console.log("출발날짜 시간: ", flgtInfoArray[i].itineraries[0].segments[0].departure.at.substr(11,5));
	    		  			console.log("--------------------------------------------------------------------------");
	    		  			console.log("귀국편소요시간: ", flgtInfoArray[i].itineraries[1].duration.substr(2).replace('H', '시간').replace('M', '분'));
	    		  			console.log("항공편명+(번호): ", flgtInfoArray[i].itineraries[1].segments[0].carrierCode, flgtInfoArray[i].itineraries[0].segments[0].number);
	    		  			console.log("출발공항: ", flgtInfoArray[i].itineraries[1].segments[0].departure.iataCode);
	    		  			console.log("터미널: ", flgtInfoArray[i].itineraries[1].segments[0].departure.terminal);
	    		  			console.log("출발날짜 시간: ", flgtInfoArray[i].itineraries[1].segments[0].departure.at.substr(11,5));
	    		  			console.log("운항항공사 : ", flgtInfoArray[i].validatingAirlineCodes[0]);
	    		  			console.log("가격정보 : ", flgtInfoArray[i].price.currency.replace('KRW', '￦'), flgtInfoArray[i].price.total.substring(0,7));
	    		  			console.log("*************************************************************************");

    		  		  }

	    		  		html += '</tbody> ';
						html += '</table> ';
						html += '</div>   ';
						html += '</div>   ';
						html += '</div>   ';
						html += '</div>   ';
						html += '</section>   ';

						$("#searchResult").empty();
	    		  		$("#searchResult").append(html);





    		  	  });

			});
    };

</script>