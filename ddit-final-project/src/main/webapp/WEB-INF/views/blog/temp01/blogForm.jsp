<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="ftco-section" style="margin-left: 10%;">
	<div class="mb-7 mb-lg-0">
		<h3 class="font-weight-bold text-capitalize mb-6">게시글 작성</h3>
	
		<form:form method="post" modelAttribute="blogPost" enctype="multipart/form-data" role="form" class="form">
			<div class="col-lg-9">
				<div class="form-group">
					<form:input path="postTitle" required="true" class="form-control border-top-0 border-left-0 border-right-0" style="background: gray;" placeholder="Title"/>
					<form:errors path="postTitle" element="span" cssClass="error" />
<!-- 						<input type="text" class="form-control border-top-0 border-left-0 border-right-0" style="background: gray;" placeholder="Title" required> -->
				</div>
			</div>
			<div class="col-lg-9">
				<div class="form-group">
					<form:select path="postScope" class="form-control border-top-0 border-left-0 border-right-0">
						<option value="public" selected>전체공개</option>
						<option value="subscription">구독자공개</option>
						<option value="private">비밀글</option>
					</form:select>
					<form:errors path="postScope" element="span" cssClass="error" />
				</div>
				<div class="form-group">
					<form:select path="bcateNum" class="form-control border-top-0 border-left-0 border-right-0">
						<c:forEach var="category" items="${blog.category }">
							<option value="${category.bcateNum }">${category.bcateName }</option>
						</c:forEach>
					</form:select>
					<form:errors path="bcateNum" element="span" cssClass="error" />
				</div>
			</div>
			<div class="col-lg-9">
				<div class="form-group">
					<form:hidden path="postNum" />
					<form:errors path="postNum" cssClass="error"/>
					<form:hidden path="blogId" value="${blog.blogId }"/>
					<form:errors path="blogId" cssClass="error"/>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="form-group">
					<form:textarea path="postCont" id="editor" style="height: 500px;" placeholder="Your Message"/>
					<form:errors path="postCont" element="span" cssClass="error"/>
				</div>
			</div>
			<!-- CKEditor5 -->
			<script src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js"></script>
			<script>
				const CSRFTokken = $("meta[name=_csrf]").attr("content");
     				ClassicEditor.create( document.querySelector( '#editor' ),{
     					ckfinder: {
     						uploadUrl: '${pageContext.request.contextPath }/file/imageUpload?_csrf='+CSRFTokken
     					}
     				});
   			</script>
			<input type="submit" value="Submit" class="btn btn-info py-3 px-5">
		</form:form>
	</div>
</section>