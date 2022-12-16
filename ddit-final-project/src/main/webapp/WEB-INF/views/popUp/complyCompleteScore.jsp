<%@page import="kr.or.ddit.vo.ComplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form:form id="complyCompleteForm" modelAttribute="complyScore"
	method="POST" enctype="multipart/form-data">
	<div class="complyMng">
		<div class="complyImgDiv">
			<div>
				<br>
				<div class="complyImgFrameDiv">
					<img id="complyImg" src="${pageContext.request.contextPath }/resources/file/profile/${imgInfoVO.imgONam}" data-src="${pageContext.request.contextPath }/resources/file/profile/${imgInfoVO.imgONam}" style="height: 225px;"  class="w-100 rounded-circle me-1 "/>
				</div>
				<br>
			</div>
		</div>
		<table class="cmpTable">
			<tbody id="complyBookTbody">
				<tr>
					<td class="cmpTH"><spring:message code="mypage.id" />
					<td class="cmpTD"><form:input path="memId" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="cmpTH"><spring:message code="mypage.nickName" />
					<td class="cmpTD">${complyScore.memNick}</td>
				</tr>
				<tr>
					<td class="cmpTH"><spring:message code="mypage.grade" />
					<td class="cmpTD">${complyScore.memGrade}</td>
				</tr>
				<tr>
					<td class="cmpTH"><spring:message code="mypage.gender" />
					<td><c:set var="gender" value='2' /> <c:if
							test="${gender eq complyScore.memGend}">
							<label>여자</label>
						</c:if> <c:if test="${gender ne complyScore.memGend}">
							<label>남자</label>
						</c:if></td>
				</tr>
				<tr>
					<td class="cmpTH"><spring:message code="mypage.recentvisit" />
					<td class="cmpTD">${complyScore.memLogin}</td>
				</tr>

				<tr>
					<td class="cmpTH"><spring:message code="mypage.tempature" />
					<td class="cmpTD">${complyScore.memEval}°C</td>
				</tr>
				<tr>
				<tr>
<%-- 				<td class="cmpTH"><spring:message code="mypage.tempature" /> --%>
<%-- 					<td class="cmpTD">${calNum}</td> --%>
<!-- 				</tr> -->
		
				<tr>
					<td class="cmpTH">점수 주기</td>
					<td class="cmpTD"><div class="comply-degree"
							style="height: 30px;">
							<input type="range" id = "score" min="0" max="10" list="tickmarks" onchange="valueViewChange()"
								style="height: 30px;">
							<datalist id="tickmarks">
								<option id="tickmarksValues" value="0">0</option>
								<option id="tickmarksValues" value="1">1</option>
								<option id="tickmarksValues" value="2">2</option>
								<option id="tickmarksValues" value="3">3</option>
								<option id="tickmarksValues" value="4">4</option>
								<option id="tickmarksValues" value="5">5</option>
								<option id="tickmarksValues" value="6">6</option>
								<option id="tickmarksValues" value="7">7</option>
								<option id="tickmarksValues" value="8">8</option>
								<option id="tickmarksValues" value="9">9</option>
								<option id="tickmarksValues" value="10">10</option>
							</datalist>
							<span id="scoreView"></span>
						</div> 
						
					</td>
				</tr>
			</tbody>
		</table>
		<form:input type="hidden" path="memDegree"/>
		<div>
			<form:button id="scoreBtn" type="submit" class="btn btn-primary">점수 주고 닫기</form:button>
		</div>
	</div>
</form:form>