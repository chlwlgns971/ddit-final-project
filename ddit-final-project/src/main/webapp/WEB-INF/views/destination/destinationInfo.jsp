<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${destination }" var="dest" />
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${dest.destBanner});">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 500px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold">${dest.areaName }</h2>
						</div>
						<p class="text-white mb-0"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ====================================
———	CITY SECTION
===================================== -->
<section class="py-10">
	<div class="container">
		<div class="mb-6">
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-6 mb-lg-0">
						<div id="package-slider"
							class="owl-carousel owl-theme package-slider package-single">
							<div class="item">
								<img class="lazyestload" data-src="${dest.destImg1 }"
									src="${dest.destImg1 }" alt="image">
							</div>

							<div class="item">
								<img class="lazyestload" data-src="${dest.destImg2 }"
									src="${dest.destImg2 }" alt="image">
							</div>

							<div class="item">
								<img class="lazyestload" data-src="${dest.destImg3 }"
									src="${dest.destImg3 }" alt="image">
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="card card-bg-img">
						<div class="position-relative">
							<img class="card-img-top rounded lazyestload"
								data-src="${dest.destWimg }" src="${dest.destWimg }"
								alt="Card image cap">

							<div class="card-img-overlay rounded-0 d-flex flex-column">
								<div class="row">
									<div class="col-8">
										<p class="text-white mb-0">
											<span id="copy-Month"></span><span id="copy-day"></span><span
												id="copy-year"></span>
										</p>
									</div>


								</div>

								<div class="mt-auto text-center">
									<div class="mb-2">
										<img class="img-fluid"
											style="width: 100px; height: 100px; object-fit: cover;">
									</div>

									<h2 class="text-white font-weight-bold display-4 mb-4">
										<span id="curTemp"></span><sup>&#8451;</sup>
									</h2>
									<h3 class="text-white font-weight-bold mb-0">${dest.areaName }</h3>
								</div>

								<div class="mt-auto px-4 px-lg-0 px-xl-4">
									<div class="row">
										<div class="col-4">
											<ul class="list-unstyled mb-0 text-center">
												<li class="mb-1">
													<p class="text-white mb-0" id="day2"></p>
												</li>

												<li class="mb-1"><img id="imgDay2"
													style="width: 30px; height: 30px; object-fit: cover;">
												</li>

												<li>
													<p class="text-white mb-0">
														<span id="day2Temp"></span><sup>&#8451;</sup>
													</p>
												</li>
											</ul>
										</div>

										<div class="col-4">
											<ul class="list-unstyled mb-0 text-center">
												<li class="mb-1">
													<p class="text-white mb-0" id="day3"></p>
												</li>

												<li class="mb-1"><img id="imgDay3"
													style="width: 30px; height: 30px; object-fit: cover;">
												</li>

												<li>
													<p class="text-white mb-0">
														<span id="day3Temp"></span><sup>&#8451;</sup>
													</p>
												</li>
											</ul>
										</div>

										<div class="col-4">
											<ul class="list-unstyled mb-0 text-center">
												<li class="mb-1">
													<p class="text-white mb-0" id="day4"></p>
												</li>

												<li class="mb-1"><img id="imgDay4"
													style="width: 30px; height: 30px; object-fit: cover;">
												</li>

												<li>
													<p class="text-white mb-0">
														<span id="day4Temp"></span><sup>&#8451;</sup>
													</p>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section class="bg-dark-light py-7">
			<div class="container">
				<div class="row align-items-center"
					style="padding-left: 10%; padding-right: 10%;">
					<div class="col-xl-3">
						<div class="section-title-bg mb-1 mb-lg-3 mb-xl-0">
							<h1 class="text-white text-uppercase font-weight-bold mb-0">
								<span class="text-primary">${dest.areaName }</span> 여행
							</h1>
							<h2 class="text-white text-uppercase  mb-0">언제떠나세요?</h2>
						</div>
					</div>

					<div class="col-xl-9">
						<form
							action="${pageContext.request.contextPath}/calender/createCalender"
							method="GET">
							<div class="row">
								<div class="col-lg-10">
									<div class="row">
										<div class="col-md-6 col-lg-3">
											<div class="mb-3 form-group-icon mb-lg-0">
												<i class="far fa-calendar-alt" aria-hidden="true"></i> <input
													type="text" class="form-control daterange-picker"
													autocomplete="off" name="startDay" placeholder="출발일" />
											</div>
										</div>

										<div class="col-md-6 col-lg-3">
											<div class="mb-3 form-group-icon mb-lg-0">
												<i class="far fa-calendar-alt" aria-hidden="true"></i> <input
													type="text" class="form-control daterange-picker"
													autocomplete="off" name="endDay" placeholder="도착일" />
											</div>
										</div>
										<input type="hidden" name="areaCode" value="${dest.areaCode}" />
									</div>
								</div>
								<div class="col-lg-2">
									<button class="btn btn-primary text-uppercase"
										style="width: 120px;" type="submit">일정등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<div class="mb-7">
			<div id="destination">
				<div class="mb-0">
					<ul class="nav nav-tabs destination-tabs" id="destinationTab"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="Information-tab" data-bs-toggle="tab" href="#Information"
							role="tab" aria-controls="Information" aria-selected="true">INFORMATION</a>
						</li>

						<li class="nav-item"><a class="nav-link" id="attraction-tab"
							data-bs-toggle="tab" href="#attraction" role="tab"
							aria-controls="attraction" aria-selected="false">ATTRACTION</a></li>

						<li class="nav-item"><a class="nav-link" id="board-tab"
							data-bs-toggle="tab" href="#board" role="tab"
							aria-controls="board" aria-selected="false">FORUM</a></li>

						<li class="nav-item ms-md-auto">
							<ul class="list-unstyled d-flex justify-content-center mb-0">
								<li class="me-3"><a href="javascript:void(0)"
									class="text-gray-color hover-text-primary"> <i
										class="fab fa-facebook-f" aria-hidden="true"></i>
								</a></li>

								<li class="me-3"><a href="javascript:void(0)"
									class="text-gray-color hover-text-primary"> <i
										class="fab fa-twitter" aria-hidden="true"></i>
								</a></li>

								<li class="me-3"><a href="javascript:void(0)"
									class="text-gray-color hover-text-primary"> <i
										class="fab fa-google-plus-g" aria-hidden="true"></i>
								</a></li>

								<li class="me-3"><a href="javascript:void(0)"
									class="text-gray-color hover-text-primary"> <i
										class="fab fa-pinterest-p" aria-hidden="true"></i>
								</a></li>

								<li><a href="javascript:void(0)"
									class="text-gray-color hover-text-primary"> <i
										class="fab fa-vimeo-v" aria-hidden="true"></i>
								</a></li>
							</ul>
						</li>
					</ul>

					<div class="tab-content destinationTab-content"
						id="destinationTabContent">
						<div class="tab-pane show active" id="Information" role="tabpanel"
							aria-labelledby="Information-tab">
							<div class="row">
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">Intro</h3>

									<p class="mb-5">${dest.destInfo }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">언어</h3>

									<p class="mb-5">${dest.destLang }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">면적</h3>

									<p class="mb-5">${dest.destExten }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">인구</h3>

									<p class="mb-5">${dest.destPopul }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">시차</h3>

									<p class="mb-5">${dest.destTime }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">종교</h3>

									<p class="mb-5">${dest.destRelig }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">전압</h3>

									<p class="mb-5">${dest.destVolt }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">화폐</h3>

									<p class="mb-5">${dest.destCur }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">비자</h3>

									<p class="mb-5">${dest.destVisa }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">물가</h3>

									<p class="mb-5">${dest.destPrice }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">기후</h3>

									<p class="mb-5">${dest.destWeather }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">여행최적시기</h3>

									<p class="mb-5">${dest.destBtime }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">항공편</h3>

									<p class="mb-5">${dest.destAir }</p>
								</div>
								<div class="col-md-7 col-lg-8">
									<h3 class="text-uppercase mb-5">간단회화</h3>

									<p class="mb-5">${dest.destConv }</p>
								</div>




							</div>
						</div>

						<div class="tab-pane" id="attraction" role="tabpanel" aria-labelledby="attraction-tab">
							<div class="row">
								<c:forEach var="att" items="${attractionList }">
					      	<div class="col-md-6 col-lg-4">
					        	<div class="card card-transparent mb-7">
					          		<a href="blog-single-right-sidebar.html" class="position-relative">
					            		<img class="card-img-top rounded lazyestload" data-src="${att.attImg }" src="${att.attImg }" alt="Card image cap" style="width:350px; height:230px; object-fit: cover;">
					            		<div class="card-img-overlay card-hover-overlay rounded"></div>
					          		</a>
					
					          	<div class="card-body py-6">
						            <h3 class="mb-4">
						              <a href="blog-single-right-sidebar.html" class="text-capitalize text-dark hover-text-primary">${att.attNam }</a>
						            </h3>
					
					            	<p class="mb-0">${att.attInfo }</p>
					          	</div>
					
					          	<div class="card-footer px-5">
					            	<button type="button" class="btn btn-sm btn-outline-secondary text-uppercase" data-bs-toggle="modal" data-bs-target="#view${att.attNum }">
			  							View
									</button>
					          	</div>
					        	</div>
					        	<!-- The Modal -->
								<div class="modal" id="view${att.attNum }">
									<div class="modal-dialog">
									    <div class="modal-content">
									      <!-- Modal Header -->
									      <div class="modal-header">
									        <h4 class="modal-title">${att.attNam }</h4>
									        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									      </div>
									
									      <!-- Modal body -->
									      <div class="modal-body">
									      	<label>${att.attNam }이미지</label>
									      	<div>
									      		<img class="card-img-top rounded lazyestload" data-src="${att.attImg }" src="${att.attImg }" alt="Card image cap" style="width:350px; height:230px; object-fit: cover; margin-left: 10%"/>
									      	</div>
									      	<br>
									      	<label>${att.attNam } 설명</label>
									      	<div>
									      		<p>${att.attInfo }</p>
									      	</div>
									      	<br>
									      	<label>주소</label>
									      	<div><p>${att.attAddr }</p></div>
									      	<br>
									      	<label>이용시간</label>
									      	<div><p>${att.attUsetim }</p></div>
									      	<br>
									      </div>
									    </div>
									 </div>
								</div>
					      	</div>
					      </c:forEach>
						</div>
						</div>
						<div class="tab-pane" id="board" role="tabpanel"
							aria-labelledby="board-tab">
							<!--               게시판 여기에 넣으시면 됩니다. -->
							<div class="col-12">
								<table class="table table-hover table-strip">
									<thead>
										<tr class="table-dashboard mb-7">
											<th style="padding-left: 5px;" class="col-1">No.</th>
											<th style="padding-left: 5px; text-align: center;"
												class="col-6">제목</th>
											<th style="padding-left: 5px; text-align: center;"
												class="col-1">조회수</th>
											<th style="padding-left: 5px; text-align: center;"
												class="col-2">작성자</th>
											<th style="padding-left: 5px; text-align: center;"
												class="col-2">작성일</th>
										</tr>
									</thead>
									<tbody id="listBody">
									</tbody>
								</table>
								<form id="searchForm">
									<input type="hidden" name="page" /> <input type="hidden"
										name="searchType" /> <input type="hidden" name="searchWord" />
								</form>
								<div class="pagingArea "></div><br>
								<!-- (제목-title, 작성자-writer, 내용-content, 전체) -->
								<div id="searchUI" class="row g-3 justify-content-center">
									<div class="col-auto">
										<select name="searchType" class="form-select">
											<option value="">전체</option>
											<option value="title">제목</option>
											<option value="writer">작성자</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="col-4">
										<input type="text" name="searchWord" placeholder="검색키워드"
											class="form-control" value="" />
									</div>
									<div class="col-auto">
										<input type="button" value="검색" id="searchBtn"
											class="btn btn-primary" /> <a class="btn btn-primary"
											href="<c:url value='/article/destArticleForm/${dest.areaCode }'/>">글쓰기</a>
									</div>
								</div>
							</div>

							<!-- 			무곤이가 작업할 공간 -->

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="mb-0">
			<h3 class="text-uppercase mb-5">더 많은 여행상품 보기</h3>

			<div class="row">
				<div class="col-md-6 col-lg-4">
					<div
						class="media media-hoverable justify-content-center mb-5 mb-lg-0">
						<div class="media-content">
							<img class="media-img lazyestload"
								data-src="${pageContext.request.contextPath }/resources/images/packages/package-related-01.jpg"
								src="${pageContext.request.contextPath }/resources/images/packages/package-related-01.jpg"
								alt="Generic placeholder image"> <a
								href="${pageContext.request.contextPath }/prod/airline"
								class="media-img-overlay">
								<div class="overlay-content">
									<h3 class="text-uppercase font-weight-bold mb-3">항공권 바로가기</h3>
									<p class="text-white text-capitalize mb-4">Airline ticket</p>

									<button type="button"
										onclick="location.href='${pageContext.request.contextPath }/prod/airline"
										class="btn btn-xs btn-sale btn-outline-primary text-uppercase">
										View more</button>
								</div>
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div
						class="media media-hoverable justify-content-center mb-5 mb-lg-0">
						<div class="media-content">
							<img class="media-img lazyestload"
								data-src="${pageContext.request.contextPath }/resources/images/packages/package-related-02.jpg"
								src="${pageContext.request.contextPath }/resources/images/packages/package-related-02.jpg"
								alt="Generic placeholder image"> <a
								href="${pageContext.request.contextPath }/prod/hotelList"
								class="media-img-overlay">
								<div class="overlay-content">
									<h3 class="text-uppercase font-weight-bold mb-3">호텔상품 바로가기</h3>
									<p class="text-white text-capitalize mb-4">Hotel</p>

									<button type="button"
										onclick="location.href='${pageContext.request.contextPath }/prod/hotelList"
										class="btn btn-xs btn-sale btn-outline-primary text-uppercase">
										View more</button>
								</div>
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="media media-hoverable justify-content-center">
						<div class="media-content">
							<img class="media-img lazyestload"
								data-src="${pageContext.request.contextPath }/resources/images/packages/package-related-03.jpg"
								src="${pageContext.request.contextPath }/resources/images/packages/package-related-03.jpg"
								alt="Generic placeholder image"> <a
								href="${pageContext.request.contextPath }/prod/rentcarList"
								class="media-img-overlay">
								<div class="overlay-content">
									<h3 class="text-uppercase font-weight-bold mb-3">렌트카 상품 바로가기</h3>
									<p class="text-white text-capitalize mb-4">Rent Car</p>

									<button type="button"
										onclick="location.href='${pageContext.request.contextPath }/prod/rentcarList"
										class="btn btn-xs btn-sale btn-outline-primary text-uppercase">
										View more</button>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
  	city = "${dest.areaName}";
	cpath = "${pageContext.request.contextPath}";
	let artCCode= "${dest.areaCode }";
		 
		let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
			let inputTags = searchUI.find(":input[name]");
			$.each(inputTags, function(index, inputTag) {
				let name = $(this).attr("name");
				let value = $(this).val();
				searchForm.get(0)[name].value = value;
			});
			searchForm.submit();
		});
		
		let pageTag = $("[name=page]");
		let listBody = $("#listBody");
		
		
		
		
		let pagingArea = $(".pagingArea").on("click", "a", function(event) {
			event.preventDefault();
			let page = $(this).data("page");
			if (!page)
				return false;
			pageTag.val(page);
			searchForm.submit();
			return false;
		});

		let makeTrTag = function(article) {
			let tr = $("<tr>");
			let aTag = $("<a>").attr("href",
					"${pageContext.request.contextPath}/article/article/" + article.artNum)
					.text(article.artTitle);

			tr
					.append(
							$("<td style='padding-left: 5px;' class='col-1'>")
									.html(article.artNum),
							$(
									"<td style='padding-left: 5px; text-align: center;' class='col-5'>")
									.html(aTag),
							$(
									"<td style='padding-left: 5px; text-align: center;' class='col-1'>")
									.html(article.artHit),
							$(
									"<td style='padding-left: 5px; text-align: center;' class='col-2'>")
									.html(article.accId),
							$(
									"<td style='padding-left: 5px; text-align: center;' class='col-2'>")
									.html(article.artDate));
			return tr;
		}

		let searchForm = $("#searchForm").on(
				"submit",
				function(event) {
					event.preventDefault();
					let url = '${cPath}/destination/view/'+artCCode;
					let method = 'GET';
					let data = $(this).serialize();
					$.ajax({
						url: url,
						method: method,
						data : data,
						dataType : "json",
						success: function(pagingVO) {
							listBody.empty();
							pagingArea.empty();
							pageTag.val("");
							let articleList = pagingVO.dataList;
							let trTags = [];
							if (articleList.length > 0) {
								$.each(articleList, function(index, article) {
									let tr = makeTrTag(article);
									trTags.push(tr);
								});
							} else {
								let tr = $("<tr>").html(
										$("<td>").attr("colspan", "7").html(
												"조건에 맞는 게시글이 없음."));
								trTags.push(tr);
							}
							listBody.append(trTags);
							let pagingHTML = pagingVO.pagingHTML;
							pagingArea.html(pagingHTML);
							}, error : function(errorResp) {
								console.log(errorResp.status);
							}
						});
							
					return false;
				}).submit();
		
	$(document).ready(function(){
		$("#board-tab").on("click",function(event){
			event.preventDefault();
			$.ajax({
				type: 'GET',
				url: '${cPath}/destination/view/'+artCCode,
				data: {"code": artCCode},
				contentType: "application/json;charset=utf-8",
				dataType:"json",
				success: function(pagingVO) {
					listBody.empty();
					pagingArea.empty();
					pageTag.val("");
					let articleList = pagingVO.dataList;
					let trTags = [];
					if (articleList.length > 0) {
						$.each(articleList, function(index, article) {
							let tr = makeTrTag(article);
							trTags.push(tr);
						});
					} else {
						let tr = $("<tr>").html(
								$("<td>").attr("colspan", "7").html(
										"조건에 맞는 게시글이 없음."));
						trTags.push(tr);
					}
					listBody.append(trTags);
					let pagingHTML = pagingVO.pagingHTML;
					pagingArea.html(pagingHTML);
					}, error : function(errorResp) {
						console.log(errorResp.status);
					}
				});
					
			return false;
		}).submit();

		
	});	
		
	
	
	
  </script>
