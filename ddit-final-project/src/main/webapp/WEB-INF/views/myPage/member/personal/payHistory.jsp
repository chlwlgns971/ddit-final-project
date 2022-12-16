<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
.paylistTable {
	border: 1px solid #01ACE4;
}

.paylistTable th {
	background-color: #01ACE4;
	color: white;
}

.paylistTable td, .paylistTable th {
	border: 2px solid #01ACE4;
}
</style>
<h2>결재 내역 조회</h2>
<table class="paylistTable">
	<tr>
		<th>결제 코드</th>
		<td>${chargeVO.charCode} </td>
	</tr>
	<tr>
		<th>결제금액</th>
		<td>${chargeVO.charPrice }원</td>
	</tr>
	<tr>
		<th>결제날짜</th>
		<td>${chargeVO.charDate }</td>
	</tr>
	<tr>
		<th>예약날짜</th>
		<td>${chargeVO.resDate }</td>
	</tr>
	<tr>
		<th>인원수</th>
		<td>${chargeVO.resQty }명</td>
	</tr>
	<tr>
		<th>예약상태</th>
		<c:set var="state" value='RS' />
		<c:if test="${state eq chargeVO.resStt}">
			<td>예약완료</td>
		</c:if>
		<c:if test="${state ne chargeVO.resStt}">
			<td>예약예정</td>
		</c:if>
	</tr>
</table>
