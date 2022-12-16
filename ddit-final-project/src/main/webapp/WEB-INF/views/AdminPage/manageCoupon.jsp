<%@page import="kr.or.ddit.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<div class="mainInfo">
	<br>
	<div class="container">
		<div class="mb-6" style=" height:20px;">
			<ul class="nav nav-tabs destination-tabs" id="destinationTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="overView-tab" href='<%=request.getContextPath()%>/mypage/admin/manageCoupon'>쿠폰</a>
				</li>
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" id="tourGuide-tab" href='<%--=request.getContextPath()--%>/mypage/admin/manageMileage'>마일리지</a> -->
<!-- 				</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" id="locationMap-tab" data-bs-toggle="tab" href="#locationMap" role="tab" aria-controls="locationMap" aria-selected="false">Location map</a> -->
<!-- 					</li> -->
             
                <li class="nav-item d-none"></li>
			</ul>
			
		</div>
	</div>
	<br/>
	<br/>
	<table class="table" style='margin-top: 30px;'>
		<tbody>
			<tr>
				<td class="boTitle">쿠폰명</td>
				<td class="boTitle">발급일</td>
				<td class="boTitle">사용 기한</td>
				<td class="boTitle">혜택 내용</td>
			</tr>
			<c:set var="couponList" value="${pagingVO.dataList }"/>
			<c:choose>
				<c:when test="${not empty couponList }">
					<c:forEach items="${couponList }" var="coupon">
						<tr class="couponItem" data-what="${coupon['couNum'] }" 
								data-bs-toggle="modal" data-bs-target="#couponModal">
							<td>${coupon['couNam'] }</td>
							<td>${fn:substring(coupon['couSdate'],0,10) }</td>
							<td>${fn:substring(coupon['couEdate'],0,10) }</td>
							<c:choose>
								<c:when test="${'DCP' eq coupon['couCode'] }">
									<td>${coupon['couDisc'] }원</td>
								</c:when>
								<c:otherwise>
									<td>${coupon['couDisc'] }%</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">해당 쿠폰 발급 기록이 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<section class="pt-5 pt-md-7">
		<div class="container pagingArea">
			${pagingVO.pagingHTML }
		</div>
	</section>
	<button type="button" id="instCoupon" class="btn btn-info text-white mb-2" data-bs-toggle="modal" data-bs-target="#couponModal" onclick="fn_instCoupon()">쿠폰 등록</button>
	<div id="searchUI">
		<input type="text" name="searchWord" />
		<input type="button" value="검색" id="searchBtn"/>
	</div>
</div>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" />
	<input type="hidden" name="searchWord" />
</form>

<!-- Modal -->
<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">쿠폰 상세보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="couponForm" method="post" name="coupon" action="${pageContext.request.contextPath }/mypage/admin/couponUpdate">
				<security:csrfInput/>
				<div class="modal-body">
					...
				</div>
			</form>
			<div class="modal-footer" id='couponModalFooter'>
			</div>
		</div>
	</div>
</div>
<!-- Modal end-->

<form id="deleteCouponForm" action="${pageContext.request.contextPath }/mypage/admin/couponDelete" method="post">
	<security:csrfInput/>
	<input type="hidden" id="couNum" name="couNum">
</form>

