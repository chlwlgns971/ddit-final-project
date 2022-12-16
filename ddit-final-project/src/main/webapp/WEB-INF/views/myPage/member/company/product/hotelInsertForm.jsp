<%@page import="kr.or.ddit.vo.AreaVO"%>
<%@page import="kr.or.ddit.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<form method="post" action="${cPath}/prod/Insert"
	enctype="multipart/form-data">

	<security:csrfInput />
	<div>

		<div class="kmb-title">
			<h2>상품등록하기</h2>
		</div>
		<table class="insertTable-company" id="prodTable">
			<tr>
				<th>상품 이미지</th>
				<td>&nbsp;&nbsp;
					<div id="imgBtn">
						<div id="image_container1" class="preImg"></div>
						<label  class='btn btn-primary btn-sm' className='input-file-button' for='multipartImage1'>추가하기</label>
						<input type='file' id = 'multipartImage1' name = 'multipartImage' style='display:none' onchange='setThumbnail1(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
<!-- 							multiple="multiple" onchange="setThumbnail1(event)" -->
<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->

						<div id="image_container2" class="preImg"></div>
						<label  class='btn btn-primary btn-sm' className='input-file-button' for='multipartImage2'>추가하기</label>
						<input type='file' id = 'multipartImage2' name = 'multipartImage' style='display:none' onchange='setThumbnail2(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
<!-- 							multiple="multiple" onchange="setThumbnail2(event)" -->
<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->

						<div id="image_container3" class="preImg"></div>
						<label  class='btn btn-primary btn-sm' className='input-file-button' for='multipartImage3'>추가하기</label>
						<input type='file' id = 'multipartImage3' name = 'multipartImage' style='display:none' onchange='setThumbnail3(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
<!-- 							multiple="multiple" onchange="setThumbnail3(event)" -->
<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->
						<div id="image_container4" class="preImg"></div>
						<label  class='btn btn-primary btn-sm' className='input-file-button' for='multipartImage4'>추가하기</label>
						<input type='file' id = 'multipartImage4' name = 'multipartImage' style='display:none' onchange='setThumbnail4(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
<!-- 							multiple="multiple" onchange="setThumbnail4(event)" -->
<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->
					</div>
				</td>
			</tr>
		</table>
		<div class="profInfotMajor1">
			<div class="profInfotMajor2">
				<div class="profInfotMajor3">
					<h2>상품 기본정보</h2>
				</div>
				<table id="hotelConvinInfoTable">
					<tr>
						<th>분류 선택</th>
						<th>상품명</th>
						<th>수량</th>
						<th><spring:message code="product.roomPrice" /></th>

					</tr>
					<tr>
						<td><select id="roomKind" class="form-control bg-smoke">
								<%
									List<CategoryVO> List = (List<CategoryVO>) request.getAttribute("categoryList");
									for (CategoryVO vo : List) {
										pageContext.setAttribute("categoryVO", vo);
								%><option value="${categoryVO.catCode}">
									${categoryVO.catNam}</option>
								<%
									}
								%>

						</select></td>
						<td><input type="text" name="prodNam" class="form-control bg-smoke"></td>
						<td><input type="number" name="prodQty" class="form-control bg-smoke"></td>
						<td><input type="number" name="romPrice" class="form-control bg-smoke"></td>
					</tr>
					<tr>
						<th><spring:message code="product.roomSize" /></th>
						<th><spring:message code="product.bedType" /></th>
						<th><spring:message code="product.roomGrade" /></th>
						<th><spring:message code="product.GuestCount" /></th>
					</tr>
					<tr>
						<td><input type="text" name="romExtnt" class="form-control bg-smoke"></td>
						<td><select name="romBed" class="form-control bg-smoke">
								<option value="트윈베드">트윈베드</option>
								<option value="킹베드">킹베드</option>
								<option value="더블베드">더블베드</option>
								<option value="퀸베드">퀸베드</option>
						</select></td>
						<td><select name="romGrade" class="form-control bg-smoke">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
						<td><select name="romGuest" class="form-control bg-smoke">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
				</table>
			</div>
			<div class="profInfotMajor3">
				<h2>편의시설 서비스</h2>
			</div>
			<div>
				<table class="modifyTable-company">
					<tr>
						<td onclick="main(event)"><label for="room_balcony"><spring:message
									code="product.roomBalTeras" /></label> <input type="checkbox"
							name="romBal" value="YES" id="room_balcony" /></td>
						<td onclick="main(event)"><label for="room_shower"><spring:message
									code="product.roomShower" /></label> <input type="checkbox"
							name="romSho" value="YES" id="room_shower" /></td>
						<td onclick="main(event)"><label for="room_aircon"><spring:message
									code="product.roomAircon" /></label> <input type="checkbox"
							name="romAirc" value="YES" id="room_aircon" /></td>
						<td onclick="main(event)"><label for="room_refri"><spring:message
									code="product.roomRefri" /></label> <input type="checkbox"
							name="romRef" value="YES" id="room_refri" /></td>
						<td onclick="main(event)"><label for="room_tv"><spring:message
									code="product.roomTv" /></label> <input type="checkbox" name="romTv"
							value="YES" id="room_tv" /></td>

					</tr>
					<tr>


						<td onclick="main(event)"><label for="room_heat"><spring:message
									code="product.roomHeat" /></label> <input type="checkbox"
							name="romHeat" value="YES" id="room_heat" /></td>
						<td onclick="main(event)"><label for="room_internet"><spring:message
									code="product.roomInternet" /></label> <input type="checkbox"
							name="romInt" value="YES" id="room_internet" /></td>
						<td onclick="main(event)"><label for="room_coffee"><spring:message
									code="product.roomCoffee" /></label> <input type="checkbox"
							name="romCof" value="YES" id="room_coffee" /></td>
						<td onclick="main(event)"><label for="room_pet"><spring:message
									code="product.roomPet" /></label> <input type="checkbox" name="romPet"
							value="YES" id="room_pet" /></td>

						<td>지역선택 <select name="areaCode" class="form-control bg-smoke">
								<c:set var="areaList" value="${areaList}" />
								<c:choose>
									<c:when test="${not empty areaList }">
										<c:forEach items="${areaList}" var="area">
											<option value="${area['areaCode']}">${area['areaName']}</option>
										</c:forEach>
									</c:when>
								</c:choose>
						</select></td>

					</tr>
				</table>
			</div>
		</div>
		<br> <br>
		<div class="buttons">
			<button type="submit" class="btn btn-primary">등록하기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
				class="btn btn-primary" type="submit" value="취소">
		</div>
		<input type="hidden" id="prodCode" name="prodCode" value="HCDRXR">
		<input type="hidden" value="${areaCode}" name="AreaCode">
	</div>
