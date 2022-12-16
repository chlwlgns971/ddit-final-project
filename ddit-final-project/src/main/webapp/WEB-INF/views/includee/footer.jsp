<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
<div class="footer-bg-color py-9">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-3 mb-7 mb-lg-0">
				<a class="d-inline-block" href="${pageContext.request.contextPath }/"> 
					<img class="w-100 mb-6 lazyestload"
					data-src="${pageContext.request.contextPath }/resources/images/logo-color-sm.png"
					src="${pageContext.request.contextPath }/resources/images/logo-color-sm.png"
					alt="img">
				</a>
			</div>

			<div class="col-md-6 col-lg-3 mt-md-4 mb-7 mb-lg-0">
				<div class="title-tag">
					<h6>사업자정보</h6>
				</div>
				<ul class="list-unstyled mb-0">
					<li class="media mb-2">
						<div class="me-3">
							<i class="fa fa-home" aria-hidden="true"></i>
						</div>
						<div class="media-body">
							<a href="contact.html">대전광역시 중구 계룡로 846, 3-4층</a>
						</div>
					</li>

					<li class="media mb-2">
						<div class="me-3">
							<i class="fas fa-phone-alt" aria-hidden="true"></i>
						</div>
						<div class="media-body">
							<a href="tel:88657524332">대표전화 : 042-222-8202</a>
						</div>
					</li>

					<li class="media">
						<div class="me-3">
							<i class="far fa-envelope" aria-hidden="true"></i>
						</div>
						<div class="media-body">
							<a href="mailTo:info@star-travel.com">info@yeojung-travel.com</a>
						</div>
					</li>
				</ul>
			</div>

			<div class="col-md-6 col-lg-3 mt-lg-4 mb-7 mb-md-0">
				<div class="title-tag pb-1">
					<h6>갤러리</h6>
				</div>

				<div class="row me-auto gallery mb-2 mb-md-0">
					<div class="col-4 mb-3">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-1.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-1.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-1.jpg"></a>
							</div>
						</div>
					</div>

					<div class="col-4 mb-3">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-2.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-2.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-2.jpg"></a>
							</div>
						</div>
					</div>

					<div class="col-4 mb-3">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-3.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-3.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-3.jpg"></a>
							</div>
						</div>
					</div>

					<div class="col-4">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-4.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-4.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-4.jpg"></a>
							</div>
						</div>
					</div>

					<div class="col-4">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-5.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-5.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-5.jpg"></a>
							</div>
						</div>
					</div>

					<div class="col-4">
						<div class="media media-hover">
							<div class="content w-100">
								<img class="media-img lazyestload"
									data-src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-6.jpg"
									src="${pageContext.request.contextPath }/resources/images/home/gallery/thumb-gallery-6.jpg"
									alt="gallery-img"> <a class="media-img-overlay"
									data-fancybox="footer-gallery"
									href="${pageContext.request.contextPath }/resources/images/home/gallery/gallery-6.jpg"></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-3 mt-lg-4">
				<div class="title-tag">
					<h6>뉴스레터 구독하기</h6>
				</div>

				<p>여정의 뉴스레터를 구독하고 최신 소식을 받아보세요.</p>

				<form id="newsForm" class="mb-6" action="${pageContext.request.contextPath }/getNewsletter" method="get">
					<div class="input-group input-group-sm">
						<input type="email" name="mail"
							class="form-control form-control-sm form-transparent"
							placeholder="이메일주소를 입력해주세요." aria-label="Enter your email">
						<button id="mailBtn" class="btn border-0 btn btn-append hover-bg-primary"
							type="submit">
							<i class="fas fa-long-arrow-alt-right text-white ltr"
								aria-hidden="true"></i>
						</button>
					</div>
				</form>
				<script type="text/javascript">
					$('#newsForm').submit(function() {
						event.preventDefault();
						$.ajax({
							url : "${pageContext.request.contextPath }/getNewsletter",
							contentType : false, //contentType false를 해줌으로써 form태그에 설정해둔 MultipartType Boundary가 그대로 들어간다.
			 				data : $(this).serialize(),
							method : 'get',
							success : function(resp) {
								if(resp == 'success'){
									Swal.fire({
										title:'Success!',         // Alert 제목
										text:'등록되었습니다.',  // Alert 내용
										icon:'success',        // Alert 타입
									  	confirmButtonColor: '#1ab3e8'
									});
									$('input[name=mail]').val('');
								}
								else{
									Swal.fire({
										title:'Error!',         // Alert 제목
										text:'이미 존재하는 이메일입니다.',  // Alert 내용
										icon:'error',        // Alert 타입
									  confirmButtonColor: '#1ab3e8'
									});
								}
							},
							error : function(errorResp) {
								console.log(errorResp.status);
							}
						});
					});
				</script>
			</div>
		</div>
	</div>
</div>
<div class="copyright py-6">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6 order-1 order-md-0">
				<p class="mb-0 mb-md-0 text-md-start">
					&copy; <span id="copy-year"></span> rest4Trip
				</p>
			</div>

			<div class="col-md-6">
				<ul
					class="list-inline text-capitalize d-flex align-items-center justify-content-md-end justify-content-center mb-md-0">
					<li class="me-3"><a href="setting.html">개인정보처리방침</a></li>

					<li class="me-3"><a href="about-us.html">쿠키정책</a></li>

					<li class="me-3"><a href="contact.html">이용약관</a></li>

				</ul>
			</div>
		</div>
	</div>
</div>

<script>
	var d = new Date();
	var year = d.getFullYear();
	document.getElementById("copy-year").innerHTML = year;
</script>