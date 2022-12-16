<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

	<div class="main-wrapper booking-step-2">
		<section class="page-title">
			<div class="page-title-img bg-img bg-overlay-darken"
				style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg7.jpg);">
				<div class="container">
					<div class="row align-items-center justify-content-center"
						style="height: 200px;">
						<div class="col-lg-6">
							<div class="page-title-content">
								<div class="title-border">
									<h2 class="text-uppercase text-white font-weight-bold">결제
										내역 조회</h2>
								</div>
								<p class="text-white mb-0"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<div style="padding: 20px;">
		<div class="row">
			<div class="col-md-7 col-lg-8 order-1 order-md-0">

				<form action="" method="post" target="_blank">
					<div class="mb-5">
						<div class="row">
							<div>
								<img
									style="width: 300px; margin-top: 10px; margin-bottom: 10px;"
									src="${reservation.prodImg }">
							</div>


							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">상품명</label> <input type="text"
										class="form-control border-0 bg-smoke"
										value="${reservation.prodNam}">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">결제 날짜</label> <input type="text"
										class="form-control border-0 bg-smoke"
										value="${reservation.charDate}">
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">예약 날짜</label> <input type="text"
										class="form-control border-0 bg-smoke"
										value="${reservation.resDate}">
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">상품 이용 기간</label> <input type="text"
										class="form-control border-0 bg-smoke"
										value="${reservation.resSdate} ~ ${reservation.resEdate}">
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">상품 이용인원</label> <input type="text"
										class="form-control border-0 bg-smoke"
										value="${reservation.resQty}">
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label for="inputName">상품 예약 상태</label>
									<c:set var="state" value='RS' />
									<c:if test="${state eq reservation.resStt}">
										<input type="text" class="form-control border-0 bg-smoke"
											value="예약 완료">
									</c:if>
									<c:if test="${state ne reservation.resStt}">
										<input type="text" class="form-control border-0 bg-smoke"
											value="예약 예정">
									</c:if>

								</div>
							</div>

						</div>
					</div>



					<div class="d-flex justify-content-between"></div>
				</form>
			</div>

			<div class="col-md-5 col-lg-4">
				<h3 class="mb-5">결제 상세내역</h3>
				<div class="card bg-smoke mb-6 mb-md-0">
					<div class="card-body">
						<h6 class="card-title text-dark">${reservation.prodNam}</h6>

						<ul class="list-group list-group-flush">
							<li class="list-group-item bg-transparent border-top-0 px-0 py-4">
								<span><i class="far fa-calendar-alt me-1"
									aria-hidden="true"></i>From:</span> <span class="text-gray-color">${reservation.resSdate }</span>
							</li>

							<li
								class="list-group-item bg-transparent px-0 py-4 border-off-white">
								<span><i class="far fa-calendar-alt me-1"
									aria-hidden="true"></i>To:</span> <span class="text-gray-color">${reservation.resEdate }</span>
							</li>

							<li
								class="list-group-item bg-transparent px-0 py-4 border-off-white">
								<span><i class="fa fa-user me-1" aria-hidden="true"></i>인원:</span>
								<span class="text-gray-color">성인 ${reservation.resQty }명</span>
							</li>


							<li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
						</ul>
					</div>

					<div class="card-footer mt-6">
						<h2 class="mb-0">
							<span>Total:</span> 
							<span class="text-primary font-weight-bold">
								&#8361;<fmt:formatNumber value="${reservation.charPrice}" pattern="#,###" />
							</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>












