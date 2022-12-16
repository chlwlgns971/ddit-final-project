<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="kr.or.ddit.vo.ProdImageVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<style>

	#majorProdImgList{
		height:500px;
		width: 830px
	}
	#image_container{
	width: 55%;
}
</style>
<div>
	<div class="kmb-title">
		<h2>상품상세보기</h2>
	</div>
	<div>
		<table id="prodTImgable">
			<tr>
				<td><div id="image_container">
						<img id="majorProdImgList"
							src="${majorImage}">
					</div></td>
			</tr>
			<tr>
				<td class="smallImage"><c:set var="prodImageList"
						value="${prodImgName }" /> <c:choose>
						<c:when test="${not empty prodImageList }">
							<c:forEach items="${prodImageList}" var="prodImg">
								<div id="image_container">
									<img class="beTheMajor prodImgList"
										src="${cPath }/resources/file/prod/${prodImg}">
								</div>
					&nbsp;&nbsp;
				</c:forEach>
						</c:when>
					</c:choose></td>
			</tr>
		</table>
		<div class="profInfotMajor1">
			<div class="profInfotMajor2">
				<div class="profInfotMajor3">
					<h2>상품 기본정보</h2>
				</div>
				<div>
					<table class="hotelProdDetail" id="prodTable">

						<tr>
							<th>업체명</th>
							<th>상품명</th>
							<th>수량</th>
							<th><spring:message code="product.roomPrice" /></th>
							<th><spring:message code="product.roomSize" /></th>
							<th><spring:message code="product.bedType" /></th>
							<th><spring:message code="product.roomGrade" /></th>
							<th><spring:message code="product.GuestCount" /></th>
						</tr>
						<tr>
							<td>업체명</td>
							<td>${hotelRoomVO.prodQty}</td>
							<td>${hotelRoomVO.romNam}</td>
							<td>₩ ${hotelRoomVO.romPrice}</td>
							<td>${hotelRoomVO.romExtnt}</td>
							<td>${hotelRoomVO.romBed}</td>
							<td>${hotelRoomVO.romGrade}등급</td>
							<td>${hotelRoomVO.romGuest}명</td>
						</tr>
					</table>
				</div>
			</div>
			<br> <br>
			<div class="profInfotMajor3">
				<h2>편의시설 서비스</h2>
			</div>
			<div>
				<table class="ProdConvenientDetail">
					<tr>
						<th onclick="main(event)"><label for="room_balcony"><spring:message
									code="product.roomBalTeras" /></label></th>
						<th onclick="main(event)"><label for="room_shower"><spring:message
									code="product.roomShower" /></label></th>
						<th onclick="main(event)"><label for="room_aircon"><spring:message
									code="product.roomAircon" /></label></th>
						<th onclick="main(event)"><label for="room_refri"><spring:message
									code="product.roomRefri" /></label></th>
						<th onclick="main(event)"><label for="room_tv"><spring:message
									code="product.roomTv" /></label></th>
					</tr>
					<tr>
						<td>${hotelRoomVO.romBal}</td>
						<td>${hotelRoomVO.romSho}</td>
						<td>${hotelRoomVO.romAirc}</td>
						<td>${hotelRoomVO.romRef}</td>
						<td>${hotelRoomVO.romTv}</td>
					</tr>
		
					<tr>

						<th onclick="main(event)"><label for="room_heat"><spring:message
									code="product.roomHeat" /></label></th>
						<th onclick="main(event)"><label for="room_internet"><spring:message
									code="product.roomInternet" /></label></th>
						<th onclick="main(event)"><label for="room_coffee"><spring:message
									code="product.roomCoffee" /></label></th>
						<th onclick="main(event)"><label for="room_pet"><spring:message
									code="product.roomPet" /></label></th>
						<th></th>
					</tr>
					<tr>

						<td>${hotelRoomVO.romHeat}</td>
						<td>${hotelRoomVO.romInt}</td>
						<td>${hotelRoomVO.romCof}</td>
						<td>${hotelRoomVO.romPet}</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="prodMng" style="display: flex;">
<div>
	<button class="btn btn-primary"
		onclick="location.href='${cPath}/mypage/member/company/product/HotelRoomUpdate?what=${prodNum}'">상품
		수정하기</button>
</div>&nbsp;
<form method="post" action="${cPath}/mypage/member/company/product/HotelRoomDelete" enctype="multipart/form-data">
<security:csrfInput />
	<input type="hidden" name="romNum" value="${hotelRoomVO.romNum}">
	<button  type="submit" class="btn btn-primary">상품 삭제하기</button>
</form>
</div>
<script type="text/javascript">
	$(".beTheMajor").on("click", function(event) {
			var small = $(this).attr("src");
			console.log(small);
			$("#majorProdImgList").attr("src", small);
		});
</script>