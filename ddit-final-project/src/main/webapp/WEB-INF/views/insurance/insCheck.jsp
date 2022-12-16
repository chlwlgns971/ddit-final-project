<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="charge" value="${charge }" />


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg13.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="">
							<h2 class="text-uppercase text-white font-weight-bold">결제 및 예약</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- ====================================
———	BOOKING SECTION
===================================== -->
<section class="py-8 py-md-10">
	<div class="container">
		<div class="mb-8">
		<div class="row progress-wizard">
			<div class="col-6 progress-wizard-step incomplete">
				<div class="progress">
					<div class="progress-bar"></div>
				</div>

				<div class="progress-wizard-dot">
					<div class="progress-wizard-content">
						<i class="fas fa-won-sign" aria-hidden="true"></i> <span
							class="d-block">1. 여행자보험 플랜 선택 및 가입자 정보 입력</span>
					</div>
				</div>
			</div>

			<div class="col-6 progress-wizard-step active">
				<div class="progress">
					<div class="progress-bar"></div>
				</div>

				<div class="progress-wizard-dot">
					<div class="progress-wizard-content">
						<i class="fas fa-laptop-medical" aria-hidden="true"></i> <span
							class="d-block">2. 결제 및 보험 확인</span>
					</div>
				</div>
			</div>


		</div>
	</div>
		<h2 class="text-capitalize mb-5">예약 상세</h2>

		<div class="card mb-6 mb-md-0">
			<img class="card-img-top rounded lazyestload"
				data-src="${pageContext.request.contextPath }/resources/images/booking/booking-complete.jpg"
				src="${pageContext.request.contextPath }/resources/images/booking/booking-complete.jpg" alt="Card image cap">
			<div class="card-body px-6">
				<h3 class="text-capitalize mb-5">예약 상세</h3>
			</div>
			<div class="card-footer bg-transparent">
				<div class="row">
					<div class="col-md-4">
						<ul class="list-unstyled">
							<li class="mb-2">
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="far fa-calendar-alt"
												aria-hidden="true"></i></span> <span>From:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 ps-0">
										<span class="text-gray-color">${charge['resSdate'] }</span>
									</div>
								</div>
							</li>

							<li class="mb-2">
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="far fa-calendar-alt"
												aria-hidden="true"></i></span> <span>To:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 ps-0">
										<span class="text-gray-color">${charge['resEdate'] }</span>
									</div>
								</div>
							</li>

							<li>
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="fa fa-user"
												aria-hidden="true"></i></span> <span>Guests:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 ps-0">
										<span class="text-gray-color">${charge['resQty'] }명</span>
									</div>
								</div>
							</li>
						</ul>
					</div>

					<div class="col-md-4">
						<ul class="list-unstyled">
							<li class="mb-2">
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="fas fa-map-marker-alt"
												aria-hidden="true"></i></span> <span>구매자:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
										<span class="text-gray-color">${charge['memId'] }</span>
									</div>
								</div>
							</li>
							<li class="mb-2">
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="fas fa-map-marker-alt"
												aria-hidden="true"></i></span> <span>결제코드:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
										<span class="text-gray-color">${charge['charCode'] }</span>
									</div>
								</div>
							</li>
							<li class="mb-2">
								<div class="row">
									<div class="col-5 col-md-6 col-lg-5 col-xl-4">
										<dt>
											<span class="me-1"><i class="fas fa-map-marker-alt"
												aria-hidden="true"></i></span> <span>예약코드:</span>
										</dt>
									</div>

									<div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
										<span class="text-gray-color">${charge['resCode'] }</span>
									</div>
								</div>
							</li>
						</ul>
					</div>

					<div class="col-md-4">
						<h2 class="text-center text-xl-left mb-0">
							<span>Total:</span> <span class="text-primary font-weight-bold">
							<fmt:formatNumber value="${charge['charPrice'] }" />원</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>






