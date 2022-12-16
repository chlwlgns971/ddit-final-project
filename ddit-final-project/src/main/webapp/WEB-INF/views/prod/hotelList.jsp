<%@page import="kr.or.ddit.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<security:authentication property="principal" var="principal" />
<div class="main-wrapper packages-list-left-sidebar">

	<!-- ====================================
———	PAGE TITLE
===================================== -->
	<section class="page-title">
		<div class="page-title-img bg-img bg-overlay-darken"
			style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg12.jpg);">
			<div class="container">
				<div class="row align-items-center justify-content-center"
					style="height: 200px;">
					<div class="col-lg-6">
						<div class="page-title-content">
							<div class="title-border">
								<h2 class="text-uppercase text-white font-weight-bold">호텔</h2>
							</div>
							<p class="text-white mb-0"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- ====================================
———	PACKAGES SECTION
===================================== -->
	<section class="bg-smoke py-10">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="row">
						<form id="searchForm" name="searchForm" method="post"
							action="${pageContext.request.contextPath }/prod/hotelList">
							<security:csrfInput />
							<div class="col-md-6 col-lg-12">
								<div
									class="mb-6 bg-white px-3 py-6 border-top border-top-5 border-primary rounded">

									<h4 class="text-uppercase font-weight-bold">머무를 곳을 찾아보세요</h4>
									<div class="mb-5">
										<div class="select-default select-category-1">
											<select id="continentsSelect" class="select-option"
												required="true">
												<option>대륙을 선택하세요.</option>


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

									<div class="mb-5">
										<div class="select-default select-category-1">
											<select id="countrySelect" name="countrySelect"
												class="select-option" required>
												<option>국가를 선택하세요.</option>

											</select>
										</div>
									</div>

									<div class="mb-5">
										<div class="select-default select-category-1">
											<input type="hidden" name="savedCityName" id="savedCityName"
												value="" /> <select id="citySelect" class="select-option"
												name="cityName" required>
												<option>도시를 선택하세요.</option>

											</select>
										</div>
									</div>



									<div
										class="form-group form-group-icon form-group-icon-dark mb-5">
										<input type="date"
											class="form-control daterange-picker sidebar-daterange-picker text-uppercase"
											name="resSdate" autocomplete="off"
											value="${pagingVO.detailMap.resSdate }"
											data-placeholder="체크인" required aria-required="true" />
									</div>

									<div
										class="form-group form-group-icon form-group-icon-dark mb-5">
										<input type="date"
											class="form-control daterange-picker sidebar-daterange-picker text-uppercase"
											name="resEdate" autocomplete="off"
											value="${pagingVO.detailMap.resEdate}"
											data-placeholder="체크아웃" required aria-required="true" />
									</div>

									<div class="form-group mb-5">
										<div class="row align-items-center">
											<label
												class="control-label count-control-label col-5 col-lg-12 col-xl-4 text-uppercase mb-0 mb-lg-4 mb-xl-0 text-lg-center">투숙객</label>

											<div class="col-7 col-lg-12 col-xl-7">
												<div class="count-input me-0 mx-lg-auto me-xl-0">
													<a class="incr-btn decrease" data-action="decrease"
														href="javascript:void(0)">–</a>
