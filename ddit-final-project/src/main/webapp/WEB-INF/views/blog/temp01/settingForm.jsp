<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="ftco-section contact-section">
	<div class="container">
		<div class="row d-flex mb-5 contact-info">
			<div class="col-md-12 mb-4">
				<h2 class="h4 font-weight-bold">Blog Setting</h2>
			</div>
			<div class="w-100"></div>

		</div>
		<div class="container">
			<div class="mb-6" style="height: 20px;">
				<ul class="nav nav-tabs setting-tabs" id="settingTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="blogInfoSetting-tab" data-bs-toggle="tab"
						href="#blogInfoSetting" role="tab" aria-controls="blogInfoSetting"
						aria-selected="true">블로그 설정</a></li>
					<li class="nav-item"><a class="nav-link"
						id="categorySetting-tab" data-bs-toggle="tab"
						href="#categorySetting" role="tab" aria-controls="categorySetting"
						aria-selected="false">카테고리 설정</a></li>
					<li class="nav-item d-none"></li>
				</ul>
			</div>
		</div>
		<div class="tab-content" id="myTabContent" style="width: 50%;">
			<div class="tab-pane fade show active" id="blogInfoSetting"
				role="tabpanel" aria-labelledby="blogInfoSetting-tab"
				style="margin-left: 2%">
				<form:form
					action="${pageContext.request.contextPath }/blogSet/updateBlog"
					method="post" modelAttribute="blog">
					<div class="form-group">
						<form:input path="blogId" type="hidden" class="form-control"
							value="${blog.blogId }" />
					</div>
					<label>Blog Name</label>
					<div class="form-group">
						<form:input path="blogName" type="text" class="form-control"
							placeholder="${blog.blogName }" />
						<form:errors path="blogName" />
					</div>
					<label>Nick Name</label>
					<div class="form-group">
						<form:input path="blogNickname" type="text" class="form-control"
							placeholder="${blog.blogNickname }" />
						<form:errors path="blogNickname" />
					</div>
					<div class="form-group">
						<form:input path="blogTemp" type="hidden" class="form-control"
							value='1' />
						<form:errors path="blogTemp" />
					</div>
					<label>Introduce yourself</label>
					<div class="form-group">
						<form:textarea path="blogIntro" name="" id="" cols="30" rows="7"
							class="form-control" value="${blog.blogIntro }" />
						<form:errors path="blogIntro" />
					</div>
					<div class="form-group">
						<input type="submit" value="submit"
							class="btn btn-primary py-3 px-5" style="float: right">
					</div>
				</form:form>

			</div>

			<div class="tab-pane fade" id="categorySetting" role="tabpanel"
				aria-labelledby="categorySetting-tab" style="margin-left: 2%">
				<c:forEach var="category" items="${blog.category }">
					<form:form action="${pageContext.request.contextPath }/blogSet/updateCategory" modelAttribute="category" class="form" enctype="multipart/form-data" method="post">
						<div class="form-group">
							<c:if test="${category.bcateNum eq 1 || category.bcateNum eq 2}">
								<label>Category Name</label>
								<form:input path="bcateName" class="form-control" value="${category.bcateName }" readonly="true" />
							</c:if>
							<c:if test="${category.bcateNum ne 1 && category.bcateNum ne 2 }">
								<label>Category Name</label>
								<form:input path="bcateName" class="form-control" value="${category.bcateName }" />
							</c:if>
							<form:errors path="bcateName" />
							
							<label>Category Sub Name</label>
							<form:input path="bcateImginfo" class="form-control" value="${category.bcateImginfo }" />
							<form:hidden path="bcateNum" value="${category.bcateNum }" />
							
							<label>Category Banner Image</label><br>
							<input type="file" name="bannerImg"/>
						</div>
						<div class="form-group">
							<button value="${category.bcateNum }"
								class="btn btn-primary px-3" style="float: right">수정</button>
						</div>
					</form:form>
					<br>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$('.form').submit(function() {
			event.preventDefault();
			var formData = new FormData(this);
			let enctype = this.enctype;
			$.ajax({
				url : "${pageContext.request.contextPath }/blogSet/updateCategory",
				contentType : false, //contentType false를 해줌으로써 form태그에 설정해둔 MultipartType Boundary가 그대로 들어간다.
// 				data : $(this).serialize(),
				data : formData,
				method : 'post',
				processData : false, // defalut값은 true로 되어있고, 이 경우 ajax는 데이터를 json으로 파싱하려 한다. Multipart로 보내야 하므로, 기본데이터 구조로 보내야하므로 false처리한다.
				success : function(resp) {
					if(resp == 1){
						Swal.fire({
							title:'Success!',         // Alert 제목
							text:'변경되었습니다.',  // Alert 내용
							icon:'success',        // Alert 타입
						  confirmButtonColor: '#1ab3e8'
						});
					}
					else if(resp == 0){
						Swal.fire({
							title:'Error!',         // Alert 제목
							text:'변경사항이 적용되지 않았습니다.',  // Alert 내용
							icon:'error',        // Alert 타입
						  confirmButtonColor: '#1ab3e8'
						});
					}
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		})
	</script>
</section>