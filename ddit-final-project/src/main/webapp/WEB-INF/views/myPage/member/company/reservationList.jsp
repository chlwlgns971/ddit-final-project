<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="kmb-title">
	<h2>결제 내역 조회</h2>
</div>

<div class="container">

	<!-- Table Section -->
	<div class="table-dashboard mb-7">
		<div class="row">
			<div class="col-12">
				<h2 class="text-uppercase mb-3">예약 내역</h2>
				<table class="table table-hover">
					<tbody>
						<c:if test="${reservationList ne null }">
						<c:forEach var="reservation" items="${reservationList }">
							<tr>
								<th scope="row"><img class="imgSize"
									src="${reservation.prodImg }" />
								</th>
	
								<td class="second-child">
									<div>
										<p style="font-size: 10px; color: black;">${reservation.prodNam }</p>
										<p class="" style="font-size: 12px;">${reservation.resSdate}~${reservation.resEdate}</p>
										<p>${reservation.resQty } Person</p>
									</div>
								</td>
	
								<td>
									<h2 class="">
										&#8361;<span><fmt:formatNumber value="${reservation.prodPrice}" pattern="#,###" /></span>
									</h2>
									<h4>${reservation.charCode }</h4>
								</td>
	
								<td>
									<ul class="list-unstyled">
										<input type="button" class="btn btn-primary" value="상세보기"
											onclick="location.href='${cPath}/mypage/member/company/product/resDetail?what=${reservation.resCode }'"/>
									</ul>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>