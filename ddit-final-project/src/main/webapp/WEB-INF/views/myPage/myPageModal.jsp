<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<html>
<head></head>
<style>
.modalImgFrameDiv {
	border: 2px solid black;
	width: 150px;
	height: 150px;
}

.modal-member-name {
	display: flex;
}

.modal-member-name {
	font-size: 30px;
}

.modal-member-grade, .modal-member-id, .modal-member-chat,
	.modal-member-mile {
	font-size: 20px;
}

.modal-member-nmgr {
	margin-left: 30px
}

.personalModal {
	width: 450px;
}
</style>
<body>
	<!-- /////////////////////////////////////일반회원부분 /////////////////////////////////////-->
	<security:authorize access="hasAnyRole('ROLE_CM')">
		<table class="personalModal">
			<tr>
				<td rowspan="4"><img
					src="<security:authentication property="principal.realUser.accImg"/>"
					data-src="<security:authentication property="principal.realUser.accImg"/>"
					style="width: 200px; height: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><h2>${pmVO.memKln}${pmVO.memKfn}님</h2></td>
				<td><h3>${pmVO.memId }</h3></td>

			</tr>

			<tr>
				<td><h4>${pmVO.memGrade}회원</h4></td>
				<td></td>

			</tr>
			<tr>
				<td><h3><spring:message code="mypage.mileage" /></h3></td>
				<td>${pmVO.memMil }점</td>
			</tr>
		</table>
	</security:authorize>

	<!-- /////////////////////////////////////업체회원부분 /////////////////////////////////////-->
	<security:authorize access="hasAnyRole('ROLE_HC','ROLE_RC')">
	<table class="personalModal">
			<tr>
				<td rowspan="4"><img
					src="<security:authentication property="principal.realUser.accImg"/>"
					data-src="<security:authentication property="principal.realUser.accImg"/>"
					style="width: 200px; height: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><h2>${cmVO.comNam}님</h2></td>
				

			</tr>
			<tr>
			<td><h3>${cmVO.comId }</h3></td>
			<td></td>
			</tr>

			<tr>
				<td><h4>${cmVO.comCnam}업체</h4></td>
				<td></td>

			</tr>
		</table>
		

	</security:authorize>
</body>
</html>