<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="">
	<div class="row">
		<div class="col-md-6 col-lg-12">
			<div class="bg-smoke border border-light-gray rounded p-3 mb-4">
				<h3 class="mb-4">Search</h3>
				<form class="form-subscribe mb-3" action="index.html" method="post">
					<div class="input-group input-group-sm">
						<input type="email" class="form-control form-control-sm border-0"
							required="" placeholder="">
						<button class="input-group-text border-0 btn bg-primary"
							type="submit">
							<i class="fa fa-search text-white" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
			
			<div class="col-md-6 col-lg-12 d-none d-md-block">
				<div class="bg-smoke border border-light-gray rounded p-3 mb-4">
					<h3 class="mb-4">Categories</h3>
						<ul class="list-unstyled list-group list-group-flush">
							<li
								class="list-group-item bg-transparent border-off-white border-top-0 p-0">
								<a href="" class="d-flex text-dark hover-text-primary py-3"> <span>동행게시판</span>
									<small class="ms-auto font-weight-bold">(9)</small>
							</a>
							</li>
		
							<li
								class="list-group-item bg-transparent border-off-white border-top-0 p-0">
								<a href="" class="d-flex text-dark hover-text-primary py-3"> <span>장터게시판</span>
									<small class="ms-auto font-weight-bold">(7)</small>
							</a>
							</li>
		
							<li
								class="list-group-item bg-transparent border-off-white border-top-0 p-0">
								<a href="" class="d-flex text-dark hover-text-primary py-3"> <span>여행지 질문게시판</span>
									<small class="ms-auto font-weight-bold">(5)</small>
							</a>
							</li>
						</ul>
					</div>
		
				</div>
			
			
			


<!-- 			<div class="d-none d-md-block"> -->
<!-- 				<div class="mb-4"> -->
<!-- 					<ul class="nav nav-tabs nav-justified blog-tabs" id="myTab" -->
<!-- 						role="tablist"> -->
<!-- 						<li class="nav-item"><a class="nav-link active" -->
<!-- 							id="recent-tab" data-bs-toggle="tab" href="#recent" role="tab" -->
<!-- 							aria-controls="recent" aria-selected="true">Recent</a></li> -->

<!-- 						<li class="nav-item"><a class="nav-link" id="popular-tab" -->
<!-- 							data-bs-toggle="tab" href="#popular" role="tab" -->
<!-- 							aria-controls="popular" aria-selected="false">Popular</a></li> -->

<!-- 						<li class="nav-item"><a class="nav-link" id="new-tab" -->
<!-- 							data-bs-toggle="tab" href="#new" role="tab" aria-controls="new" -->
<!-- 							aria-selected="false">New</a></li> -->
<!-- 					</ul> -->

<!-- 					<div -->
<!-- 						class="tab-content bg-smoke border border-light-gray border-top-0 rounded-bottom px-3 py-5" -->
<!-- 						id="myTabContent"> -->
<!-- 						<div class="tab-pane fade show active" id="recent" role="tabpanel" -->
<!-- 							aria-labelledby="recent-tab"> -->
<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Totam rem apriam eaque. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Pitter soan smeeit herick. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Amanda disuja carl parkar. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="media meta-post-sm"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Rodney samp deo artich. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="tab-pane fade" id="popular" role="tabpanel" -->
<!-- 							aria-labelledby="popular-tab"> -->
<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Rodney samp deo artich. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Amanda disuja carl parkar. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Pitter soan smeeit herick. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="media meta-post-sm"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Totam rem apriam eaque. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="tab-pane fade" id="new" role="tabpanel" -->
<!-- 							aria-labelledby="new-tab"> -->
<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-02.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Pitter soan smeeit herick. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-04.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Rodney samp deo artich. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div -->
<!-- 								class="media meta-post-sm border-bottom border-off-white pb-3 mb-3"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-01.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Totam rem apriam eaque. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="media meta-post-sm"> -->
<!-- 								<div class="img-overlay rounded me-2"> -->
<!-- 									<img class="lazyestload" -->
<%-- 										data-src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<%-- 										src="${pageContext.request.contextPath }/resources/images/blog/tab-03.jpg" --%>
<!-- 										alt="Generic placeholder image"> <a href="" -->
<!-- 										class="hover-img-overlay-dark"></a> -->
<!-- 								</div> -->

<!-- 								<div class="media-body"> -->
<!-- 									<a href="" -->
<!-- 										class="text-dark hover-text-primary text-capitalize mb-1"> -->
<!-- 										Amanda disuja carl parkar. </a> -->

<!-- 									<ul class="list-unstyled d-flex flex-wrap mb-0"> -->
<!-- 										<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 											class="fas fa-calendar-alt" aria-hidden="true"></i> <span -->
<!-- 											class="ms-1 text-capitalize">5 March, 2021</span></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
</div>
