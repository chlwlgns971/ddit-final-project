<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal" var="principal" />

<form:form id="articleForm" method="post" modelAttribute="article" enctype="multipart/form-data"> 
<%--===========================================--%>
	<form:hidden path="artNum"/>  
<%--===========================================--%>

<!-- Table Section -->
	<div class="table-dashboard">
		<div class="row">
			<div class="mb-7 mb-lg-0">
				<h3>게시글 작성</h3>
				<div class="col-lg-12">
					<div class="form-group">
						<form:input path="artTitle" required="true" class="form-control"/>
						<form:errors path="artTitle" element="span" cssClass="error" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group">
						<form:input type="hidden" path="accId" class="form-control" readonly="true" value="${article.artNum }" style="font-size: 1.2rem; background: white"/>
						<form:errors path="accId" element="span" class="error"/>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group">
						<form:textarea path="artCont" id="editor" value="${article.artCont }" style="height: 500px; font-size: 1.2rem"/>
						<form:errors path="artCont" element="span" class="error"/>
					</div>
				</div>
				<!-- CKEditor5 -->
				<script
					src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js">
				</script>
				<script>
					ClassicEditor.create(document.querySelector('#editor'), {
						height : '500px'
					});
				</script>
				<div class="col-12">
					<form:button type="submit" class="btn btn-success">수정</form:button>
					<form:button type="reset" class="btn btn-danger">취소</form:button>
				</div>
			</div>
		</div>
	</div>

</form:form>

<!-- <table class="table table-bordered"> -->
<!-- 	<tr> -->
<!-- 		<th>제목</th> -->
<!-- 		<td> -->
<%-- 			<form:input path="artTitle" required="true" class="form-control"/> --%>
<%-- 			<form:errors path="artTitle" element="span" cssClass="error" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>작성자</th> -->
<!-- 		<td> -->
<%-- 			<form:input path="accId" class="form-control" readonly="true" value="${article.artNum }"/> --%>
<%-- 			<form:errors path="accId" element="span" class="error"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>내용</th> -->
<!-- 		<td> -->
<%-- 			<form:textarea path="artCont" value="${article.artCont }"/> --%>
<%-- 			<form:errors path="artCont" element="span" class="error"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<%-- 			<form:button type="submit" class="btn btn-success">전송</form:button> --%>
<%-- 			<form:button type="reset" class="btn btn-danger">취소</form:button> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

















