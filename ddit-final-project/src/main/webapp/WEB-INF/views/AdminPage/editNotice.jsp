<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<form:form modelAttribute="article" action="${pageContext.request.contextPath }/mypage/admin/editNotice" enctype="multipart/fomr-data"
	method="POST" role="form" class="form">
<div class="mainInfo">
	<!-- Table Section -->
	<div class="table-dashboard">
		<div class="row">
			<div class="mb-7 mb-lg-0">
				<h3 id="titleName"></h3>
				<br>
				<div class="col-lg-12">
					<div class="form-group">
						<form:input type="hidden" path="artNum" value="${articleVO.artNum}"/>
						<form:input type="hidden" path="artBCode" value="${articleVO.artBCode}"/>
						<form:input path="artTitle" type="text" class="form-control"
							style="font-size: 1.2rem; background: white" placeholder="제목"
							required="required" value="${articleVO.artTitle}"/>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group">
						<form:select path="artCCode" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<c:set var="catList" value="${catList }"/>
							<c:choose>
								<c:when test="${not empty catList }">
									<c:forEach items="${catList }" var="category">
										<option value=${category['catCode'] }>${category['catNam'] }</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option>통신 중 문제가 발생했습니다. 다시 시도해주세요.</option>
								</c:otherwise>
							</c:choose>
						</form:select>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group">
						<textarea name="artCont" id="editor" style="height: 500px; font-size: 1.2rem" >${articleVO.artCont }</textarea>
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
					<!-- Button trigger modal -->
					<button type="submit" class="btn btn-info text-white py-2 px-5"
						style="float: left;">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>

</form:form>

<script>
let titleName = $("#titleName");
let catU = '${catuCode}';
if('NC'==catU){
	titleName.text("공지사항 수정");
}else if('FAQ'==catU){
	titleName.text("자주 묻는 질문 수정");
}


</script>


