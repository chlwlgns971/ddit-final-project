<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<div class="col-md-12 col-lg-3">
	<div class="row">
	<!-- /////////////////////////////////////일반회원부분 /////////////////////////////////////-->
		<security:authorize access="hasAnyRole('ROLE_CM')">
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded overflow-hidden">
				<img src="<security:authentication property="principal.realUser.accImg"/>" data-src="<security:authentication property="principal.realUser.accImg"/>" alt="Generic placeholder image" class="w-100 rounded-circle me-1 lazyestload profileImgSrc" style="height: 200px;">
				<h5 class="text-uppercase text-align"><security:authentication property="principal.realUser.accId"/>님</h5>
				<table class="box">
					<tr>
						<td class="text-center profile">사용가능 쿠폰: 6장</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded">
				<table class="box">
					<tbody>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/personal/personalMemberEdit">개인정보 수정</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/calender/viewMyCalenders">나의 여행 일정</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/personal/payList">결제 내역 조회</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/personal/wishList-package">위시리스트 보기</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/personal/mileage">마일리지/쿠폰 조회</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/personal/complybook">동행 관리</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</security:authorize>
		<!-- /////////////////////////////////////업체회원부분 /////////////////////////////////////-->
		<security:authorize access="hasAnyRole('ROLE_HC','ROLE_RC')">
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded overflow-hidden">
				<img src="<security:authentication property="principal.realUser.accImg"/>" data-src="<security:authentication property="principal.realUser.accImg"/>" alt="Generic placeholder image" class="w-100 rounded-circle me-1 lazyestload profileImgSrc" style="height: 200px;">
				<h5 class="text-uppercase text-align"><security:authentication property="principal.realUser.accId"/>님<br/></h5>
			</div>
		</div>
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded">
				<table class="box">
					<tbody>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/company/companyMemberEdit">업체 정보 관리</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/company/product/reservation">예약 현황 조회</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/company/product/list">상품정보 관리</a></td>
						</tr>
						<tr>
							<td class="menus"><a href="${cPath}/mypage/member/company/statistics">통계정보</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</security:authorize>
	</div>
</div>

<script>
	let profileImgSrcValue='${profileImg}';
	let profileImgSrc = document.getElementById("profileImgSrc");
	if(profileImgSrcValue!=""&&null!=profileImgSrcValue){
		profileImgSrc.src=profileImgSrcValue;
		profileImgSrc.dataset.src=profileImgSrcValue;
	}
</script>