<script>
	let couponForm = document.querySelector("#couponForm");
	let exampleModalLabel = document.getElementById("exampleModalLabel");
	function insertCoupon(){
		// 폼 도착지 변경
		couponForm.action="${pageContext.request.contextPath }/mypage/admin/couponInsert";
		//폼 제출
		couponForm.submit();
	}
	function fn_instCoupon(){
		//기존 이벤트 지우기
		event.preventDefault();
		// 기존 내용 지우기
		couponModalBody.empty();
		// modal을 여러 번 열 경우 중복으로 버튼이 생성됨을 막기 위해 기존 버튼을 지우고 새로 만듦.
		couponModalFooter.empty();
		// 제목 변경
		exampleModalLabel.innerText = "쿠폰 등록";
		// 폼 형식 만들기
		
		let insertForm = 	"<table style='width:100%;'>";
			insertForm +=        "<tr>";
				insertForm +=        	"<td>쿠폰명</td>";
				insertForm +=        	"<td><input type='text' name='couNam' style='width:250px;'/></td>";
				insertForm +=        "</tr>";
				insertForm +=        "<tr>";
					insertForm +=        	"<td>발급 수량</td>";
					insertForm +=        	"<td><input type='number' name='couQty' style='width:250px;'/></td>";
					insertForm +=        "</tr>";
					insertForm +=        "<tr>";
		insertForm +=        	"<td>적용 할인</td>";
		insertForm +=        	"<td>"
			insertForm +=        		"<input type='number' name='couDisc' style='width:150px;'> &nbsp;&nbsp;&nbsp;&nbsp;";
			insertForm +=        		"<select name = 'couCode'>"
				<% 
				List<CategoryVO> catList = (List<CategoryVO>) request.getAttribute("cpList");
					for(CategoryVO vo : catList){
						%>		
						insertForm +=        		"<option value='"+'<%=vo.getCatCode() %>'+"'>"+'<%=vo.getCatNam() %>'+"</option>";
						<% 
					}
					%>
					
					insertForm +=			"</td>";
					insertForm +=        	"</select>"
					insertForm +=        "</tr>";
		insertForm +=        "<tr>";
			insertForm +=        	"<td>유효기간</td>";
			insertForm +=        	"<td><input type='date' name='couSdate'/> ~ <input type='date' name='couEdate'/></td>";
			insertForm +=        "</tr>";
			insertForm +=		"</table>";
			
			//append 하기
			couponModalBody.append(insertForm);
		
		// modal의 footer에 insert submit 버튼 만들기
		let insertBtn ="<button type='button' class='btn btn-primary' onclick='insertCoupon()' id='insertBtn'>등록</button>"
		
		
		couponModalFooter.append(insertBtn);
		
	}

	
	
	
	
	
	// 비동기로 가져온 데이터 넣을 modal의 body
	let couponModalBody = $("#couponModal").find(".modal-body");
	// 수정/삭제 버튼 넣을 modal의 footer
	let couponModalFooter = $("#couponModalFooter");
	//비동기로 쿠폰 내역 가져오기
	let couponItem = $(".couponItem").click(function(event){
		event.preventDefault();
		var token = $("meta[name='_csrf']").attr('content');
		var header = $("meta[name='_csrf_header']").attr('content');
		if(token && header) {
			$(document).ajaxSend(function(event, xhr, options) {
				xhr.setRequestHeader(header, token);
	        });
	    }
		//couNum 받기
		let couNum = $(this).data("what");
		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/admin/couponDetail",
			method : "post",
			data : {couNum: couNum},
			// 				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			beforeSend: function(xhr){
				if(token && header) {
					xhr.setRequestHeader(header, token);
		        };
	        },
			dataType : "json",
			success : function(resp) {
				window.resp=resp;
				// 데이터 획득 성공 여부 보기 위한 출력
				console.log(resp);
				// 기존 데이터 날리기
				couponModalBody.empty();
				// 제목 변경
				exampleModalLabel.innerText = "쿠폰 보기";
				var code= "";
				if ('DCP'==resp.couCode){
					code = '원';
				}else{
					code = '%';
				}
				
				//받아온 값 couponModalBody에 넣기
				var couponData =	"<table style='width:100%;'>";
				couponData +=			"<tr>";
				couponData +=				"<td>쿠폰 번호</td>";
				couponData +=				"<td>"+resp.couNum+"</td>";
				couponData +=			"</tr>";
				couponData +=			"<tr>";
				couponData +=				"<td>쿠폰명</td>";
				couponData +=				"<td>"+resp.couNam+"</td>";
				couponData +=			"</tr>";
				couponData +=			"<tr>";
				couponData +=				"<td>유효기간</td>";
				couponData +=				"<td>"+resp.couSdate.substring(0,10)+"~"+resp.couEdate.substring(0,10)+"</td>";
				couponData +=			"</tr>";
				couponData +=			"<tr>";
				couponData +=				"<td>혜택</td>";
				couponData +=				"<td>"+resp.couDisc+code+"할인</td>";
				couponData +=			"</tr>";
				couponData +=			"<tr>";
				couponData +=				"<td>발급자ID</td>";
				couponData +=				"<td>"+resp.accId+"</td>";
				couponData +=			"</tr>";
				couponData +=			"<tr>";
				couponData +=				"<td>잔여수량</td>";
				couponData +=				"<td>"+resp.couQty+"</td>";
				couponData +=			"</tr>";
				couponData +=		"</table>";
				
				
				
				
				couponModalBody.append(couponData);
				
				// modal을 여러 번 열 경우 중복으로 버튼이 생성됨을 막기 위해 기존 버튼을 지우고 새로 만듦.
				couponModalFooter.empty();
				var submitBtn = "<div>이미 발급한 쿠폰의 경우 이름과 사용 기한만 수정 가능합니다.</div><br><button type='button' class='btn btn-primary' onclick='createForm()' id='couponForm'>수정</button></form>";
// 				submitBtn += "<button type='button' class='btn btn-primary' onclick='deleteFormSubmit()' id='deleteCoupon'>삭제</button>";
				couponModalFooter.append(submitBtn);
				//message가 있다면 추가 작업 불가. alert 띄우기
				var message = resp.message+"";
				if(!message&&message.length>0){
					alert(message);
				}
				
			},
			error : function(errorResp) {
				var couponData = "<table style='width:100%;'>";
				couponData += "<tr>";
				couponData += "<td colspan='2' style='text-align:\"center\";'>통신 중 에러가 발생했습니다.<br>다시 시도해주세요.<td>";
				couponData += "</tr>";
				couponData += "<table>";
				couponModalBody.append(couponData);
				
				console.log(resp);
				console.log(errorResp.status);
			},
		});
		return false;
	});
	
		
