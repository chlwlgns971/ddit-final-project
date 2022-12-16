<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="kmb-title">
		<h2>위시리스트</h2>
	</div>
	<div class="container">
		<!-- Table Section -->
		<div class="table-dashboard mb-7">
			<div class="wish-tab">
				<div class="wish-tab-goods" onmousedown="onmousedown(this)"
					onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)"
					onclick="location.href='${cPath }/mypage/member/personal/wishList-package'">패키지</div>
				<div>&nbsp;</div>
				<div class="wish-tab-goods" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${cPath }/mypage/member/personal/wishList-hotel'">숙소</div>
				<div>&nbsp;</div>
				<div class="wish-tab-goods" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${cPath}/mypage/member/personal/wishList-rentcar'">렌터카</div>
				<div>&nbsp;</div>
				<div class="wish-tab-goods" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${cPath}/mypage/member/personal/wishList-travelplace'">여행지</div>
				<div>&nbsp;</div>
				<div class="wish-tab-goods" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${cPath}/mypage/member/personal/wishList-festival'">
					축제</div>
			</div>
			<div class="background-color">

				<div class="container">
					<div class="row">

						<div class="col-lg-8 col-xl-9">
							<div class="row" style="margin-top: 30px; width: 137%;">
								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="${cPath}/mypage/member/personal/wishList-detailview?what=75"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${cPath}/resources/images/packages/package-03.jpg"
											src="${cPath}/resources/images/packages/package-03.jpg"
											alt="Card image cap">
											<div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<a href="single-package-right-sidebar.html"
												class="card-title text-uppercase">프랑스 패키지 투어</a>
											</h5>
											<p class="mb-5">프랑스 패키지 투어</p>
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="javascript:void(0)" data-bs-toggle="modal"
														data-bs-target="#inquiry"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="single-package-right-sidebar.html"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/home/deal/deal-02.jpg"
											src="${pageContext.request.contextPath }/resources/images/home/deal/deal-02.jpg"
											alt="Card image cap">
											<div
												class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<h5 class="">
												<a href="single-package-right-sidebar.html"
													class="card-title text-uppercase">하와이 패키지 투어</a>
											</h5>
											<p class="mb-5">하와이 패키지 투어.</p>
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="booking-step-1.html"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="single-package-right-sidebar.html"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/home/deal/deal-03.jpg"
											src="${pageContext.request.contextPath }/resources/images/home/deal/deal-03.jpg"
											alt="Card image cap">
											<div
												class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<h5>
												<a href="single-package-right-sidebar.html"
													class="card-title text-uppercase">뉴질랜드 패키지 투어</a>
											</h5>
											<p class="mb-5">뉴질랜드 패키지 투어.</p>
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="single-package-fullwidth.html"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="single-package-right-sidebar.html"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/packages/package-01.jpg"
											src="${pageContext.request.contextPath }/resources/images/packages/package-01.jpg"
											alt="Card image cap">
											<div
												class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<h5 class="">
												<a href="single-package-right-sidebar.html"
													class="card-title text-uppercase">영국 패키지 투어</a>
											</h5>

											<p class="mb-5">영국 패키지 투어.</p>

											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="single-package-fullwidth.html"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="single-package-right-sidebar.html"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/packages/package-02.jpg"
											src="${pageContext.request.contextPath }/resources/images/packages/package-02.jpg"
											alt="Card image cap">
											<div
												class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<h5 class="">
												<a href="single-package-right-sidebar.html"
													class="card-title text-uppercase">몰디브 패키지 투어</a>
											</h5>

											<p class="mb-5">몰디브 패키지 투어.</p>

											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="booking-step-1.html"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-xl-4 mb-5">
									<div class="card card-hover">
										<a href="single-package-right-sidebar.html"
											class="position-relative"> <img
											class="card-img-top lazyestload"
											data-src="${pageContext.request.contextPath }/resources/images/packages/package-03.jpg"
											src="${pageContext.request.contextPath }/resources/images/packages/package-03.jpg"
											alt="Card image cap">
											<div
												class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
											</div>
										</a>

										<div class="card-body px-4">
											<h5>
												<a href="single-package-right-sidebar.html"
													class="card-title text-uppercase">네덜란드 패키지 투어</a>
											</h5>
											<p class="mb-5">네덜란드 패키지 투어.</p>

											<div
												class="d-flex justify-content-between align-items-center">
												<div class="heart-img">
													<i class="fa fa-heart" style="color: red"></i>
												</div>
												<div>
													<a href="javascript:void(0)" data-bs-toggle="modal"
														data-bs-target="#inquiry"
														class="btn btn-xs btn-outline-secondary text-uppercase">예약하기</a>
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
            ———   PAGINATION
   ===================================== -->
				<section class="pt-5 pt-md-7">
					<div class="container">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center align-items-center">
								<li class="page-item"><a class="page-link"
									href="javascript:void(0)" tabindex="-1"> <i
										class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1"
										aria-hidden="true"></i> Previous
								</a></li>

								<li class="page-item"><a class="page-link active"
									href="javascript:void(0)">1</a></li>

								<li class="page-item"><a class="page-link"
									href="javascript:void(0)">2</a></li>

								<li class="page-item"><a class="page-link"
									href="javascript:void(0)">3</a></li>


								<li class="page-item"><a class="page-link"
									href="javascript:void(0)">Next <i
										class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1"
										aria-hidden="true"></i>
								</a></li>
							</ul>
						</nav>
					</div>
				</section>
			</div>
		</div>
	</div>