<%-- 													<c:if test="${empty pagingVO.detailMap.romGuest}"> --%>
<%-- 														<c:set var="guest" value="1"></c:set> --%>
<%-- 													</c:if> --%>
<%-- 													<c:if test="${not empty pagingVO.detailMap.romGuest}"> --%>
<%-- 														<c:set var="guest" value="${pagingVO.detailMap.romGuest }"></c:set> --%>
<%-- 													</c:if> --%>

													<input id="guest" class="quantity" type="number"
														value="${pagingVO.detailMap.guest}" name="guest"> <a
														class="incr-btn increase" data-action="increase"
														href="javascript:void(0)">+</a>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group mb-5">
										<div class="row align-items-center">
											<label
												class="control-label count-control-label col-5 col-lg-12 col-xl-4 text-uppercase mb-0 mb-lg-4 mb-xl-0 text-lg-center">객실</label>

											<div class="col-7 col-lg-12 col-xl-7">
												<div class="count-input me-0 mx-lg-auto me-xl-0">
													<a class="incr-btn" data-action="decrease"
														href="javascript:void(0)">–</a> <input id="room"
														class="quantity" type="number"
														value="${pagingVO.detailMap.prodQty }" name="room">
													<a class="incr-btn" data-action="increase"
														href="javascript:void(0)">+</a>
												</div>
											</div>
										</div>
									</div>

									<div class="d-grid">
										<button type="submit" id="searchBtn"
											class="btn btn-block btn-xs btn-outline-secondary text-uppercase">호텔
											검색</button>
									</div>
								</div>
							</div>



							<div class="col-md-6 col-lg-12">
								<div
									class="mb-6 bg-white p-3 pt-6 border-top border-top-5 border-primary rounded">
									<h4 class="text-uppercase font-weight-bold">필터</h4>

									<div class="accordion" id="accordionOne">
										<div class="card">
											<div class="card-header" id="headingOne">
												<h5 class="icon-bg" data-bs-toggle="collapse"
													data-bs-target="#collapseOne" aria-expanded="true"
													aria-controls="collapseOne">
													<span>침대종류</span>
												</h5>
											</div>

											<div id="collapseOne" class="collapse show"
												aria-labelledby="headingOne" data-bs-parent="#accordionOne">
												<div class="card-body">
													<div class="form-check custom-form-check">
														<input class="form-check-input bedType" type="checkbox"
															name="romBed" value="트윈베드" id="flexCheckDefault1">
														<label class="form-check-label" for="flexCheckDefault1">
															트윈베드 </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input bedType" type="checkbox"
															name="romBed" value="더블베드" id="flexCheckDefault2">
														<label class="form-check-label" for="flexCheckDefault2">
															더블베드 </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input bedType" type="checkbox"
															name="romBed" value="퀸베드" id="flexCheckDefault3">
														<label class="form-check-label" for="flexCheckDefault3">
															퀸베드 </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input bedType" type="checkbox"
															name="romBed" value="킹베드" id="flexCheckDefault4">
														<label class="form-check-label" for="flexCheckDefault4">
															킹베드 </label>
													</div>

												</div>
											</div>
										</div>

										<div class="card">
											<div class="card-header" id="headingTwo">
												<h5 class="icon-bg collapsed" data-bs-toggle="collapse"
													data-bs-target="#collapseTwo" aria-expanded="false"
													aria-controls="collapseTwo">
													<span>객실 편의시설 및 서비스</span>
												</h5>
											</div>

											<div id="collapseTwo" class="collapse"
												aria-labelledby="headingTwo" data-bs-parent="#accordionOne">
												<div class="card-body">
													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romPet" value="yes" id="flexCheckDefault6">
														<label class="form-check-label" for="flexCheckDefault6">
															반려동물 동반 가능 </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romSho" value="yes" id="flexCheckDefault7">
														<label class="form-check-label" for="flexCheckDefault7">
															욕조 </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romInt" value="yes" id="flexCheckDefault8">
														<label class="form-check-label" for="flexCheckDefault8">
															무료wifi </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romBal" value="yes" id="flexCheckDefault9">
														<label class="form-check-label" for="flexCheckDefault9">
															발코니/테라스 </label>
													</div>


													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romTv" value="yes" id="flexCheckDefault10">
														<label class="form-check-label" for="flexCheckDefault10">
															TV </label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romAirc" value="yes" id="flexCheckDefault11">
														<label class="form-check-label" for="flexCheckDefault11">
															에어컨 </label>
													</div>
												</div>
											</div>
										</div>

										<div class="card">
											<div class="card-header" id="headingThree">
												<h5 class="icon-bg collapsed" data-bs-toggle="collapse"
													data-bs-target="#collapseThree" aria-expanded="false"
													aria-controls="collapseThree">
													<span>호텔성급</span>
												</h5>
											</div>

											<div id="collapseThree" class="collapse"
												aria-labelledby="headingThree"
												data-bs-parent="#accordionOne">
												<div class="card-body">
													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romGrade" value="5" id="flexCheckDefault12">
														<label class="form-check-label" for="flexCheckDefault12">
															<span class="text-warning"> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i>
														</span> <span class="ms-1"></span>
														</label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romGrade" value="4" id="flexCheckDefault13">
														<label class="form-check-label" for="flexCheckDefault13">
															<span class="text-warning"> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i>
														</span> <span class="ms-1"></span>
														</label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romGrade" value="3" id="flexCheckDefault14">
														<label class="form-check-label" for="flexCheckDefault14">
															<span class="text-warning"> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i>
														</span> <span class="ms-1"></span>
														</label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romGrade" value="2" id="flexCheckDefault15">
														<label class="form-check-label" for="flexCheckDefault15">
															<span class="text-warning"> <i class="fa fa-star"
																aria-hidden="true"></i> <i class="fa fa-star"
																aria-hidden="true"></i>
														</span> <span class="ms-1"></span>
														</label>
													</div>

													<div class="form-check custom-form-check">
														<input class="form-check-input" type="checkbox"
															name="romGrade" value="1" id="flexCheckDefault16">
														<label class="form-check-label" for="flexCheckDefault16">
															<span class="text-warning"> <i class="fa fa-star"
																aria-hidden="true"></i>
														</span> <span class="ms-1"></span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" name="page" />
						</form>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="mb-md-6">
						<div class="row align-items-center">
							<div class="col-md-6 col-xl-4">
								<div class="form-group mb-5 mb-md-0 bg-white">
									<div class="select-default select-category-2">
										<select class="select-option">
											<option>최신순</option>
											<option>최저가순</option>
											<option>리뷰 평점 높은순</option>
										</select>

									</div>
								</div>
							</div>
						</div>
					</div>


					<section class="bg-dark-light py-7">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-xl-3">
									<div class="section-title-bg mb-1 mb-lg-3 mb-xl-0">
										<h1 class="text-white text-uppercase mb-0">목적지</h1>
										<h2 class="text-white text-uppercase font-weight-bold mb-0">
											여행팁&<span class="text-primary">정보</span>
										</h2>
									</div>
								</div>

								<div class="col-xl-9">
									<form class="" action="index.html" method="GET">
										<div class="row">
											<div class="col-lg-10">
												<div class="row">
													<div class="col-md-6 col-lg-3">
														<p id="cityInfo"
															style="font-size: 50px; color: light grey">서울</p>
													</div>
												</div>
											</div>

											<div class="col-lg-2">
												<button class="btn btn-primary text-uppercase"
													style="width: 100px; margin-right: 10%" type="button"
													onclick="fn_citySubmit()">보기</button>
											</div>
										</div>
									</form>
								</div>
											<form id="cityInfoSearch" action="${pageContext.request.contextPath }/destination/view">
												<input type="hidden" id="newAreaCode" name="code" value="KR001">
											</form>
							</div>
						</div>
					</section>



					<div id="hotelListArea">
						<!-- 처음 호텔상품페이지 진입 시 -->
						<c:set var="hotelList" value="${pagingVO.dataList }" />

						<c:if test="${not empty hotelList }">
							<c:forEach items="${hotelList }" var="hotelList">
								<div
									class="media media-list-view media-border flex-column flex-md-row align-items-stretch mb-5">
									<div class="media-img position-relative">
										<img class="img-fluid position-relative lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg"
											src="${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg"
											alt="gallery-img"> <a class="media-img-overlay"
											data-fancybox="gallery"
											href="${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg"></a>
									</div>

									<div class="media-body">
										<div class="row">
											<div id='heart' onclick='wishList()'></div>
											<div class="col-md-7 col-xl-8 position-relative">
												<h4>
													<a class="media-title"
														href="single-hotel-right-sidebar.html">${hotelList.cinfoTitle }</a>
												</h4>
												<div class="rating-view">
													<span class="text-warning"> 
														<c:forEach var="i" begin="1" end="${hotelList.romGrade }">

															<i class='fa fa-star' aria-hidden='true'></i>
														</c:forEach>
													</span>
													
												</div>

												
											</div>

											<div class="col-md-5 col-xl-4"> <fmt:formatNumber value="${packageVO.pkgPrice}" pattern="#,###"/>
												<div class="bg-primary text-center p-3 view-details">
													<h2 class="text-white font-weight-bold h3"><fmt:formatNumber value="${hotelList.romPrice }" pattern="#,###"/>원~</h2>
													<p class="text-white text-capitalize">1박 기준</p>

													<div class="d-grid gap-2">
														<a href="#"
															onclick='openHotelView("${pageContext.request.contextPath }/prod/hotelView?cinfoNum=${hotelList.cinfoNum}")'
															class="btn btn-xs btn-outline-white btn-booking text-uppercase">상세보기</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
