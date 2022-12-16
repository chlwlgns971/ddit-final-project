<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<style>
#selectBoxes {
	margin-top: 10px;
	margin-bottom: 15px;
	height: 60px;
}

.selectItem {
	width: 25%;
	margin-left: 6%;
	margin-bottom: 20px;
	float: left;
}

#contiList, #natList, #destList {
	height: 50px;
}

textarea {
	resize: none;
}

.form-control {
	/* 		margin-top: 20px; */
	margin-bottom: 20px;
}

.mainInfo {
	height: 720px;
	overflow: scroll;
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

.mainInfo::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.py-10 {
	margin-bottom: 0px;
}

#destinationform {
	margin-left: 10%;
	margin-right: 10%;
}

.destImgs{
	width: 31%;
	margin-left:1%;
	margin-right:1%;
	height: auto;
	float: left;
}
#imgContainer{
	width:100%;
	height: 130px;
}
.selectric{
	width:200px;
}



</style>
<!DOCTYPE html>
<div class="mainInfo">
	<br>
	<div class="container" style="float: left; margin-bottom: 30px;">
		<div style="width: 40%; float: left">
			<h3 style="margin: 25px 0px 0px 5px">여행지 관리</h3>
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="newDest" data-bs-toggle="modal" data-bs-target="#destModal"
			style="float: right; margin-top: 10px; margin-left: 20px;">새 여행지 추가</button>
	</div>
	<div style="margin-bottom: 20px;">
		<div id="selectBoxes">
			<div class="select-default select-category-1 selectItem">
				<select id="contiList" class="select-option"
					onchange="fn_getNation(event)">
					<option>대륙 선택</option>
					<c:choose>
						<c:when test="${not empty continentList }">
							<c:forEach items="${continentList }" var="continent">
								<option value="${continent['catCode'] }">${continent['catNam'] }</option>
							</c:forEach>
						</c:when>
					</c:choose>
				</select>
			</div>
			<div class="select-default select-category-1 selectItem">
				<select id="natList" class="select-option"
					onchange="fn_getDestination(event)">
					<option>국가 선택</option>
				</select>
			</div>
			<div class="select-default select-category-1 selectItem"
				onchange="fn_DestinationDetail(event)">
				<select id="destList" class="select-option">
					<option>여행지 선택</option>
				</select>
			</div>
		</div>
		<br> <br> <br>
		<div id="detailDestView">
			<form id="destinationform" name="destination" method="post" action="${pageContext.request.contextPath }/mypage/admin/editDetail">
				<security:csrfInput/>
				<input type="hidden" id="areaCode" name="areaCode">
				<h5>대표 이미지</h5>
					<div id = "imgContainer">
						<img src="" data-src="" class = "destImgs" id="destImg1">
						<img src="" data-src="" class = "destImgs" id="destImg3">
						<img src="" data-src="" class = "destImgs" id="destImg2">
					</div>
				<table style="width:100%">
					<tr style="height: 50px;">
						<td>
							<label  class='btn btn-primary btn-sm' for='profileImg'>변경하기</label>
							<input type='file' name = 'profileImg' style='display:none' onchange='setThumbnail(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
						</td>
						<td>
							<label  class='btn btn-primary btn-sm' for='profileImg'>변경하기</label>
							<input type='file' name = 'profileImg' style='display:none' onchange='setThumbnail(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
						</td>
						<td>
							<label  class='btn btn-primary btn-sm' for='profileImg'>변경하기</label>
							<input type='file' name = 'profileImg' style='display:none' onchange='setThumbnail(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
						</td>
					</tr>
				</table>
				<div>
					<h5>날씨 배경 이미지</h5>
					<div style="height:270px; ">
						<img src="" data-src="" class="destImgs" id="destWimg" name="destWimg">
					</div>
					<div style="height:50px; ">
						<label  class='btn btn-primary btn-sm' for='profileImg'>변경하기</label>
						<input type='file' name = 'profileImg' style='display:none' onchange='setThumbnail(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>
					</div>
				</div>
				<div>
					<h5>소개글</h5>
					<textarea id="destInfo" name="destInfo" class="form-control" rows="5" cols="40"></textarea>
					<h5>언어</h5>
					<input type="text" name="destLang" id="destLang" class="form-control">
					<h5>면적</h5>
					<input type="text" name="destExten" id="destExten" class="form-control">
					<h5>인구</h5>
					<input type="text" name="destPopul" id="destPopul" class="form-control">
					<h5>시차</h5>
					<input type="text" name="destTime" id="destTime" class="form-control">
					<h5>종교</h5>
					<input type="text" name="destRelig" id="destRelig" class="form-control">
					<h5>전압</h5>
					<input type="text" name="destVolt" id="destVolt" class="form-control">
					<h5>화폐</h5>
					<input type="text" name="destCur" id="destCur" class="form-control">
					<h5>비자</h5>
					<textarea id="destVisa" name="destVisa" class="form-control" rows="5" cols="40"></textarea>
					<h5>물가</h5>
					<textarea id="destPrice" name="destPrice" class="form-control"
						rows="5" cols="40"></textarea>
					<h5>기후</h5>
					<textarea id="destWeather" name="destWeather" class="form-control"
						rows="5" cols="40"></textarea>
					<h5>여행최적시기</h5>
					<textarea id="destBtime" name="destBtime" class="form-control"
						rows="5" cols="40"></textarea>
					<h5>항공편</h5>
					<textarea id="destAir" name="destAir" class="form-control" rows="5"
						cols="40"></textarea>
					<h5>회화</h5>
					<textarea id="destConv" name="destConv" class="form-control"
						rows="10" cols="40"></textarea>
					<br> <br> <br>
					<button type="submit" class = "btn btn-primary btn-sm">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="destModal" tabindex="-1" aria-labelledby="destModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="destModalLabel">Modal title</h5>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
		    <div class="modal-body">
		    	...
		    </div>
	      	<div class="modal-footer" id='destModalFooter'>
      		</div>
    	</div>
  	</div>
