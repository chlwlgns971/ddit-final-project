<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<div class="mainInfo">
	<br>
	<div class="container">
		<div class="mb-6" style=" height:20px;">
			<ul class="nav nav-tabs destination-tabs" id="destinationTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="overView-tab" href="${pageContext.request.contextPath }/mypage/admin/manageMem" >일반 회원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="tourGuide-tab" href="${pageContext.request.contextPath }/mypage/admin/manageComp">기업 회원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="tourGuide-tab" href="${pageContext.request.contextPath }/mypage/admin/manageReport">신고 내역</a>
				</li>
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" id="locationMap-tab" data-bs-toggle="tab" href="#locationMap" role="tab" aria-controls="locationMap" aria-selected="false">Location map</a> -->
<!-- 					</li> -->
             
                <li class="nav-item d-none"></li>
			</ul>
		</div>
	</div>
	<br/>
	<br/>
	<table class="table">
		<tbody>
			<tr>
				<td class="boTitle">업체명</td>
				<td class="boTitle">아이디</td>
				<td class="boTitle">담당자명</td>
				<td class="boTitle">사업자번호</td>
			</tr>
			<c:set var="companyList" value="${pagingVO.dataList }"/>
			<c:choose>
				<c:when test="${not empty companyList }">
				<c:forEach items="${companyList }" var="company">
					<tr data-who="${company['comId'] }" 
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<td>${fn:substring(company['comCnam'],0,10) }</td>
						<td>${company['comId'] }</td>
						<td>${company['comNam'] }</td>
						<td>${company['comRnum'] }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">회원이 없음.</td>
				</tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<section class="pt-5 pt-md-7">
		<div class="container pagingArea">
			${pagingVO.pagingHTML }
		</div>
	</section>
<!-- 	<div id="searchUI"> -->
<!-- 		<select name="searchType"> -->
<!-- 			<option value="">전체</option> -->
<!-- 			<option value="name">이름</option> -->
<!-- 			<option value="address">지역</option> -->
<!-- 		</select> -->
<!-- 		<input type="text" name="searchWord" /> -->
<!-- 		<input type="button" value="검색" id="searchBtn"/> -->
<!-- 	</div> -->
</div>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" />
	<input type="hidden" name="searchWord" />
</form>
<script>
	let searchForm = $("#searchForm");
	let pageTag = $("[name=page]");
	$("[name=searchType]").val("${pagingVO.simpleCondition.searchType}");
	$("[name=searchWord]").val("${pagingVO.simpleCondition.searchWord}");
	$(".pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		pageTag.val(page);
		searchForm.submit();
		return false;
	});
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit;
	});
</script>