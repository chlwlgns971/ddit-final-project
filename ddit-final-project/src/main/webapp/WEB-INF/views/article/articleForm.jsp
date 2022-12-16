<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg4.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold">게시글 작성</h2>
						</div>
						<p class="text-white mb-0"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="bg-smoke py-6">
	<form:form modelAttribute="article" enctype="multipart/fomr-data"
		method="POST" role="form" class="form">
		<div class="container">
			<!-- Table Section -->
			<div class="table-dashboard">
				<div class="row">
					<div class="mb-7 mb-lg-0">
						<div class="col-lg-12">
							<div class="form-group">
								<form:input path="artTitle" type="text" class="form-control"
									style="font-size: 1.2rem; background: white" placeholder="제목"
									required="required" />
							</div>
						</div>
							<div class="col-lg-12">
								<div class="form-group">
									<form:select path="artBCode"
										class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<option value="BC001">동행자 게시판</option>
										<option value="BC002">장터 게시판</option>
									</form:select>
								</div>
							</div>
						<div class="col-lg-12">
							<div class="form-group">
								<form:textarea path="artCont" id="editor"
									style="height: 500px; font-size: 1.2rem" placeholder="내용"></form:textarea>
							</div>
						</div>
						<!-- CKEditor5 -->
						<script
							src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js">
							
						</script>
						<script>
							ClassicEditor.create(document
									.querySelector('#editor'), {
								height : '500px'
							});
						</script>
						<div class="col-12">
							<!-- Button trigger modal -->
							<button type="submit" class="btn btn-primary"
								style="float: left;">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</section>


