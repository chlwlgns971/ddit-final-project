<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form:form class="modifyPswdForm" modelAttribute="AccountVO"
	method="post" enctype="multipart/form-data">
	<div class="modifyPswdTitle">
		<H2 style="margin-bottom: auto;">비밀번호 변경하기</H2>
	</div>
	<div class="popUpContainer">
		<div class="basicPswdVerify">
			<div class="popUpBackG-Color1">
				<div>
					<table class="modify-Table">
						<tr>
							<th><div class="modifyTable">
									<spring:message code="mypage.basicPswd" />
								</div></th>
							<td><div class="modifyTable">
									<input type="password" name="basicPswd" id="acc_pass"
										autocomplete="off" class="modifyInput">
								</div></td>
						</tr>

						<tr>
							<th><div class="modifyTable"></div></th>
							<td><div id="verifyMsg"></div></td>
						</tr>
					</table>
				</div>
			</div>
			<button type="button" class="btn btn-primary" id="changePW"
				onclick="veryfyBtn()">기존 비밀번호 확인하기</button>
		</div>

		<div>&nbsp;</div>

		<div class="newPswd">
			<div class="popUpBackG-Color2">
				<table class="modify-Table">
					<tr>
						<th><div class="modifyTable">
								<spring:message code="mypage.newPswd" />
							</div></th>
						<td><div class="modifyTable">
								<input type="password" name="newPswd" autocomplete="off"
									class="modifyInput" id="modifyPswd" disabled="disabled">
							</div></td>
					</tr>
					<tr>
						<th><div class="modifyTable">
								<spring:message code="mypage.newPswdVerify" />
							</div></th>
						<td><div class="modifyTable">
								<input type="password" name="newPswdVerify" autocomplete="off"
									class="modifyInput" id="modifyPswdValid" disabled="disabled">
							</div></td>
					</tr>
					<tr>
						<th><div class="modifyTable"></div></th>
						<td><div id="verifyInput"></div></td>
					</tr>
				</table>
			</div>
			<form:button id="pswdUpdateBtn" type="submit" class="btn btn-primary"
				disabled="disabled">수정하기</form:button>
		</div>
	</div>
</form:form>