</form>
<script>
	// function main(event){
	// 	let optionBtn = event.target;
	// 	console.log(optionBtn);
	// 	let oldText = optionBtn.innerText;
	// 	let yesVal='YES';
	// 	let noVal='NO';
	// 	// 만약 기존의 optionBtn이 ✔로 시작한다면 
	// 	if(oldText.startsWith('✔')){
	// 		// 앞 한 글자 지우고 
	// 		let newText = oldText.substring(1);
	// 		console.log(newText);
	// 		// 검정색으로 바꿈
	// 		optionBtn.style.color = "";
	// 		// 텍스트 바꾸기
	// 		optionBtn.innerText = newText;
	// 		$("#abcde").val(noVal);

	// 		//만약 기존의 optionBtn이 ✔로 시작하지 않는다면 색을 바꾸고 앞에 ✔를 추가.
	// 	}else{
	// 		// 앞 한 글자 추가 
	// 		let newText = "✔"+oldText;
	// 		console.log(newText);
	// 		// 파란색으로 바꿈
	// 		optionBtn.style.color = "#01ace4";
	// 		// 텍스트 바꾸기
	// 		optionBtn.innerText = newText;
	// 		$("#abcde").val(yesVal);
	// 		console.log(prodSelect);
	// 	}

	// }
</script>


<script>

function setThumbnail1(event){
	for(var image of event.target.files){
	console.log(event);
	// 렌더링한 이미지 넣을 div 선택
	let image_container = document.querySelector("#image_container1");
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
		img.setAttribute("class", "col-lg-6");
		img.setAttribute("style", "width: 50%; height: auto;");
		image_container.appendChild(img);
	};
	reader.readAsDataURL(image);
	}
}

function setThumbnail2(event){
	for(var image of event.target.files){
	console.log(event);
	// 렌더링한 이미지 넣을 div 선택
	let image_container = document.querySelector("#image_container2");
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
		img.setAttribute("class", "col-lg-6");
		img.setAttribute("style", "width: 50%; height: auto;");
		image_container.appendChild(img);
	};
	reader.readAsDataURL(image);
	}
}

function setThumbnail3(event){
	for(var image of event.target.files){
	console.log(event);
	// 렌더링한 이미지 넣을 div 선택
	let image_container = document.querySelector("#image_container3");
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
		img.setAttribute("class", "col-lg-6");
		img.setAttribute("style", "width: 50%; height: auto;");
		image_container.appendChild(img);
	};
	reader.readAsDataURL(image);
	}
}

function setThumbnail4(event){
	for(var image of event.target.files){
	console.log(event);
	// 렌더링한 이미지 넣을 div 선택
	let image_container = document.querySelector("#image_container4");
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
		img.setAttribute("class", "col-lg-6");
		img.setAttribute("style", "width: 50%; height: auto;");
		image_container.appendChild(img);
	};
	reader.readAsDataURL(image);
	}
}
	function imageAdd() {
		$("#imgBtn")
				.append(
						"<input type='file' name='multipartImage' id='product_image' onchange='setThumbnail(event)' accept='image/gif, image/jpeg, image/png, image/jpg'/>")
						
							
	}
	$(document).ready(function() {
		$("#romBed").change(function() {
			$("#romBed").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		$("#romGrade").change(function() {
			$("#romGrade").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});
	$(document).ready(function() {
		$("#romGrade").change(function() {
			$("#romGrade").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		$("#selectArea").change(function() {
			$("#selectArea").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		let prodCode = $("#prodCode").val();
		$("#roomKind").change(function() {
			let data = "HC" + $(this).val();
			$("#prodCode").val(data);

		});
	});
	
	
</script>

