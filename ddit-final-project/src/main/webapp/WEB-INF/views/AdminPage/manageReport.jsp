<%@page import="kr.or.ddit.vo.PersonalMemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<style>
	textarea {
	    resize: none;
	}
</style>
<script>
	if('${rowCnt }'=='1'){
		alert("신고 처리가 정상적으로 이루어졌습니다.");
		
	}else if('${rowCnt }'==''){
		
	}else{
		alert("처리 중 문제가 발생했습니다. 다시 시도하십시오.");
	}
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
	    history.go(1);
	};
</script>
<div class="mainInfo">
	<br>
	<div class="container">
		<div class="mb-6" style=" height:20px;">
			<ul class="nav nav-tabs destination-tabs" id="destinationTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="overView-tab" href="${pageContext.request.contextPath }/mypage/admin/manageMem" >일반 회원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="tourGuide-tab" href="${pageContext.request.contextPath }/mypage/admin/manageComp">기업 회원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="tourGuide-tab" href="${pageContext.request.contextPath }/mypage/admin/manageReport">신고 내역</a>
				</li>
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
				<td class="boTitle">신고 번호</td>
				<td class="boTitle">ID</td>
				<td class="boTitle">신고 유형</td>
				<td class="boTitle">게시판</td>
			</tr>
			<c:set var="reportList" value="${pagingVO.dataList }"/>
			<c:choose>
				<c:when test="${not empty reportList }">
				<c:forEach items="${reportList }" var="report">
					<tr class="reportItem" data-what="${report['repNum'] }" 
							data-bs-toggle="modal" data-bs-target="#reportModal">
						<td>${report['repNum'] }</td>
						<td>${report['memId'] }</td>
						<td>${report['repCode'] }</td>
						<td>${report['repBcode'] }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">신고 기록이 없습니다.</td>
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
	<div id="searchUI">
		<select name="searchType">
			<option value="repNum">신고 접수 번호</option>
			<option value="memId">ID</option>
			<option value="repCode">신고 유형</option>
			<option value="repBode">신고 게시판</option>
		</select>
		<input type="text" name="searchWord" />
		<input type="button" value="검색" id="searchBtn"/>
	</div>
</div>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" />
	<input type="hidden" name="searchWord" />
</form>
<!-- 		신고기록 상세보기 실행하기 위한 hidden form -->
<form id="reportPick" method="post">
	<input type="hidden" name="repNum"/>
</form>

<!-- Modal -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">신고처리하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer" id='reportModalFooter'>
      </div>
    </div>
  </div>
</div>

<script>

	let reportModalBody = $("#reportModal").find(".modal-body");
	//비동기로 신고 내역 가져오기
	let reportView = $(".reportItem").click(function(event){
		event.preventDefault();
		var token = $("meta[name='_csrf']").attr('content');
		var header = $("meta[name='_csrf_header']").attr('content');
		if(token && header) {
	        $(document).ajaxSend(function(event, xhr, options) {
	            xhr.setRequestHeader(header, token);
	        });
	    }
		let reportNum = $(this).data("what");
		let reportModalFooter = $("#reportModalFooter");
		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/admin/reportDetail",
			method : "post",
			data : {repNum: reportNum},
			beforeSend: function(xhr){
// 				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				if(token && header) {
		            xhr.setRequestHeader(header, token);
		        };
	        },
			dataType : "json",
			success : function(resp) {
				// 기존 데이터 날리기
				reportModalBody.empty();
				
				//받아온 값 reportModalBody에 넣기
				var reportData = "<table style='width:100%;'>";
				reportData += "<tr>";
				reportData += "<td>신고번호</td>";
				reportData += "<td>"+resp.report.repNum+"</td>";
				reportData += "</tr>";
				reportData += "<tr>";
				reportData += "<td>신고자</td>";
				reportData += "<td>"+resp.report.memId+"</td>";
				reportData += "</tr>";
				reportData += "<tr>";
				reportData += "<td>신고대상</td>";
				reportData += "<td>"+resp.report.repId+"</td>";
				reportData += "</tr>";
				reportData += "<tr>";
				reportData += "<td>신고유형</td>";
				reportData += "<td>"+resp.report.repCode+"</td>";
				reportData += "</tr>";
				reportData += "<tr>";
				reportData += "<td>신고 내용</td>";
				if(resp.report.repCont!=null){
					reportData += "<td>"+resp.report.repCont+"</td>";
				}else{
					reportData += "<td>"+'작성 내용 없음'+"</td>";
				}
				reportData += "</tr>";
				reportData += "<table>";
				reportModalBody.append(reportData);
				
				var sanction="<br><form id='sancForm' method='post' action='${pageContext.request.contextPath }/mypage/admin/sancInsert'><table style='width:100%;'>";
				sanction += "<tr>";
				sanction += "<td>제재 선택</td>"
				sanction += "</tr>";
				sanction += "<tr>";
				sanction += "<td>";
				sanction += 	"<select name='sancCode'>"; 
				$.each(resp.category, function(index, category){
					sanction+= "<option value='"+category.catCode+"'>"+category.catNam+"</option>";
				}) 
				sanction += 	"</select>"; 
				sanction += "</td>";
				sanction += "</tr>";
				sanction += "<tr>";
				sanction += "<td>제재 사유</td>"
				sanction += "</tr>";
				sanction += "<tr>";
				sanction += "<td><textarea name='sancResn' rows='10' cols='50'/></td>"
				sanction += "</tr>";
				sanction += "</table>";
				sanction += "<input type='hidden' name='repNum' value='"+resp.report.repNum+"'>";
				sanction += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>";
				sanction += "</form>";
				reportModalBody.append(sanction);
				
				reportModalFooter.empty();
				var submitBtn = "<button type='button' class='btn btn-primary' onclick='reportSubmit()' id='sancInsert'>제재 등록</button>";
				reportModalFooter.append(submitBtn);
				//message가 있다면 추가 작업 불가. alert 띄우기
				var message = resp.message;
				if(message.length>0){
// 					alert(message);
					$("#sancInsert").attr("disabled", true);
				}
				console.log($("#sancInsert").attr("disabled"));	
				console.log(resp);
			},
			error : function(errorResp) {
				// 기존 데이터 날리기
				reportModalBody.empty();
				var reportData = "<table style='width:100%;'>";
				reportData += "<tr>";
				reportData += "<td colspan='2' style='text-align:\"center\";'>통신 중 에러가 발생했습니다.<br>다시 시도해주세요.<td>";
				reportData += "</tr>";
				reportData += "<table>";
				reportModalBody.append(reportData);
				
				console.log(resp);
				console.log(errorResp.status);
			}
		});
		return false;
	});
	
	
	function reportSubmit(){
		console.log("reportSubmit");
		
		$("#sancForm").submit();
	}
	
	
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit;
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
	
	
	
</script>