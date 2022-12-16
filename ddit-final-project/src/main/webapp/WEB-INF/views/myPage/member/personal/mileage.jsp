<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="kmb-title">
	<h2>마일리지 쿠폰 조회</h2>
</div>

<div class="container">
	<!-- Table Section -->
	<div class="table-dashboard mb-7">
		<div class="mc-tab">
			<div class="mileCouponTab" onmouseover="OnMouseIn(this)"
				onmouseout="OnMouseOut(this)"
				onclick="location.href='${cPath}/mypage/member/personal/mileage'">마일리지</div>
			<div>&nbsp;</div>
			<div class="mileCouponTab" onmouseover="OnMouseIn(this)"
				onmouseout="OnMouseOut(this)"
				onclick="location.href='${cPath}/mypage/member/personal/coupon'">쿠폰</div>
		</div>
		<div class="background-color">


			<div class="mcTableDiv">
				<table class="mcTable">
					<thead>
						<tr>
							<th class="mcTH">마일리지 사용내역</th>
							<th class="mcTH">사용 마일리지</th>
							<th class="mcTH">마일리지 상세내역</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="mileTempList" value="${mileTempVO}" />
						<c:choose>
							<c:when test="${not empty mileTempList }">
								<c:forEach items="${mileTempList}" var="mileage">
									<tr>
										<td class="mcTD">${mileage['umilDate'] }</td>
										<td class="mcTD">${mileage['umilMilage'] }</td>
										<td class="mcTD"><a href="javascript:void(0);"
											onclick="payList('${mileage['charCode'] }');">상세내역 보기</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5">마일리지 내역이 없음.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div>
					<section class="pt-5 pt-md-7">
						<div class="container pagingArea"></div>
					</section>
					<!-- ====================================
            ———   PAGINATION
            ===================================== -->
					<section class="pt-5 pt-md-7">
						<div class="container">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center align-items-center">
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)" tabindex="-1"> <i
											class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1"
											aria-hidden="true"></i> Previous
									</a></li>

									<li class="page-item"><a class="page-link active"
										href="javascript:void(0)">1</a></li>

									<li class="page-item"><a class="page-link"
										href="javascript:void(0)">2</a></li>

									<li class="page-item"><a class="page-link"
										href="javascript:void(0)">3</a></li>

									<li class="page-item"><a class="page-link"
										href="javascript:void(0)">Next <i
											class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1"
											aria-hidden="true"></i>
									</a></li>
								</ul>
							</nav>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>
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
<script type="text/javascript">
function payList(param){
	
	var popUp=window.open("${pageContext.request.contextPath}/mypage/member/personal/payDetailView?what="+param,'payDetailView','width=300px,height=300px,left=50%,top=50%,scrollbars=yes');
}
</script>
