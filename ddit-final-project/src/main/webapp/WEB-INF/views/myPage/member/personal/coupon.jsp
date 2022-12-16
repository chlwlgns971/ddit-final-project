<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="kmb-title">
	<h2>마일리지 쿠폰 조회</h2>
</div>

<div class="container">
	<!-- Table Section -->
	<div class="table-dashboard mb-7">
		<div class="mc-tab">
			<div class="mileCouponTab" onmouseover="OnMouseIn(this)"
				onmouseout="OnMouseOut(this)"
				onclick="location.href='${pageContext.request.contextPath }/mypage/member/personal/mileage'">마일리지</div>
			<div>&nbsp;</div>
			<div class="mileCouponTab" onmouseover="OnMouseIn(this)"
				onmouseout="OnMouseOut(this)"
				onclick="location.href='${pageContext.request.contextPath }/mypage/member/personal/coupon'">쿠폰</div>
		</div>
		<div class="background-color">


			<div class="mcTableDiv">
				<table class="mcTable">
					<thead>
						<tr>
							<th class="mcTH">쿠폰 발급날짜</th>
							<th class="mcTH"><spring:message code="mypage.couponName" /></th>
							<th class="mcTH"><spring:message code="mypage.couponDate" /></th>
							<th class="mcTH"><spring:message code="mypage.couponDiscRate" /></th>
						</tr>
					</thead>
					<tbody id="couponTableTd">
						<c:set var="couponList" value="${couponList}" />
						<c:choose>
							<c:when test="${not empty couponList }">
								<c:forEach items="${couponList}" var="coupon">
									<tr>
										<td class="mcTD">${coupon.couSdate}</td>
										<td class="mcTD">${coupon.couNam}</td>
										<td class="mcTD">${coupon.couSdate} ~ ${coupon.couEdate}</td>
										<c:set var="discount" value='DCP' />
										<c:if test="${discount eq coupon.couCode}">
										<td class="mcTD">${coupon.couDisc}원</td>
										</c:if>
										<c:if test="${discount ne coupon.couCode}">
										<td class="mcTD">${coupon.couDisc}%</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>

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