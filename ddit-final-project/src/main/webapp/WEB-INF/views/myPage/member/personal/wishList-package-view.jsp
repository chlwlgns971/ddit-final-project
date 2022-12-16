<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="main-wrapper single-package-right-sidebar">

	<section class="page-title">
		<div class="page-title-img bg-img bg-overlay-darken">
			<div class="container">
				<div class="row align-items-center justify-content-center"
					style="height: 200px;">
					<div class="col-lg-6">
						<div class="page-title-content">
							<div class="">
								<h2 class="text-uppercase text-white font-weight-bold">${packageVO.prodNam}</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="py-10">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-lg-4 order-2">
					<form class="" action="index.html" method="GET">
						<div class="card border">
							<h2
								class="card-header text-uppercase text-center bg-smoke border-bottom">
								Booking</h2>

							<div class="card-body px-3 py-4">
								<div class="border-bottom mb-5">
									<div class="form-group mb-5">
										<div class="row align-items-center"
											style="margin-right: 30px;">
											<label
												class="control-label col-xl-5 text-center text-xl-right">Adult</label>

											<div class="col-xl-5">
												<div class="count-input mx-auto">
													<a class="incr-btn" data-action="decrease"
														href="javascript:void(0)">–</a> <input class="quantity"
														type="number" value="1"> <a class="incr-btn"
														data-action="increase" href="javascript:void(0)">+</a>
												</div>
											</div>

											<div class="col-xl-2">
												<p class="text-center mt-3 mt-xl-0 mb-0"></p>
											</div>
										</div>
									</div>

									<div class="form-group mb-5">
										<div class="row align-items-center"
											style="margin-right: 30px;">
											<label
												class="control-label col-xl-5 text-center text-xl-right">Child</label>

											<div class="col-xl-5">
												<div class="count-input mx-auto">
													<a class="incr-btn" data-action="decrease"
														href="javascript:void(0)">–</a> <input class="quantity"
														type="number" value="0"> <a class="incr-btn"
														data-action="increase" href="javascript:void(0)">+</a>
												</div>
											</div>

											<div class="col-xl-2">
												<p class="text-center mt-3 mt-xl-0 mb-0"></p>
											</div>
										</div>
									</div>
								</div>

								<div
									class="d-flex justify-content-between border-bottom mb-5 pb-5">
									<span class="text-uppercase h4 mb-0">Total cost</span><span
										class="font-weight-bold text-primary h3 mb-0"><br>
										<fmt:formatNumber value="${packageVO.pkgPrice}"
											pattern="#,###" /></span>
								</div>

								<div class="text-center px-4">
									<button type="button"
										onclick="location.href='booking-step-1.html';"
										class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase">
										Check Now <span class="ms-4"><i
											class="fa fa-angle-right" aria-hidden="true"></i></span>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>

				<div class="col-md-7 col-lg-8">
					<div id="package-slider"
						class="owl-carousel owl-theme package-slider">
						<div class="item">
							<img class="lazyestload"
								data-src="${cPath}/resources/images/packages/package-03.jpg"
								src="${cPath}/resources/images/packages/package-03.jpg"
								alt="image">
						</div>

						<div class="item">
							<img class="lazyestload"
								data-src="${cPath}/resources/images/packages/package-04.jpg"
								src="${cPath}/resources/images/packages/package-04.jpg"
								alt="image">
						</div>

						<div class="item">
							<img class="lazyestload"
								data-src="${cPath}/resources/images/packages/package-05.jpg"
								src="${cPath}/resources/images/packages/package-05.jpg"
								alt="image">
						</div>
					</div>

					<div class="mt-8">
						<h2 class="text-uppercase mb-5">상세설명</h2>
						<p class="mb-6">${packageVO.pkgCont}</p>

						<div class="mb-5">
							<div class="row">
								<div class="col-lg-6">
									<ul class="list-unstyled mb-0">
										<li class="media">
											<div class="text-gray-color me-2"></div>
										</li>

										<li class="media">
											<div class="text-gray-color me-2"></div>

										</li>
										<li class="media">
											<div class="text-gray-color me-2"></div>
										</li>
									</ul>
								</div>

								<div class="col-lg-6">
									<ul class="list-unstyled mb-0"></ul>
								</div>
							</div>
						</div>
					</div>

					<div class="mb-8">
						<h3 class="text-uppercase mb-5">이용 항공</h3>
						<p class="mb-5">${packageVO.pkgFlight}.</p>
						<h3 class="text-uppercase mb-5">해당 날짜</h3>
						<p class="mb-5">${packageVO.pkgSdate}~${packageVO.pkgEdate}</p>
					</div>
					<div>
					<h3 class="text-uppercase mb-5">상세 위치</h3>
						<div class="row">
							<div>
								<div id="googleMap" style="width: 100%; height: 400px;"></div>
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
		            			center:new google.maps.LatLng(48.87394125804062, 2.2950862376193437),
		            	        zoom:11
		            	};
		            	var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions );
		            	const malls = [
		            	    { label: "1", name: "업체 위치", lat: 48.87394125804062, lng: 2.2950862376193437 }
// 		            	    { label: "2", name: "고투몰", lat: 37.5062379, lng: 127.0050378 },
// 		            	    { label: "3", name: "동대문시장", lat: 37.566596, lng: 127.007702 },
// 		            	    { label: "4", name: "IFC몰", lat: 37.5251644, lng: 126.9255491 },
// 		            	    { label: "5", name: "롯데월드타워몰", lat: 37.5125585, lng: 127.1025353 },
// 		            	    { label: "6", name: "명동지하상가", lat: 37.563692, lng: 126.9822107 },
// 		            	    { label: "7", name: "타임스퀘어", lat: 37.5173108, lng: 126.9033793 },
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
							<script
								src="https://maps.googleapis.com/maps/api/js?key=<api키>&callback=initMap"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>




