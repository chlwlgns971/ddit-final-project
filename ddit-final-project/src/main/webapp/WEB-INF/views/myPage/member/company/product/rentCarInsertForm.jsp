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
						<label class='btn btn-primary btn-sm'
							className='input-file-button' for='multipartImage1'>추가하기</label>
						<input type='file' id='multipartImage1' name='multipartImage'
							style='display: none' onchange='setThumbnail1(event)'
							accept='image/gif, image/jpeg, image/png, image/jpg'>
						<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
						<!-- 							multiple="multiple" onchange="setThumbnail1(event)" -->
						<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->

						<div id="image_container2" class="preImg"></div>
						<label class='btn btn-primary btn-sm'
							className='input-file-button' for='multipartImage2'>추가하기</label>
						<input type='file' id='multipartImage2' name='multipartImage'
							style='display: none' onchange='setThumbnail2(event)'
							accept='image/gif, image/jpeg, image/png, image/jpg'>
						<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
						<!-- 							multiple="multiple" onchange="setThumbnail2(event)" -->
						<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->

						<div id="image_container3" class="preImg"></div>
						<label class='btn btn-primary btn-sm'
							className='input-file-button' for='multipartImage3'>추가하기</label>
						<input type='file' id='multipartImage3' name='multipartImage'
							style='display: none' onchange='setThumbnail3(event)'
							accept='image/gif, image/jpeg, image/png, image/jpg'>
						<!-- 						<input type="file" name="multipartImage" id="multipartImage" -->
						<!-- 							multiple="multiple" onchange="setThumbnail3(event)" -->
						<!-- 							accept="image/gif, image/jpeg, image/png, image/jpg" /> -->
						<div id="image_container4" class="preImg"></div>
						<label class='btn btn-primary btn-sm'
							className='input-file-button' for='multipartImage4'>추가하기</label>
						<input type='file' id='multipartImage4' name='multipartImage'
							style='display: none' onchange='setThumbnail4(event)'
							accept='image/gif, image/jpeg, image/png, image/jpg'>
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
				<div>
				<div>
					<table id="carConvinInfoTable">
						<tr>
							<th>제조사</th>
							<th>차종</th>
							<th>상품명</th>
							<th>수량</th>
						</tr>
						<tr>
							<td><select name="carBrand" class="form-control bg-smoke">
									<%
										List<CategoryVO> brandList = (List<CategoryVO>) request.getAttribute("carBrandCategoryList");
										for (CategoryVO brand : brandList) {
											pageContext.setAttribute("categoryVO", brand);
									%><option class="carKindClass" value="${categoryVO.catNam}">${categoryVO.catNam}</option>
									<%
										}
									%>
							</select></td>
							<td><select name="carKind" id="carKind"
								onchange="itemChange()" class="form-control bg-smoke">
									<%
										List<CategoryVO> List = (List<CategoryVO>) request.getAttribute("categoryList");
										for (CategoryVO vo : List) {
											pageContext.setAttribute("categoryVO", vo);
									%><option class="carKindClass" value="${categoryVO.catNam}">
										${categoryVO.catNam}</option>
									<%
										}
									%>
							</select></td>
							<td><input type="text" name="prodNam"
								class="form-control bg-smoke"></td>
							<td><input type="number" name="prodQty"
								class="form-control bg-smoke"></td>

						</tr>
						<tr>
							<th>가격</th>
							<th>색상</th>
							<th>연료</th>
							<th>인승</th>
						</tr>
						<tr>
							<td><input type="number" name="carPrice"
								class="form-control bg-smoke"></td>
							<td><select name="carColor" class="form-control bg-smoke">
									<%
										List<CategoryVO> colorList = (List<CategoryVO>) request.getAttribute("carColorCategoryList");
										for (CategoryVO color : colorList) {
											pageContext.setAttribute("categoryVO", color);
									%><option value="${categoryVO.catNam}">
										${categoryVO.catNam}</option>
									<%
										}
									%>
							</select></td>
							<td><select name="carFuel" class="form-control bg-smoke">
									<%
										List<CategoryVO> fuelList = (List<CategoryVO>) request.getAttribute("carFuelCategoryList");
										for (CategoryVO fuel : fuelList) {
											pageContext.setAttribute("categoryVO", fuel);
									%><option value="${categoryVO.catNam}">
										${categoryVO.catNam}</option>
									<%
										}
									%>
							</select></td>
							<td><select id="personSeat" class="form-control bg-smoke"><option>4</option></select></td>
						</tr>

					</table>
					</div>
					<br>
					<div class="profInfotMajor3">
						<h2>편의시설 서비스</h2>
					</div>
					<div>
						<table id="prodTable2">
							<tr>
								<td onclick="main(event)"><label for="car_highPass">하이패스
										여부</label> <input type="checkbox" name="carHp" value="YES"
									id="car_highPass" /></td>
								<td onclick="main(event)"><label for="car_charger">차량용
										충전기</label> <input type="checkbox" name="carCharg" value="YES"
									id="car_charger" /></td>
								<td onclick="main(event)"><label for="car_navigation">네비게이션
										여부</label> <input type="checkbox" name="carNavi" value="YES"
									id="car_navigation" /></td>
								<td onclick="main(event)"><label for="car_holder">차량용
										거치대</label> <input type="checkbox" name="carHolder" value="YES"
									id="car_holder" /></td>
								<td onclick="main(event)"><label for="car_heat">시트
										열선</label> 
										<input type="checkbox" name="carHeat" value="YES" id="carHeat" /></td>
								<td onclick="main(event)"><label for="car_airCon">에어컨
								</label> <input type="checkbox" name="carAc" value="YES" id=carAc /></td>
							</tr>

							<tr>
								<td><label>기어방식</label>&nbsp;<select name="carGear"
									id="carGear" class="form-control bg-smoke">
										<%
											List<CategoryVO> gearList = (List<CategoryVO>) request.getAttribute("carGearCategoryList");
											for (CategoryVO gear : gearList) {
												pageContext.setAttribute("categoryVO", gear);
										%><option value="${categoryVO.catCode}">
											${categoryVO.catNam}</option>
										<%
											}
										%>
								</select></td>

								<td onclick="main(event)"><label for="car_bag">차량
										수하물 갯수</label> <select name="carBag" class="form-control bg-smoke">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
								</select></td>
								
							</tr>



						</table>
					</div>
					<br>
					<div class="profInfotMajor3">
						<h2>지역 선택</h2>
					</div>
					<div>
						<table class="modifyTable-company">
						<tr>
						<td>지역선택 <select name="areaCode"
									class="form-control bg-smoke">
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
			</div>
		</div>
	</div>
	<br> <br>
	<div class="buttons">
		<button type="submit" class="btn btn-primary">등록하기</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
			class="btn btn-primary" type="submit" value="취소">
	</div>
	<input type="hidden" id="prodCode" name="prodCode" value="RCSMRC">
	<input type="hidden" value="${areaCode}" name="AreaCode">
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
	function itemChange() {
		var 경차 = [ "4" ];
		var 소형차 = [ "4" ];
		var 중형차 = [ "4", "5" ];
		var 대형차 = [ "5", "6" ];
		var SUV = [ "7", "8" ];

		var changeCarKind;

		var carKind = $('#carKind').val();
		console.log(carKind + "ZZZZZ");

		if (carKind == "경차") {
			changeCarKind = 경차;
		} else if (carKind == "소형차") {
			changeCarKind = 소형차;
		} else if (carKind == "중형차") {
			changeCarKind = 중형차;
		} else if (carKind == "대형차") {
			changeCarKind = 대형차;
		} else if (carKind == "SUV") {
			changeCarKind = SUV;
		}

		console.log(changeCarKind);
		$('#personSeat').empty();

		for (var count = 0; count < changeCarKind.length; count++) {
			var option = $("<option>" + changeCarKind[count] + "</option>");
			$('#personSeat').append(option);
		}
	}

	$(document).ready(function() {
		$("#carBrand").change(function() {
			$("#carBrand").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		$("#carKind").change(function() {
			$("#carKind").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});
	$(document).ready(function() {
		$("#carColor").change(function() {
			$("#carColor").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		$("#carFuel").change(function() {
			$("#carFuel").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});
	$(document).ready(function() {
		$("#carGear").change(function() {
			$("#carGear").val($(this).val());
			console.log("값변경테스트: " + $(this).val());

		});
	});

	$(document).ready(function() {
		let prodCode = $("#prodCode").val();
		$("#roomKind").change(function() {
			let data = "RC" + $(this).val();
			$("#prodCode").val(data);

		});
	});
	function setThumbnail1(event) {
		console.log(event);
		// 렌더링한 이미지 넣을 div 선택
		let image_container1 = document.querySelector("#image_container1");
		//파일 정보 추출
		let fileKind = event.target.value.lastIndexOf('.');
		console.log(fileKind);
		let fileName = event.target.value.substring(fileKind + 1,
				event.target.length);
		console.log(fileName);
		let fileType = fileName.toLowerCase();
		let checkFileType = new Array();
		checkFileType = [ 'jpg', 'gif', 'png', 'jpeg' ];

		if (checkFileType.indexOf(fileType) == -1) {
			// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자가 아니라면 함수 탈출
			alert('이미지 파일만 선택할 수 있습니다.');
			let parentObj = event.parentNode;
			let node = parentObj.replaceChild(event.cloneNode(true), event);
			return false;
		}
		// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자라면 진행
		// 기존에 미리보기 했던 이미지가 있다면 비워내기
		image_container1.innerHTML = "";
		// 파일 렌더링 시작
		let reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style", "width: 50%; height: auto;");
			image_container1.appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function setThumbnail2(event) {
		console.log(event);
		// 렌더링한 이미지 넣을 div 선택
		let image_container2 = document.querySelector("#image_container2");
		//파일 정보 추출
		let fileKind = event.target.value.lastIndexOf('.');
		console.log(fileKind);
		let fileName = event.target.value.substring(fileKind + 1,
				event.target.length);
		console.log(fileName);
		let fileType = fileName.toLowerCase();
		let checkFileType = new Array();
		checkFileType = [ 'jpg', 'gif', 'png', 'jpeg' ];

		if (checkFileType.indexOf(fileType) == -1) {
			// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자가 아니라면 함수 탈출
			alert('이미지 파일만 선택할 수 있습니다.');
			let parentObj = event.parentNode;
			let node = parentObj.replaceChild(event.cloneNode(true), event);
			return false;
		}
		// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자라면 진행
		// 기존에 미리보기 했던 이미지가 있다면 비워내기
		image_container2.innerHTML = "";
		// 파일 렌더링 시작
		let reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style", "width: 50%; height: auto;");
			image_container2.appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function setThumbnail3(event) {
		console.log(event);
		// 렌더링한 이미지 넣을 div 선택
		let image_container3 = document.querySelector("#image_container3");
		//파일 정보 추출
		let fileKind = event.target.value.lastIndexOf('.');
		console.log(fileKind);
		let fileName = event.target.value.substring(fileKind + 1,
				event.target.length);
		console.log(fileName);
		let fileType = fileName.toLowerCase();
		let checkFileType = new Array();
		checkFileType = [ 'jpg', 'gif', 'png', 'jpeg' ];

		if (checkFileType.indexOf(fileType) == -1) {
			// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자가 아니라면 함수 탈출
			alert('이미지 파일만 선택할 수 있습니다.');
			let parentObj = event.parentNode;
			let node = parentObj.replaceChild(event.cloneNode(true), event);
			return false;
		}
		// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자라면 진행
		// 기존에 미리보기 했던 이미지가 있다면 비워내기
		image_container3.innerHTML = "";
		// 파일 렌더링 시작
		let reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style", "width: 50%; height: auto;");
			image_container3.appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function setThumbnail4(event) {
		console.log(event);
		// 렌더링한 이미지 넣을 div 선택
		let image_container4 = document.querySelector("#image_container4");
		//파일 정보 추출
		let fileKind = event.target.value.lastIndexOf('.');
		console.log(fileKind);
		let fileName = event.target.value.substring(fileKind + 1,
				event.target.length);
		console.log(fileName);
		let fileType = fileName.toLowerCase();
		let checkFileType = new Array();
		checkFileType = [ 'jpg', 'gif', 'png', 'jpeg' ];

		if (checkFileType.indexOf(fileType) == -1) {
			// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자가 아니라면 함수 탈출
			alert('이미지 파일만 선택할 수 있습니다.');
			let parentObj = event.parentNode;
			let node = parentObj.replaceChild(event.cloneNode(true), event);
			return false;
		}
		// 첨부된 이미지의 확장자가 사용할 수 있는 이미지 확장자라면 진행
		// 기존에 미리보기 했던 이미지가 있다면 비워내기
		image_container4.innerHTML = "";
		// 파일 렌더링 시작
		let reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style", "width: 50%; height: auto;");
			image_container4.appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
	$("#continentsSelect").on('change', function(event){
		let continentName = $(this).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/prod/hotelList/country",
			data : { name: continentName},
			dataType : "json",
			success : function(resp) {
				$('#countrySelect').find("option").remove();   //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
				let nationsList = resp;
				let options = [];

				options.push($("<option>").attr(
						"value", "000").prop(
						"selected", true).text(
						"국가를 선택하세요"));


				$.each(nationsList, function(index, category){
					let option = $("<option>").attr("value", category.catCode)
											.text(category.catNam);
					options.push(option);
				})
				$('#countrySelect').append(options);
				$('#countrySelect').selectric('init'); 	//selectric 초기화
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		})
	});
</script>