<!-- ====================================
———	PAGINATION
===================================== -->
		<section class="pt-5 pt-md-7">
			<div class="container" id="pagingArea">${pagingVO.pagingHTML }
			</div>
		</section>

	</section>
</div>

<script>
	//새창열기로 바꾸깅
	function openHotelView(url) {
		event.preventDefault();
		// 	alert(url);

		window.open(url, "roomView", "");

	}
	//하트 클릭 시 로그인한 아이디가 있으면 위시리스트에 등록되고, 아니면 로그인 후 이용가능합니다 메세지.
	//	$("#heart").on("click", wishList(){}); 

	// 체크인 날짜 현재날짜보다 과거 선택 불가
	// 체크아웃 날짜 체크인 날짜보다 커야함 

	// 투숙인원이 2의 배수 이상이 되면 객실이 +1 되는 로직 구현
	let guest = $("#guest"); //투숙인원수
	guest.val("1");
	let roomCount = $("#room");
	roomCount.val("1");
	$(".incr-btn.increase").on("click", function(event) { //인원 버튼에 클릭이벤트 발생시 작동하는 함수
		if (parseInt(guest.val()) % 2 == 0) {
			roomCount.val(parseInt(roomCount.val()) + 1);
		}
	});

	//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
	$("#continentsSelect").on('change',function(event) {
		let continentName = $(this).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/prod/hotelList/country",
			data : {
			name : continentName
		},
		dataType : "json",
		success : function(resp) {
			$('#countrySelect').find("option").remove(); //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
			let nationsList = resp;
			let options = [];

			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"국가를 선택하세요"));

			$.each(nationsList, function(index,
					category) {
				let option = $("<option>").attr(
						"value", category.catCode)
						.text(category.catNam);
				options.push(option);
			})
			$('#countrySelect').append(options);
			$('#countrySelect').selectric('init'); //selectric 초기화
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});

	//국가 선택하면 국가에 속한 도시리스트 가져오기
	$("#countrySelect").on('change',function(event) {
		let countryName = $(this).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/prod/hotelList/city",
			data : {
				name : countryName
			},
			dataType : "json",
			success : function(resp) {
				$('#citySelect').find("option").remove();
				let nationsList = resp;
				let options = [];
				options.push($("<option>").attr(
						"value", "000").prop(
						"selected", true).text(
						"도시를 선택하세요"));
				$.each(nationsList, function(index,
						category) {
					let option = $("<option>").attr(
							"value", category.catCode)
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
	$("#countrySelect").val("${pagingVO.detailMap.cityName}").attr("selected",
			"selected");

	$("select[name=searchArea]").change(function() {
		console.log($(this).val()); //value값 가져오기
		console.log($("select[name=cityName] ")); //text값 가져오기
	});

	let citySelect = document.getElementById("citySelect");
	let newAreaCode = document.getElementById("newAreaCode");
	let cityInfo = document.getElementById("cityInfo");

	//선택된 옵션값의 도시명 hidden input에 담아서 detailMap으로 보내려고
	$("#citySelect").on("change", function(event) {
		// 		let hidCityName = $("#savedCityName");
		// 		hidCityName.val(citySelect.options[citySelect.selectedIndex].innerText);
		// 		console.log("hidCity:",hidCityName.val());
		// 		console.log($("input[type=hidden][name=savedCityName]").val());
		let cityCode = citySelect.value;
		let cityName = citySelect.options[citySelect.selectedIndex].innerText;
		console.log(cityCode);
		console.log(cityName);
		newAreaCode.value = cityCode;
		cityInfo.innerText = cityName;

	});

	//검색폼 결과 가져오기
	let pageTag = $("[name=page]");
	let hotelListArea = $("#hotelListArea");
	let pagingArea = $("#pagingArea").on("click", "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (!page)
			return false;
		pageTag.val(page);
		searchForm.submit();
		return false;
	});

	let makeTrTag = function(hotelList) {
		let code = "<div class='media media-list-view media-border flex-column flex-md-row align-items-stretch mb-5'>";
		code += "<div class='media-img position-relative'>";
		code += "<img class='img-fluid position-relative lazyestload' data-src='${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg' src='${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg' alt='gallery-img'>";
		code += "<a class='media-img-overlay' data-fancybox='gallery' href='${pageContext.request.contextPath }/resources/images/holets/hotel-list-01.jpg'></a>";
		code += "</div>";
		code += "<div class='media-body'>";
		code += "<div class='row'>";
		code += "<div id='heart' onclick='wishList()'></div>";
		code += "<div class='col-md-7 col-xl-8 position-relative'>";
		code += "<h4><a class='media-title' href='single-hotel-right-sidebar.html'>"
				+ hotelList.cinfoTitle + "</a></h4>";
		code += "<div class='rating-view'>";
		code += "<span class='text-warning'>"

		for (let i = 0; i < hotelList.romGrade; i++) {
			code += "<i class='fa fa-star' aria-hidden='true'></i>";
		}
		code += "</span>"
		code += "<span class='content-view text-uppercase border-right-0 ps-1'></span></div>";
		code += "<p class='mb-md-0'></p>";
		code += "<div class='date-view'>";
		// 		code += "<span>???</span>";
		// 		code += "<span>???</span>";
		code += "</div></div>";
		code += "<div class='col-md-5 col-xl-4'>";
		code += "<div class='bg-primary text-center p-3 view-details'>";
		code += "<h2 class='text-white font-weight-bold h3'>"
				+ hotelList.romPrice + "원~</h2>";
		code += "<p class='text-white text-capitalize'>1박 기준</p>";
		code += "<div class='d-grid gap-2'>";
		code += `<a href='#' onclick='openHotelView("${pageContext.request.contextPath}/prod/hotelView?cinfoNum=\${hotelList.cinfoNum}")'  class='btn btn-xs btn-outline-white btn-booking text-uppercase'>상세보기</a>`;
		code += "</div></div></div></div></div></div>";

		return code;

	}

	let searchForm = $("#searchForm").on("submit", function(event) {
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();

		//		console.log("check:",data); 
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(page) {
				console.log(page);
				console.log(page.detailMap.savedCityName);

				//$("#cityInfo").html(page.detailMap.savedCityName);

				hotelListArea.empty();
				let hotelLists = page.dataList;
				let trTags = [];
				if (hotelLists.length > 0) {
					$.each(hotelLists, function(index, hotelList) {
						let tr = makeTrTag(hotelList);
						trTags.push(tr);
					});
				}
				hotelListArea.append(trTags);
				let pagingHTML = page.pagingHTML;
				pagingArea.html(pagingHTML);
				pageTag.val("");
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		return false;
	});

	//침대타입 & 호텔성급 중복체크불가
	$(document).ready(
			function() {
				$('input[type="checkbox"][name="romBed"]').click(
						function() {
							if ($(this).prop('checked')) {
								$('input[type="checkbox"][name="romBed"]')
										.prop('checked', false);
								$(this).prop('checked', true);
							}
						});
				$('input[type="checkbox"][name="romGrade"]').click(
						function() {
							if ($(this).prop('checked')) {
								$('input[type="checkbox"][name="romGrade"]')
										.prop('checked', false);
								$(this).prop('checked', true);
							}
						});
			});

	//필터 체크드/언체크드 때마다 비동기로 재검색 결과 가져오기
	let checkBox = $(".form-check-input");
	console.log(checkBox.length);
	let searchForm2 = $("#searchForm");
	checkBox[0].addEventListener("change", searchSubmit, false);
	console.log(checkBox[0]);
	checkBox[1].addEventListener("change", searchSubmit, false);
	checkBox[2].addEventListener("change", searchSubmit, false);
	checkBox[3].addEventListener("change", searchSubmit, false);
	checkBox[4].addEventListener("change", searchSubmit, false);
	checkBox[5].addEventListener("change", searchSubmit, false);
	checkBox[6].addEventListener("change", searchSubmit, false);
	checkBox[7].addEventListener("change", searchSubmit, false);
	checkBox[8].addEventListener("change", searchSubmit, false);
	checkBox[9].addEventListener("change", searchSubmit, false);
	checkBox[10].addEventListener("change", searchSubmit, false);
	checkBox[11].addEventListener("change", searchSubmit, false);
	checkBox[12].addEventListener("change", searchSubmit, false);
	checkBox[13].addEventListener("change", searchSubmit, false);
	checkBox[14].addEventListener("change", searchSubmit, false);

	function searchSubmit() {
		searchForm.submit();
	}
	let cityInfoSearch = document.getElementById("cityInfoSearch");
	
	function fn_citySubmit(){
		cityInfoSearch.submit();
	}
</script>