// 	function deleteFormSubmit(){
		
// 		let deleteForm = document.querySelector("#deleteCouponForm");
// 		console.log(deleteForm);
// 		var token = $("meta[name='_csrf']").attr('content');
// 		var header = $("meta[name='_csrf_header']").attr('content');
// 		if(token && header) {
// 			$(document).ajaxSend(function(event, xhr, options) {
// 				xhr.setRequestHeader(header, token);
// 	        });
// 	    }
// 		let couNum = document.querySelector("#couNum");
// 		couNum.value = resp.couNum;

// 		console.log(resp.couNum);
// 		deleteForm.submit();
// 		console.log('couponDelete is submit');
// 	}
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit();
	});
	let searchForm = $("#searchForm");
	let pageTag = $("[name=page]");
	$("[name=searchType]").val("${pagingVO.simpleCondition.searchType}");
	$("[name=searchWord]").val("${pagingVO.simpleCondition.searchWord}");
	$(".pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		pageTag.val(page);
		searchForm.submit();
		return false;
	});


	function createForm(){
		console.log("couponSubmit developing");
		
		couponModalBody.empty();
		var code= "";
		if ('DCP'==resp.couCode){
			code = '원';
		}else{
			code = '%';
		}
		// 제목 변경
		exampleModalLabel.innerText = "쿠폰 수정";
		//받아온 값 couponModalBody에 Form으로  넣기
		var couponData =	"<table style='width:100%;'>";
		couponData +=			"<tr>";
		couponData +=				"<td>쿠폰 번호</td>";
		couponData +=				"<td>"+resp.couNum+"</td>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>쿠폰명</td>";
		couponData +=				"<td><input type='text' name='couNam' value='"+resp.couNam+"'></td>";
		couponData +=				"<input type='hidden' name='couNum' value='"+resp.couNum+"'>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>시작일</td>";
		couponData +=				"<td><input type='date' name ='couSdate' value='"+resp.couSdate.substring(0,10)+"'></td>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>종료일</td>";
		couponData +=				"<td> <input type='date' name ='couEdate' value='"+resp.couEdate.substring(0,10)+"'></td>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>혜택</td>";
		couponData +=				"<td>"+resp.couDisc+code+"할인</td>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>발급자ID</td>";
		couponData +=				"<td>"+resp.accId+"</td>";
		couponData +=			"</tr>";
		couponData +=			"<tr>";
		couponData +=				"<td>잔여수량</td>";
		couponData +=				"<td>"+resp.couQty+"</td>";
		couponData +=			"</tr>";
		couponData +=		"</table>";

		
		
		couponModalBody.append(couponData);
		
		// modal을 여러 번 열 경우 중복으로 버튼이 생성됨을 막기 위해 기존 버튼을 지우고 새로 만듦.
		couponModalFooter.empty();
		var submitBtn = "<div>이미 발급한 쿠폰의 경우 이름과 사용 기한만 수정 가능합니다.</div><br>";
		submitBtn += "<button type='button' class='btn btn-primary' onclick='updateForm()' id='couponForm'>수정</button>";
		couponModalFooter.append(submitBtn);
		//message가 있다면 추가 작업 불가. alert 띄우기
		var message = resp.message+"";
		if(!message&&message.length>0){
			alert(message);
		}
// 		$("#couponForm").submit();
	}
	
	
	function updateForm(){
		let couponUpdate = document.querySelector("#couponForm");
		
		var token = $("meta[name='_csrf']").attr('content');
		var header = $("meta[name='_csrf_header']").attr('content');
		if(token && header) {
			$(document).ajaxSend(function(event, xhr, options) {
				xhr.setRequestHeader(header, token);
	        });
	    }
		console.log('couponUpdate is submit');
		couponUpdate.submit();
	}
	let message = '${message }';
	if (message.length>0){
		alert(message);
	}
	
</script>