</div>

<script>
	//spring security 설정
	var token = $("meta[name='_csrf']").attr('content');
	var header = $("meta[name='_csrf_header']").attr('content');
	if (token && header) {
		$(document).ajaxSend(function(event, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	}
	
	let destModalBody = $("#destModal").find(".modal-body");
	let destModalLabel = $("#destModalLabel");
	// 비동기로 모달의 대륙 정보 selectBox 채우기
	let destView = $("#newDest").click(function(event){
		event.preventDefault();
		let destModalFooter = $("#destModalFooter");
		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/admin/contiList",
			method : "post",
			beforeSend: function(xhr){
// 				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				if(token && header) {
		            xhr.setRequestHeader(header, token);
		        };
	        },
			dataType : "json",
			success : function(resp) {
				// 기존 데이터 날리기
				destModalBody.empty();
				destModalFooter.empty();
				destModalLabel.text("여행지 추가");
				//받아온 값 destModalBody에 넣기
				var destData = "<table style='width:100%;'>";
				destData += 		"<tr>";
				destData += 			"<td>대륙 선택</td>";
				destData += 			"<td>";
				destData += 				"<div class='select-default select-category-1 selectItem'>";
				destData += 					"<select id='contiCat' class='select-option' onchange='modalNat(event)'>";
				destData += 					"<option>대륙 선택</option>";
				$.each(resp, function(index, item){
					destData += 					"<option value='"+item.catCode+"'>"+ item.catNam + "</option>";
				});
				destData += 				"</div>";
				destData += 			"</td>";
				destData += 		"</tr>";
				destData += 		"<tr>";
				destData += 			"<td>국가 선택</td>";
				destData += 			"<td>";
				destData += 				"<div class='select-default select-category-1 selectItem'>";
				destData += 					"<select id='natCat' class='select-option'>";
				destData += 						"<option>국가 선택</option>";
				destData += 				"</div>";
				destData += 			"</td>";
				destData += 		"</tr>";
				destData += 		"<tr>";
				destData += 			"<td>여행지 입력</td>";
				destData += 			"<td>";
				destData += 				"<input type='text' name='destName' id='destName' class='form-control'>";
				destData += 			"</td>";
				destData += 		"</tr>";
				destData += 	"<table>";
				destModalBody.append(destData);
				
				
				var submitBtn = "<button type='button' class='btn btn-primary' onclick='destSubmit(event)' id='destInsert'>여행지 등록</button>";
				destModalFooter.append(submitBtn);
				$("#contiCat").selectric('init');
				$("#natCat").selectric('init');
				
				console.log(resp);
			},
			error : function(errorResp) {
				// 기존 데이터 날리기
				destModalBody.empty();
				var destData = "<table style='width:100%;'>";
				destData += "<tr>";
				destData += "<td colspan='2' style='text-align:\"center\";'>통신 중 에러가 발생했습니다.<br>다시 시도해주세요.<td>";
				destData += "</tr>";
				destData += "<table>";
				destModalBody.append(destData);
				
				console.log(resp);
				console.log(errorResp.status);
			}
		});
		return false;
	});
	
	
	// 비동기로 모달에서 대륙 선택 시 국가 리스트 받아오기
	function modalNat(event){
		// 선택한 대륙 코드 받아오기
		let contiCode = document.getElementById("contiCat").value;
		$.ajax({
			url : "${cPath}/mypage/admin/nationList",
			method : "post",
			beforeSend : function(xhr) {
				if (token && header) {
					xhr.setRequestHeader(header, token);
				};
			},
			data : {
				continent : contiCode
			},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				// 기존 데이터가 있다면 지우기
				let natList = $("#natCat");
				console.log(natList);
				natList.html("");
				// 받아온 데이터로 a 태그들 생성
				let nationTag = "";
				nationTag += "<option>국가 선택</option>"

				$.each(resp, function(index, item) {
					nationTag += "<option value='"+item.catCode+"'>"
							+ item.catNam + "</option>"
				})
				natList.append(nationTag);
				natList.selectric('init');
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		
		
	}
	
	// 비동기로 여행지 등록
	function destSubmit(event){
		let nationCode = $("#natCat").val();
		let destName = $("#destName").val();
		console.log("natCat: ", nationCode," destName: ", destName);
		
		$.ajax({
			url : "${cPath}/mypage/admin/insertDest",
			method : "post",
			beforeSend : function(xhr) {
				if (token && header) {
					xhr.setRequestHeader(header, token);
				};
			},
			data : {
				nationCode: nationCode,
				destName: destName
			},
			dataType : "text",
			success : function(resp) {
				console.log(resp);
// 				alert(resp);
				$("#destModal").modal('hide');
				
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		
		
	}
	
	
	
	
	
	
	
	
	

	// 대륙 설정 후 국가 정보 가져오기
	function fn_getNation(event) {
		console.log(event.target.value);
		let contiCode = event.target.value;
		$.ajax({
			url : "${cPath}/mypage/admin/nationList",
			method : "post",
			beforeSend : function(xhr) {
				if (token && header) {
					xhr.setRequestHeader(header, token);
				};
			},
			data : {
				continent : contiCode
			},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				// 기존 데이터가 있다면 지우기
				let natList = $("#natList");
				console.log(natList);
				natList.html("");
				let destList = document.getElementById("destList");
				destList.innerHTML = "";
				// 받아온 데이터로 a 태그들 생성
				let nationTag = "";
				nationTag += "<option>국가 선택</option>"

				$.each(resp, function(index, item) {
					nationTag += "<option value='"+item.catCode+"'>"
							+ item.catNam + "</option>"
				})
				natList.append(nationTag);
				natList.selectric('init');
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
	}

	// 국가 설정 후 여행지 정보 가져오기
	function fn_getDestination(event) {
		console.log(event.target.value);
		let natCode = event.target.value;
		//비동기로 해당 대륙의 국가 리스트 가져오고 태그 생성 뒤 natList에 append 하기 
		$.ajax({
			url : "${cPath}/mypage/admin/destList",
			method : "post",
			beforeSend : function(xhr) {
				if (token && header) {
					xhr.setRequestHeader(header, token);
				}
				;
			},
			data : {
				nation : natCode
			},
			dataType : "json",
			success : function(resp) {
				console.log(resp);

				// 기존 데이터가 있다면 지우기
				let destList = $("#destList");
				console.log(destList);
				destList.html("");

				// 받아온 데이터로 a 태그들 생성
				let destTag = "";
				destTag += "<option>국가 선택</option>"

				$.each(resp, function(index, item) {
					destTag += "<option value='"+item.catCode+"'>"
							+ item.catNam + "</option>"
				})
				destList.append(destTag);
				destList.selectric('init');
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
	}

	//여행지 상세 정보 가져오기
	function fn_DestinationDetail(event) {
		console.log(event);
		console.log("선택 국가 코드: ", event.target.value);

		let destCode = event.target.value;
		//비동기로 해당 대륙의 국가 리스트 가져오고 태그 생성 뒤 natList에 append 하기 
		$.ajax({
			url : "${cPath}/mypage/admin/destDetail",
			method : "post",
			beforeSend : function(xhr) {
				if (token && header) {
					xhr.setRequestHeader(header, token);
				}
				;
			},
			data : {
				destCode : destCode
			},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				// 목적지 코드
				$('#areaCode').val(resp.areaCode);
				// alert($('#areaCode').val());
				// 이미지1
				console.log($('#destImg1'));
				$('#destImg1').attr("src", resp.destImg1);
				$('#destImg1').attr("data-src", resp.destImg1);
				// 이미지2
				$('#destImg2').attr("src", resp.destImg2);
				$('#destImg2').attr("data-src", resp.destImg2);
				// 이미지3
				$('#destImg3').attr("src", resp.destImg3);
				$('#destImg3').attr("data-src", resp.destImg3);
				// 날씨 이미지
				$('#destWimg').attr("src", resp.destWimg);
				$('#destWimg').attr("data-src", resp.destWimg);
				// 소개글
				$('#destInfo').val(resp.destInfo);
				// 언어
				$('#destLang').val(resp.destLang);
				// 면적
				$('#destExten').val(resp.destExten);
				// 인구
				$('#destPopul').val(resp.destPopul);
				//시차
				$('#destTime').val(resp.destTime);
				//종교
				$('#destRelig').val(resp.destRelig);
				//전압
				$('#destVolt').val(resp.destVolt);
				//화폐
				$('#destCur').val(resp.destCur);
				//비자
				$('#destVisa').val(resp.destVisa);
				//물가
				$('#destPrice').val(resp.destPrice);
				//기후
				$('#destWeather').val(resp.destWeather);
				//여행최적시기
				$('#destBtime').val(resp.destBtime);
				//항공편
				$('#destAir').val(resp.destAir);
				//회화
				console.log($('#destConv'));
				$('#destConv').html(resp.destConv);
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
	}
	let datas = $("#destinationform");

	
let message = '${message}';
if(message.length>0){
	alert(message);
}
	
	
	
	
</script>