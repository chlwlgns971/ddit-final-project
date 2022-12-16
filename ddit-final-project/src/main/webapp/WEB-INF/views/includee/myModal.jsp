<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script type="text/javascript">
	function onclick(kmb) {
		kmb.style.backgroundColor = "#01ace4";
	}
	function OnMouseIn(kmb) {
		kmb.style.backgroundColor = "#01ace4";
		kmb.style.color = "white";
	}
	function OnMouseOut(kmb) {
		kmb.style.backgroundColor = "";
		kmb.style.color = "";
	}
</script>
<style>
.modalTable {
	width: 450px;
	height: 100px;
	text-align: center;
}

.myPageNavi {
	background-color: lightgray;
	height: 50px;
	padding-top: 15px;
}

.myPageURL {
	margin-top: 30px;
}

.btn-secondary {
	width: 450px;
}

.logoutTag {
	font-weight: bold;
	font-size: 30px;
	margin-right: 10px
}
</style>
<body>
	<div class="modal fade" id="myMenuModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- /////////////////////////////////////일반회원부분 /////////////////////////////////////-->
				<security:authorize access="hasAnyRole('ROLE_CM')">
					<div class="modal-body">
						<div class="myPageNaviBtn">
							<table class="modalTable">

								<tr>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/personal/personalMemberEdit'">회원정보수정</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/personal/payList'">예약내역관리</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/calender/viewMyCalenders'">나의
											여행일정</div></td>
								</tr>

								<tr>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/personal/mileage'">마일리지</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/personal/wishList-package'">위시리스트</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/personal/complybook'">동행목록</div></td>
								</tr>

							</table>
						</div>
						<div class="myPageURL">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal"
								onclick="location.href='${cPath}/mypage/member/personal/personalMemberEdit'">마이페이지</button>
						</div>
					</div>
				</security:authorize>
				<!-- /////////////////////////////////////업체회원부분 /////////////////////////////////////-->
				<security:authorize access="hasAnyRole('ROLE_HC','ROLE_RC')">
					<div class="modal-body">
						<div class="myPageNaviBtn">
							<table class="modalTable">

								<tr>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/company/companyMemberEdit'">회원정보수정</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/company/product/reservation'">예약현황조회</div></td>
								</tr>

								<tr>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/company/product/list'">상품정보관리</div></td>
									<td><div class="myPageNavi" onmouseover="OnMouseIn(this)"
											onmouseout="OnMouseOut(this)"
											onclick="location.href='${cPath}/mypage/member/company/statistics'">통계정보</div></td>
								</tr>

							</table>
						</div>
						<div class="myPageURL">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal"
								onclick="location.href='${cPath}/mypage/member/company/companyMemberEdit'">마이페이지</button>
						</div>
					</div>
				</security:authorize>
				<div class="modal-footer">
					<a href="javascript:void(0)" onclick="logoutForm.submit();"
						class="logoutTag">Logout</a>
					<form:form id="logoutForm"
						action="${cPath}/login/logout.do"
						method="post">
						<security:csrfInput />
					</form:form>
				</div>
			</div>
		</div>
	</div>
