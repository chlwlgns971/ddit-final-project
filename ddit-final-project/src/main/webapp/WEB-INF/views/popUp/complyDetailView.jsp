<%@page import="kr.or.ddit.vo.ComplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="complyMng">
	<div class="complyImgDiv">
		<div>
			<br>
			<div class="complyImgFrameDiv">
				<img id="complyImg" src="${pageContext.request.contextPath }/resources/file/profile/${imgInfoVo.imgONam}" data-src="${pageContext.request.contextPath }/resources/file/profile/${imgInfoVo.imgONam}" style="height: 225px;"  alt="Generic placeholder image" class="w-100 rounded-circle me-1 lazyestload"/>
			</div>
			<br>
		</div>
	</div>
	<table class="cmpTable">
		<tbody id="complyBookTbody">
			<tr>
				<td class="cmpTH"><spring:message code="mypage.id" />
				<td class="cmpTD">${complyDetail.memId}</td>
			</tr>
			<tr>
				<td class="cmpTH"><spring:message code="mypage.nickName" />
				<td class="cmpTD">${complyDetail.memNick}</td>
			</tr>
			<tr>
				<td class="cmpTH"><spring:message code="mypage.grade" />
				<td class="cmpTD">${complyDetail.memGrade}</td>
			</tr>
			<tr>
				<td class="cmpTH"><spring:message code="mypage.gender" />
				<td><c:set var="gender" value='2' /> <c:if
						test="${gender eq complyDetail.memGend}">
						<label>여자</label>
					</c:if> <c:if test="${gender ne complyDetail.memGend}">
						<label>남자</label>
					</c:if></td>
			</tr>
			<tr>
				<td class="cmpTH"><spring:message code="mypage.recentvisit" />
				<td class="cmpTD">${complyDetail.memLogin}</td>
			</tr>

			<tr>
				<td class="cmpTH"><spring:message code="mypage.tempature" />
				<td class="cmpTD">${complyDetail.memEval}°C</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td class="cmpTH">동행 예정일</td> -->
<%-- 				<td class="cmpTD">${complyDetail.getCalSdate()}~ --%>
<%-- 					${complyDetail.getCalEdate()}</td> --%>
<!-- 			</tr> -->
		</tbody>
	</table>
	<div>
		<button type="button" onclick="complyPopClose()" id="complyPopCloseBtn" class="btn btn-primary" style="margin-top: 10px; margin-left: 40%;">닫기</button>
	</div>
</div>