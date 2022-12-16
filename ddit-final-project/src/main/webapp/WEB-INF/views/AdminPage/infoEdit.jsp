<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<style>
	td{
		text-align: left;
	}
	textarea {
	    width: 60%;
	    height: 10em;
	    resize: none;
	}
</style>
	<div class="mainInfo">
	<form id="editPW" name="accountVO" action="${pageContext.request.contextPath }/mypage/admin/edit" method="post" onsubmit="return false"  enctype="multipart/form-data">
		<br>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;관리자 계정 관리</h3>
		<hr>
		<table id="infoTable"  style="width: 100%;">
			<tr>
				<th style="width: 30%">이름</th>
				<td style="width: 60%">${account['ADMIN_NAM'] }</td>   
			</tr>
			<tr>
				<th>아이디</th>
				<td>${account['ACC_ID'] }</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<security:csrfInput/>
					<input type='password' id = 'password'> &nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary  btn-sm" id="oldMatch" onclick="fn_match()">비밀번호 확인</button>
					<input type="hidden">
					<div id="pwMessage"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;" id='notice'>정보를 변경하기 위해서는 먼저 기존 패스워드를 입력해야합니다.</td>
			</tr>
				
		</table>
	</form>
			<div class="buttons">
				<button type="button" id = "submitBtn" class="btn btn-primary">수정하기</button>
			</div>
	</div>
		
<script>
	
	function setThumbnail(event){
		console.log(event);
		// 렌더링한 이미지 넣을 div 선택
		let image_container = document.querySelector("#image_container");
		//파일 정보 추출
		let fileKind = event.target.value.lastIndexOf('.');
		console.log(fileKind);
		let fileName = event.target.value.substring(fileKind+1,event.target.length);
		console.log(fileName);
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
		reader.readAsDataURL(event.target.files[0]);
		// 파일 렌더링 종료
	}

	let submitBtn = $("#submitBtn").click(function(event){
		let newPw = document.getElementById("newPw");
		let newPwComfirm = document.getElementById("newPwComfirm");
		let newPwData = newPw.value;
		let newPwComfirmData = newPwComfirm.value;
		let editPW = document.getElementById("editPW");
        event.preventDefault();
		console.log(newPwData);
		console.log(newPwComfirmData);
		if(newPwData==newPwComfirmData){
			editPW.submit();
		}else{
			let newMatch = document.getElementById("newMatch");
			console.log("not match");
			newMatch.innerText = "새로운 패스워드가 일치하지 않습니다. 다시 시도해주세요.";
		}
	});
		


	// newPWTag.style.display = "none";

	// let pwMessage= document.getElementById("pwMessage");
	let token = $("meta[name='_csrf']").attr('content');
	let header = $("meta[name='_csrf_header']").attr('content');
	let oldPw = document.getElementById("password");
	if(token && header) {
		$(document).ajaxSend(function(event, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	}
	let notice = document.getElementById("notice");
	let oldMatch = $("#oldMatch");
	function fn_match(){
		let password = document.getElementById("password");
		let inputPW = password.value;
		let infoTable = $("#infoTable");
		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/admin/match",
			method : "post",
			data : {password : inputPW},
			dataType : "text",
			beforeSend : function(xhr){
				if(token && header) {
					xhr.setRequestHeader(header, token);
		        };
	        },
			success : function(resp) {
				console.log(resp);
				// pwMessage.innerText=resp;
				if(resp==='1'){
					notice.style.display = 'none';
					pwMessage.innerText="패스워드가 일치합니다.";
					// newPWTag.style.display = "block";
					let newTag = 	"<tr>";
					newTag += 			"<th>프로필 사진</th>"
					newTag += 			"<td>"
					newTag += 				"<label  class='btn btn-primary btn-sm' className='input-file-button' for='profileImg'>변경하기</label>"
					newTag += 				"<input type='file' id = 'profileImg' name = 'profileImg' style='display:none' onchange='setThumbnail(event)'accept='image/gif, image/jpeg, image/png, image/jpg'>"
					newTag += 			"</td>";
					newTag += 		"</tr>";
					newTag += 		"<tr>";
					newTag += 			"<th>미리보기</th>";
					newTag += 			"<td><div id='image_container'></div></td>";
					newTag += 		"</tr>";
					newTag += 		"<tr>";
					newTag += 			"<th>변경할 패스워드</th>";
					newTag += 			"<td><input type='password' name='accPw' id='newPw'></td>";
					newTag += 		"</tr>";
					newTag += 		"<tr>";
					newTag += 			"<th>변경할 패스워드 확인</th>";
					newTag += 			"<td><input type='password' name='newPwComfirm' id='newPwComfirm'></td>";
					newTag += 		"</tr>";
					newTag += 		"<tr>";
					newTag += 			"<td colspan='2'><div id='newMatch'></div></td>";
					newTag += 		"</tr>";
					newTag += 		"<tr>";
					newTag += 			"<th style='vertical-align : top;'>소개 글</th>";
					newTag += 			"<td><textarea name='accIntro'>${account['ACC_INTRO'] }</textarea></td>";
					newTag += 		"</tr>";
					infoTable.append(newTag);
					oldPw.readOnly =true;
					// disable하기
					oldMatch.attr("disabled", true);
					
					
				}else{
					pwMessage.innerText="패스워드가 일치하지 않습니다.";
				}
			},
			error : function(errorResp) {
				console.log(inputPW);
				console.log(errorResp.status);
			}
		});
	}

	let message = '${message }';
	if(message.length>0){
		alert(message);
	}
	

</script>