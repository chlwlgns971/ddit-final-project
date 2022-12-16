<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>


<div class="kmb-title">
	<h2>상품정보관리</h2>
</div>
<div class="container">
	<!-- Table Section -->
	<div class="table-dashboard mb-7">
		<div class="background-color">

			<div class="goodsTableDiv">
				<table class="goodsTable">
					<thead>
						<tr>
							<th colspan="5" class="goodsTH">등록 상품 리스트</th>
						</tr>
						<tr>
							<th class="goodsTH">이미지</th>
							<th class="goodsTH">상품명</th>
							<th class="goodsTH">상품수량</th>
							<th class="goodsTH">지역</th>
						</tr>
					</thead>

					<tbody>
<%-- 						<c:set var="productList" value="${pagingVO.dataList }" /> --%>
						
				<!-- //////////////////////////////////////렌터카 자세히 보기////////////////////////////////////-->
						<security:authorize access="hasAnyRole('ROLE_RC')">
							<c:set var="productList" value="${pagingVO.dataList }" />
							<c:choose>
								<c:when test="${not empty productList }">
									<c:forEach items="${productList}" var="product">
										<tr data-who="${product['prodNam'] }">
											<td><img class="thumbNail" src="${product['prodImg'] }"></td>
											<td><a
												href="${cPath}/mypage/member/company/product/detail/rentCar?what=${product['prodNum'] }">${product['prodNam'] }</a></td>
											<td>${product['prodQty'] }</td>
											<td>${product['areaName'] }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">등록한 상품이 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<td>${product['areaCode'] }</td>

						</security:authorize>

						<!-- //////////////////////////////////////호텔 자세히 보기////////////////////////////////////-->
						<security:authorize access="hasAnyRole('ROLE_HC')">
							<c:set var="productList" value="${pagingVO.dataList }" />
							<c:choose>
								<c:when test="${not empty productList }">
									<c:forEach items="${productList}" var="product">
										<tr data-who="${product['prodNam'] }">
											<td><div><img class="thumbNail" src="${product['prodImg'] }"></div></td>
											<td><a href="${cPath}/mypage/member/company/product/detail/hotelRoom?what=${product['prodNum'] }">${product['prodNam'] }</a></td>
											<td>${product['prodQty'] }</td>
											<td>${product['areaName'] }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">등록한 상품이 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<td>${product['areaCode'] }</td>
						</security:authorize>
					</tbody>

				</table>
				<button class="btn btn-secondary"
					style="float: right; width: 170px;" onclick="location.href='${cPath}/prod/Insert'">새 상품 등록하기</button>
					</div>
					<div>
				<section class="pt-5 pt-md-7">
					<div class="container pagingArea">${pagingVO.pagingHTML }</div>
				</section>
				<div id="searchUI">
					<select name="searchType">
						<option value="">전체</option>
						<option value="name">상품명</option>
						<option value="address">지역</option>
					</select> <input type="text" name="searchWord" /> <input type="button"
						value="검색" id="searchBtn" />
				</div>
			</div>
		</div>
	</div>
</div>
<form id="searchForm">
	<input type="hidden" name="page" /> <input type="hidden"
		name="searchType" /> <input type="hidden" name="searchWord" />
</form>
<script>
	let searchForm = $("#searchForm");
	let pageTag = $("[name=page]");
	$("[name=searchType]").val("${pagingVO.simpleCondition.searchType}");
	$("[name=searchWord]").val("${pagingVO.simpleCondition.searchWord}");
	$(".pagingArea").on("click", "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (!page)
			return false;
		pageTag.val(page);
		searchForm.submit();
		return false;
	});
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag) {
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit;
	});
</script>
