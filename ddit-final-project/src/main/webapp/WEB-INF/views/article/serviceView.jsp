<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<security:authentication property="principal" var="principal" />

<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg4.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold" id="title">고객센터</h2>
						</div>
						<p class="text-white mb-0"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="py-9">
	<div class="container">
		<div class="card card-lg card-transparent mb-8">



			<div class="card-body px-2 py-6">
				<h3 class="mb-4">${article['artTitle'] }</h3>
				<div class="meta-post-sm mb-4">
					<ul class="list-unstyled d-flex flex-wrap mb-0">
						<li class="meta-tag me-4 mb-1"><i
							class="fa fa-user text-gray-color" aria-hidden="true"></i> <a
							class="text-gray-color hover-text-primary" href=""><span
								class="ms-1 text-capitalize">${article.accId }</span> </a></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><i
							class="fas fa-calendar-alt" aria-hidden="true"></i> <span
							class="ms-1 text-capitalize">${article.artDate }</span></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><i
							class="far fa-eye" aria-hidden="true"></i> <span
							class="ms-1 text-capitalize">${article.artHit }</span></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><a class=''
							href='#' id='navbarScrollingDropdown' role='button'
							data-bs-toggle='dropdown' aria-expanded='true'
							style='color: black; float: right'> <i
								class='fas fa-ellipsis-v' aria-hidden='true'></i>
						</a>
							<ul class='dropdown-menu'
								aria-labelledby='navbarScrollingDropdown'>
								<li><c:url value="/article/articleUpdate" var="updateURL">
										<c:param name="what" value="${article['artNum'] }" />
									</c:url> <a href="${updateURL }" class='dropdown-item'>수정</a></li>
								<li><a class='dropdown-item' href='#' id="deleteBtn">삭제</a></li>
							</ul></li>
					</ul>
					<form name="deleteForm" method="post"
						action="${cPath }/article/articleDelete">
						<input type="hidden" name="artNum" value="${article['artNum'] }" />
						<input type="hidden" name="writer" value="${article['accId'] }" />
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

				</div>
				<div>${article['artCont'] }</div>

			</div>

		</div>
			<span class="font-weight-bold font-size-15" hidden="hidden">Comments</span>
		<!-- 댓글영역 -->
		<div class="mb-7 p-3 p-md-4" id="">
			<input type="button"
					class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium"
					onClick="location.href='${cPath}/article/serviceList/${article['artBCode'] }'"
					value="목록" />
		</div>

	</div>
</section>

<script type="text/javascript" defer="defer">
	//게시글 삭제 버튼 누를 시, 실행
	$("#deleteBtn").on("click", function() {
		$(document.deleteForm).submit();
	});
	
</script>
