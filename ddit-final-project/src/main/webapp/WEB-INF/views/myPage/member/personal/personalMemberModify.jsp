<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<form:form id="PmemberEditForm" modelAttribute="memberVO" method="post"
	enctype="multipart/form-data">


	<div class="personalInfo">
		<div class="kmb-title">
			<h2>개인정보관리</h2>
		</div>

		<div class="entireTable">
			<div class="modifyImgFrameDiv" id="modifyImgFrameDiv">
				<img src="${accImgName}" data-src="${accImgName}"
					style="height: 225px;" alt="Generic placeholder image"
					class="w-100 rounded-circle me-1 lazyestload" />
			</div>

			<div class="imageTitle" style="width: 110px;">
				<H3>프로필 사진</H3>
				<input type="file" name="multipartImage" class="input_img"
					onchange="setThumbnail(event)"
					accept="image/gif, image/jpeg, image/png, image/jpg" />
			</div>

		</div>
		<div class="personalModifyDivTable">
			<table class="modifyTable-personal">
				<tr>
					<th class="profile_table_width"><spring:message
							code="mypage.recentvisit" /></th>
					<td>${memberVO.memLogin }</td>
				</tr>
				<tr>
					<th><spring:message code="mypage.name" /></th>
					<td>${memberVO.memKln}${memberVO.memKfn}</td>
				</tr>
				<tr>
					<th><spring:message code="mypage.id" /></th>
					<td>${memberVO.memId }</td>
				</tr>
				<tr>
					<th><spring:message code="mypage.grade" /></th>
					<td>${memberVO.memGrade }</td>
				</tr>

				<tr>
					<th><spring:message code="mypage.nickName" /></th>
					<td><form:input path="memNick" style="width: 50%;"
							class="form-control bg-smoke" /></td>
				</tr>

				<tr>
					<th><spring:message code="mypage.birth" /></th>
					<td><form:input type="date" path="memBirth" style="width: 50%;"
							class="form-control bg-smoke"/></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.inout" /></th>
					<td><c:set var="nation" value='KR' /> <c:if
							test="${nation eq memberVO.memNat}">
							<input type='radio' name='inout' value='domestic' id='d' checked />
							<label for='d'>내국인</label>
						</c:if> <c:if test="${nation ne memberVO.memNat}">
							<input type='radio' name='inout' value='foreigner' id='f' checked />
							<label for='f'>외국인</label>
						</c:if></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.gender" /></th>
					<td><c:set var="gender" value='2' /> <c:if
							test="${gender eq memberVO.memGend}">
							<input type='radio' name='gender' value='female' id='f' checked />
							<label for='f'>여자</label>
						</c:if> <c:if test="${gender ne memberVO.memGend}">
							<input type='radio' name='gender' value='male' id='m' checked />
							<label for='m'>남자</label>
						</c:if></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.en_name" /></th>
					<td><form:input style="width: 30%; float:left"
							class="form-control bg-smoke" path="memEfn" /> <form:input
							style="width: 30%;" class="form-control bg-smoke" path="memEln" /></td>
				</tr>
				<tr>
					<th class="profile_table_width"><spring:message
							code="mypage.pswdModify" /></th>
					<td><input type="button" id="modifyBtn" value="변경하기"
						class="btn btn-primary" onclick="openChangePswdPop()"></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.phonenumb" /></th>
					<td><form:input path="memPhon" style="width: 50%;"
							class="form-control bg-smoke" /></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.homenumb" /></th>
					<td><form:input path="memHphon" style="width: 50%;"
							class="form-control bg-smoke" /></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.email" /></th>
					<td><form:input path="memMail" style="width: 50%;"
							class="form-control bg-smoke"/></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.regno" /></th>
					<td><form:input path="memAddr"
							style="width: 50%; display: inline;" type="text"
							class="form-control bg-smoke" required="required"
							placeholder="시,군,구,동 입력" readonly="readonly" /> <input type="button" id="address_kakao"
						class="btn btn-primary btn-block text-uppercase"
						required="required" value="주소찾기" /></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.regnodetail" /></th>
					<td><form:input path="memDaddr" style="width: 50%;"
							class="form-control bg-smoke"/></td>
				</tr>
				<tr>
					<th><spring:message code="mypage.introduce" /></th>
					<td><form:textarea rows="5" cols="30" path="accIntro" style="width: 50%;"
							class="form-control bg-smoke" /></td>
				</tr>

				<tr>
					<th><spring:message code="mypage.agreement" /></th>
					<td><spring:message code='mypage.subscribe'
							var="mypage_subscribe" /> <form:checkbox path="memCons"
							value="Y" label="${mypage_subscribe }" /></td>
				</tr>

				<tr>

					<th><spring:message code="mypage.tempature" /></th>
					<td class="mypage-comply-thermometer1"><input type="range"
						min="0" max="100" list="tickmarks" disabled
						value="${memberVO.memEval}"> <datalist id="tickmarks">
							<option value="0"></option>
							<option value="10"></option>
							<option value="20"></option>
							<option value="30"></option>
							<option value="40"></option>
							<option value="50"></option>
							<option value="60"></option>
							<option value="70"></option>
							<option value="80"></option>
							<option value="90"></option>
							<option value="100"></option>
						</datalist> &nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber
							value="${memberVO.memEval}" />°C</td>
				</tr>
				<tr>
					<th></th>
					<td><form:button type="submit" class="btn btn-primary">수정하기</form:button>&nbsp;
						<button type="button" class="btn btn-primary">탈퇴하기</button></td>


				</tr>
			</table>



		</div>
	</div>

</form:form>
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