<%@page import="kr.or.ddit.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="articleList" value="${pagingVO.dataList }" />


<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg4.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold" id="title">커뮤니티</h2>
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


		<div class="mb-6">
			<ul class="list-unstyled d-md-flex bg-smoke mb-0 p-5 px-lg-6 rounded" id="list">
				<li class="mb-4 mb-md-0 px-md-3">
					<a href="${pageContext.request.contextPath }/article/articleList/BC001" class="text-uppercase text-dark hover-text-primary">동행게시판</a> 
				 </li>
				<li class="mb-4 mb-md-0 px-md-3">
					<a href="${pageContext.request.contextPath }/article/articleList/BC002" class="text-uppercase text-dark hover-text-primary">장터게시판</a>
				</li>
			</ul>
		</div>

		<!-- Table Section -->
		<div class="table-dashboard mb-7">
			<div class="row">
				<div class="col-12">
					<table class="table table-hover table-strip">
						<thead>
							<tr class="table-dashboard mb-7">
								<th style="padding-left: 5px;" class="col-1">No.</th>
								<th style="padding-left: 5px; text-align: center;" class="col-6">제목</th>
								<th style="padding-left: 5px; text-align: center;" class="col-1">조회수</th>
								<!-- 						<th style="padding-left: 5px; text-align: center;" class="col-1">추천수</th> -->
								<th style="padding-left: 5px; text-align: center;" class="col-2">작성자</th>
								<th style="padding-left: 5px; text-align: center;" class="col-2">작성일</th>
							</tr>
						</thead>
						<tbody id="listBody">
						</tbody>
					</table>
					<form id="searchForm">
						<input type="hidden" name="page" /> <input type="hidden"
							name="searchType" /> <input type="hidden" name="searchWord" />
					</form>
					<div class="pagingArea" style="margin: 1rem;"></div>
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
								href="<c:url value='/article/articleForm'/>">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- Table Section -->
<script type="text/javascript">
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
				let url = this.action;
				let method = this.method;
				let data = $(this).serialize();
				$.ajax({
					url : url,
					method : method,
					data : data,
					dataType : "json",
					success : function(pagingVO) {
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
					},
					error : function(errorResp) {
						console.log(errorResp.status);
					}
				});
				return false;
			}).submit();

	
// 	if( article.artBCode  == 'BC001' || article.artBCode  == 'BC002'){
// 		$("#title").text("커뮤니티");
// 		$("#list").html(
			
// 		+ ' <li class="mb-4 mb-md-0 px-md-3">                                                                                                     '
// 		+ ' 	<a href="${pageContext.request.contextPath }/article/articleList/BC001" class="text-uppercase text-dark hover-text-primary">      '
// 		+ ' 	동행게시판</a>                                                                                                                       '
// 		+ ' </li>                                                                                                                                 '
//         + '                                                                                                                                       '
// 		+ ' <li class="mb-4 mb-md-0 px-md-3">                                                                                                     '
// 		+ ' 	<a href="${pageContext.request.contextPath }/article/articleList/BC002" class="text-uppercase text-dark hover-text-primary">    '
// 		+ ' 	장터게시판</a>                                                                                                                     '
// 		+ ' </li>                                                                                                                                 '
			
// 		);
// 	}
	
// 	if(article.artBCode  == 'BC003' || article.artBCode  == 'BC005'){
// 		$("#title").text("고객센터");
// 		$("#list").html(
// 			'	<li class="mb-4 mb-md-0 px-md-3">' 
// 			+	'<a href="${pageContext.request.contextPath }/article/articleList/BC003">공지사항</a> '
// 			+ '</li>'
// 			+'<li class="mb-4 mb-md-0 px-md-3">'
// 			+'	<a href="${pageContext.request.contextPath }/article/articleList/BC005">자주묻는 질문</a>'
// 			+'</li>'		
// 		);
		
// 	}
	
	
	
</script>