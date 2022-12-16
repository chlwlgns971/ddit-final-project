<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form:form id="CmemberEditForm" modelAttribute="memberVO" method="post"
	enctype="multipart/form-data">

	<div class="companyEdit">
		<div class="kmb-title">
			<h2>업체정보관리</h2>
		</div>
		<div>
		<div class="entireTable">

			<div class="modifyImgFrameDiv" id="modifyImgFrameDiv">
				<img src="${accImgName}" data-src="${accImgName}"
					style="height: 225px;" alt="Generic placeholder image"
					class="w-100 rounded-circle me-1 lazyestload" />
			</div>
			<div class="imageTitle" style="width: 110px; margin-top: 10px;" >
				<H3>프로필 사진</H3>
				<input type="file" name="multipartImage" class="input_img" onchange="setThumbnail(event)"
					accept="image/gif, image/jpeg, image/png, image/jpg"/>
			</div>

		</div>
		<div class="memberModifyTable">
		<table class="modifyTable-company">
			<tr>
				<th><spring:message code="mypage.companyName" /></th>
				<td><form:input path="comCnam" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>
			<tr>
				<th><spring:message code="mypage.id" /></th>
				<td>${memberVO.comId }</td>
			</tr>
			<tr>
				<th><spring:message code="mypage.chargerName" /></th>
				<td><form:input path="comNam" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>

			<!--////////////////////호텔 업체//////////////// -->
			<security:authorize access="hasAnyRole('ROLE_HC')">
				<tr>
					<th>업종분류</th>
					<td>호텔</td>
				</tr>
			</security:authorize>
			<!--////////////////////렌터카 업체//////////////// -->
			<security:authorize access="hasAnyRole('ROLE_RC')">
				<tr>
					<th>업종분류</th>
					<td>렌터카</td>
				</tr>
			</security:authorize>
			<!--////////////////////////////////////////// -->
			<tr>
				<th><spring:message code="mypage.chargerPhoneNo" /></th>
				<td><form:input path="comPhon" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>

			<tr>
				<th><spring:message code="mypage.email" /></th>
				<td><form:input path="comMail" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>

			<tr>
				<th><spring:message code="mypage.companyNo" /></th>
				<td><form:input path="comRnum" style="width: 50%;"
							class="form-control bg-smoke"/></td>

			</tr>
			<tr>
				<th><spring:message code="mypage.companyAddress" /></th>
				<td><form:input path="comAddr"
							style="width: 50%; display: inline;" type="text"
							class="form-control bg-smoke" required="required"
							placeholder="시,군,구,동 입력" readonly="readonly" /> <input type="button" id="address_kakao"
						class="btn btn-primary btn-block text-uppercase"
						required="required" value="주소찾기" /></td>
			</tr>
			<tr>
				<th><spring:message code="mypage.regnodetail" /></th>
				<td><form:input path="comAddr2" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>
			<tr>
				<th><spring:message code="mypage.companyTel" /></th>
				<td><form:input path="comHphon" style="width: 50%;"
							class="form-control bg-smoke"/></td>
			</tr>

			<tr>
				<th><spring:message code="mypage.companyIntroduce" /></th>
				<td><form:textarea rows="5" cols="30" path="accIntro" style="width: 70%;"
							class="form-control bg-smoke" /></td>
			</tr>
			<tr>
				<th><spring:message code="mypage.agreement" /></th>
				<td><spring:message code='mypage.subscribe'
						var="mypage_subscribe" /> <form:checkbox path="comCons" value="Y"
						label="${mypage_subscribe }" /></td>
			</tr>
			<tr>
				<th><spring:message code="mypage.recentvisit" /></th>
				<td>${memberVO.comLogin }</td>
			</tr>
			<tr>
				<th></th>
				<td><form:button type="submit" class="btn btn-primary">수정하기</form:button>&nbsp;<button type="button" class="btn btn-primary">탈퇴하기</button></td>
	
			</tr>
		</table>
		</div>
		</div>
	</div>
</form:form>



<c:if test="${command eq 'UPDATE' }">
	<script type="text/javascript">
		$(":input:not(.editable)").prop("readonly", false);
	</script>
</c:if>
<script type="text/javascript">
function setThumbnail(event){
	for(var image of event.target.files){
	console.log(event);
	// 렌더링한 이미지 넣을 div 선택
	let image_container = document.querySelector("#modifyImgFrameDiv");
	//파일 정보 추출
	let fileKind = event.target.value.lastIndexOf('.');
	let fileName = event.target.value.substring(fileKind+1,event.target.length);
	
	let fileType = fileName.toLowerCase();
	let checkFileType = new Array();
	checkFileType = ['jpg','gif','png','jpeg'];
	
	if(checkFileType.indexOf(fileType)==-1){
	// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자가 아니라면 함수 탈출
		alert('이미지 파일만 선택할 수 있습니다.');
		let parentObj=event.parentNode;
		let node=parentObj.replaceChild(event.cloneNode(true), event);
		return false;
	}
	// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자라면 진행
	// 기존에 미리보기 했던 이미지가 있다면 비워내기
	image_container.innerHTML="";
	// 파일 렌더링 시작
	let reader = new FileReader();
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "w-100 rounded-circle me-1");
		img.setAttribute("style", "width: 50%; height: 225px;");
		image_container.appendChild(img);
	};
	reader.readAsDataURL(image);
	}
}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/signup/kakaoAddr.js"></script>
