<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="kmb-title">
	<h2>동행 친구 보기</h2>
</div>
<div>
	<div style="display: flex;">
		<img
			src="<%=request.getContextPath()%>/resources/images/about-us/team-02.jpg"
			data-src="<%=request.getContextPath()%>/resources/images/about-us/team-02.jpg"
			alt="Generic placeholder image" class="kmb-circle"
			style="margin: 20px;">
	</div>
	<div style="display: flex; margin-left: 200px; margin-top: -170px;">
		<table>

			<tr>
				<th><spring:message code="mypage.id" /></th>
				<td>mercedezBenz</td>
			</tr>
			<tr>
				<th><spring:message code="mypage.name" /></th>
				<td>손흥민</td>
			</tr>
			<tr>
				<th><spring:message code="mypage.birth" /></th>
				<td>1492.05.30</td>
			</tr>
			<tr>
				<th><spring:message code="mypage.inout" /></th>
				<td>내국인</td>
			</tr>
			<tr>
				<th><spring:message code="mypage.gender" /></th>
				<td>남성</td>
			</tr>
		</table>
	</div>
</div>
<div class="buttons">
	<input type="button" class="btn btn-primary" type="submit" value="뒤로가기"
		onclick="location.href='${pageContext.request.contextPath }/mypage/member/personal/complybook'">
</div>


