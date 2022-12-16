<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="kr.or.ddit.vo.ProdImageVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<style>
#majorProdImgList {
	height: 500px;
	width: 830px
}

#image_container {
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
					<table class="carProdDetail" id="prodTable">

						<tr>
							<th>제조사</th>
							<th>차종</th>
							<th>차량명</th>
							<th>수량</th>
							<th>가격</th>
							<th>색상</th>
							<th>연료</th>
							<th>인승</th>
						</tr>
						<tr>
							<td>${rentCarVO.carBrand}</td>
							<td>${rentCarVO.carKind}</td>
							<td>${rentCarVO.prodNam}</td>
							<td>${rentCarVO.prodQty}</td>
							<td>${rentCarVO.carPrice}</td>
							<td>${rentCarVO.carColor}</td>
							<td>${rentCarVO.carFuel}</td>
							<td>${rentCarVO.carSeat}</td>

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
						<th>에어컨</th>
						<th>하이패스</th>
						<th>차량용 충전기</th>
						<th>네비게이션</th>
						<th>차량용 거치대</th>
						<th>시트 열선</th>
						<th>기어 방식</th>
						

					</tr>
					<tr>
						<td>${rentCarVO.carAc}</td>
						<td>${rentCarVO.carHp}</td>
						<td>${rentCarVO.carCharg}</td>
						<td>${rentCarVO.carNavi}</td>
						<td>${rentCarVO.carHolder}</td>
						<td>${rentCarVO.carHeat}</td>
						<td>${rentCarVO.carGear}</td>
						
					</tr>
					<tr>
					<th>차량 수하물</th>
					</tr>
					<tr>
					<td>${rentCarVO.carBag}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="prodMng" style="display: flex;">
<div>
	<button class="btn btn-primary"
		onclick="location.href='${cPath}/mypage/member/company/product/HotelRoomUpdate?what=${prodNum}'">상품 수정하기</button>
</div>&nbsp;
<form method="post" action="${cPath}/mypage/member/company/product/rentCarDelete" enctype="multipart/form-data">
<security:csrfInput />
	<input type="hidden" name="prodNum" value="${rentCarVO.prodNum}">
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