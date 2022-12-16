<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<div class="mainInfo">
	<br>
	<div class="container">
		<div class="mb-6" style=" height:20px;">
			<ul class="nav nav-tabs destination-tabs" id="destinationTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="overView-tab" href='<%=request.getContextPath()%>/mypage/admin/manageNotice'>공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="tourGuide-tab" href='<%=request.getContextPath()%>/mypage/admin/manageFAQ'>자주 묻는 질문</a>
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
				<td class="boTitle">글번호</td>
				<td class="boTitle">글제목</td>
				<td class="boTitle">작성일자</td>
			</tr>
<!-- 				<td class="text-center">001</td> -->
<!-- 				<td class="text-center">공지사항의 글 제목 위치입니다.</td> -->
<!-- 				<td class="text-center">22.11.07.</td> -->
			<c:set var="noticeList" value="${pagingVO.dataList }"/>
			<c:choose>
				<c:when test="${not empty noticeList }">
					<c:forEach items="${noticeList }" var="notice">
						<tr class="noticeItem" data-what="${notice['artNum'] }">
<!-- 						 data-bs-toggle="modal" data-bs-target="#exampleModal" -->
							<td>${notice['artNum'] }</td>
							<td>${notice['artTitle'] }</td>
							<td>${fn:substring(notice['artDate'],0,10) }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="3">해당 게시글이 없습니다.</td>
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
	<button type="button" id="instNotice" onclick="fn_instNotice()" class="btn btn-info text-white mb-2">글 등록</button>
	<div id="searchUI">
		<select name="searchType">
			<option value="repNum">신고 접수 번호</option>
			<option value="memId">ID</option>
			<option value="repCode">신고 유형</option>
			<option value="repBode">신고 게시판</option>
		</select>
		<input type="text" name="searchWord" />
		<input type="button" value="검색" id="searchBtn"/>
	</div>
</div>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" />
	<input type="hidden" name="searchWord" />
</form>
<form id="noticeDetail" method="post" action="${pageContext.request.contextPath }/mypage/admin/noticeDetail">
	<input type="hidden" name="artNum">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<form id="insertNotice" method="post" action="${pageContext.request.contextPath }/mypage/admin/insertNFForm">
	<input type="hidden" name="artBCode">
	<input type="hidden" name="insert" value="noitce">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<script>
	let noticeDetail = $("#noticeDetail");
	let noticeView = $(".noticeItem").click(function(event, xhr, options){
		event.preventDefault();
		var token = $("meta[name='_csrf']").attr('content');
		var header = $("meta[name='_csrf_header']").attr('content');
		let noticeNum = $(this).data("what");
		let noticeTag = $("[name=artNum]");
		noticeTag.val(noticeNum);
		noticeDetail.submit();
	});
	
	let insertNotice= $("#insertNotice"); 
	function fn_instNotice(){
		let noticeTag = $("[name=artBCode]");
		noticeTag.val("BC003");
		insertNotice.submit();
	}
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit;
	});
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
	let message = '${message }';
	if (message.length>0){
		alert(message);
	}
</script>


