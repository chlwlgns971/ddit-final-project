<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="main-wrapper packages-list-left-sidebar">



	<!-- ====================================
	———	PAGE TITLE
	===================================== -->
	<section class="page-title">
		<div class="page-title-img bg-img bg-overlay-darken"
			style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg6.jpg);">
			<div class="container">
				<div class="row align-items-center justify-content-center"
					style="height: 200px;">
					<div class="col-lg-6">
						<div class="page-title-content">
							<div class="title-border">
								<h2 class="text-uppercase text-white font-weight-bold">패키지
									여행</h2>
							</div>
							<p class="text-white mb-0"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- ====================================
	———	검색폼
	===================================== -->
	<section class="bg-smoke py-10">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-3">
					<div class="row">
						<div class="col-md-6 col-lg-12">
							<div
								class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded">
								<form class="" action="index.html" method="GET">
									<h4 class="text-uppercase font-weight-bold">어떤 여행을 꿈꾸시나요?</h4>
	
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
										<input
											type="date"
											class="form-control daterange-picker sidebar-daterange-picker"
											autocomplete="off" name="dateRange" value=""
											placeholder="출발예정일" />
									</div>
	
<!-- 									<div -->
<!-- 										class="form-group form-group-icon form-group-icon-dark mb-5"> -->
<!-- 										<input -->
<!-- 											type="date" -->
<!-- 											class="form-control daterange-picker sidebar-daterange-picker" -->
<!-- 											autocomplete="off" name="dateRange" value="" -->
<!-- 											placeholder="도착일" /> -->
<!-- 									</div> -->
	
									<div class="d-grid">
										<button type="button"
											onclick="location.href='javascript:void(0)';"
											class="btn btn-xs btn-outline-secondary text-uppercase">패키지
											검색</button>
									</div>
								</form>
							</div>
						</div>
	
						<div class="col-md-6 col-lg-12">
							<div
								class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded overflow-hidden">
								<h4 class="text-uppercase font-weight-bold">가격</h4>
	
								<div class="price-range mt-5" id="price-range">
									<div class="price-range-content mb-5">
										<span class="price-value" id="lower-value"></span> <span
											class="mx-3"><i class="fa fa-minus" aria-hidden="true"></i></span>
										<span class="price-value" id="upper-value"></span>
									</div>
	
									<div class="mb-6" id="slider-non-linear-step"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-9">
				
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
															style="font-size: 50px; color: light grey">파리</p>
													</div>
												</div>
											</div>

											<div class="col-lg-2">
												<button class="btn btn-primary text-uppercase"
													style="width: 100px; margin-right: 10%" type="button"
													onclick = "location.href='${pageContext.request.contextPath }/destination/view?code=FR001'">보기</button>
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
				
				
				
					<div class="media media-list-view flex-column flex-md-row mb-5">
						<div class="media-img position-relative">
							<img class="img-fluid position-relative lazyestload"
								data-src="${pageContext.request.contextPath }/resources/images/packages/paris-free-tour.jpg"
								src="${pageContext.request.contextPath }/resources/images/packages/paris-free-tour.jpg"
								alt="gallery-img"> <a class="media-img-overlay"
								data-fancybox="gallery"
								href="${pageContext.request.contextPath }/resources/images/packages/package-list-01.jpg"></a>
						</div>
						<div class="media-body">
							<div class="row">
								<div>
	<!-- 								<i class="fas fa-heart"></i> -->
								</div>
								<div class="col-md-7 col-xl-8 position-relative" style="margin-top:6%">
									<h4>
										<a class="media-title"
											href="single-package-right-sidebar.html">파리 자유여행</a>
									</h4>
	<!-- 								<div class="rating-view"> -->
	<!-- 									<span class="star add-rating-default"></span> -->
	<!-- 								</div> -->
									<p class="mb-md-0">낭만의 나라 파리를 8일동안 자유롭게 여행하는 상품입니다. 항공 및
										호텔 포함상품입니다.</p>
									<div>
										<br>
										<i class="fas fa-map-marker-alt"></i> &nbsp&nbsp파리 <br>
										<i class="far fa-calendar"></i> &nbsp 여행기간 8일
									</div>
								</div>
								<div class="col-md-5 col-xl-4">
									<div class="bg-primary text-center p-3 view-details" style="margin-top:20%">
										<h2 class="text-white font-weight-bold h3">￦3,500,000</h2>
										<p class="text-white text-capitalize">1인당 가격</p>
										<div class="d-grid gap-2">
											<a href="${pageContext.request.contextPath }/prod/packageView"
												class="btn btn-xs btn-outline-white btn-booking text-uppercase">상품보기
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="media media-list-view flex-column flex-md-row mb-5">
						<div class="media-img position-relative">
							<img class="img-fluid position-relative lazyestload"
								data-src="${pageContext.request.contextPath }/resources/images/packages/package-list-06.jpg"
								src="${pageContext.request.contextPath }/resources/images/packages/package-list-06.jpg"
								alt="gallery-img"> <a class="media-img-overlay"
								data-fancybox="gallery"
								href="${pageContext.request.contextPath }/resources/images/packages/package-list-06.jpg"></a>
						</div>
						<div class="media-body">
							<div class="row">
								<div>
	<!-- 								<i class="fas fa-heart"></i> -->
								</div>
								<div class="col-md-7 col-xl-8 position-relative" style="margin-top:6%">
									<h4>
										<a class="media-title"
											href="single-package-right-sidebar.html">파리 근교투어</a>
									</h4>
	<!-- 								<div class="rating-view"> -->
	<!-- 									<span class="star add-rating-default"></span> -->
	<!-- 								</div> -->
									<p class="mb-md-0">파리와 몽생미셸 베르사유궁전을 여행하는 상품입니다. 항공 및
										호텔 포함상품입니다.</p>
									<div>
										<br>
										<i class="fas fa-map-marker-alt"></i> &nbsp&nbsp파리 몽생미셸 베르사유 <br>
										<i class="far fa-calendar"></i> &nbsp 여행기간10일
									</div>
								</div>
								<div class="col-md-5 col-xl-4">
									<div class="bg-primary text-center p-3 view-details" style="margin-top:20%">
										<h2 class="text-white font-weight-bold h3">￦4,800,000</h2>
										<p class="text-white text-capitalize">1인당 가격</p>
										<div class="d-grid gap-2">
											<a href="${pageContext.request.contextPath }/prod/packageView"
												class="btn btn-xs btn-outline-white btn-booking text-uppercase">상품보기
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
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
<!-- element wrapper ends -->

	
	<!-- ====================================
		———	script
		===================================== -->
<script>
//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
$("#continentsSelect")
		.on(
				'change',
				function(event) {
					let continentName = $(this).val();
					$
							.ajax({
								url : "${pageContext.request.contextPath}/prod/hotelList/country",
								data : {
									name : continentName
								},
								dataType : "json",
								success : function(resp) {
									$('#countrySelect').find("option")
											.remove(); //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
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


</script>