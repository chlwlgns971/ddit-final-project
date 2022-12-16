<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/signup/autoHyphen.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/signup/pwCheck.js"></script>

<form class=""  action="forgotId.do" method="post" style="margin-left:20%; margin-right:20%; ">
<!-- Forgot Id Modal -->
	<br>
	<h3 class="text-uppercase font-weight-bold" style="text-align:center;">
		아이디 찾기
	</h3>
	<br><br>

	<!-- 전화번호 입력받기 -->
	<div class="mb-3">
		<label for="dupl-text"> 핸드폰으로 인증 받기 </label>
		<p id="employee-id-hint" class="input-hint">
			핸드폰 번호를 입력해 주세요 <br> </p>
		<input id="phoneNum" type="text" name="phoneNum" 
				maxlength="13" class="form-control bg-smoke" oninput="autoHyphen(this)"
				placeholder="01012341234" style="width:78%; display:inline;" required >
		<input type="button" 
				class="btn btn-primary btn-block text-uppercase"
				onclick="javascript:fn_serialNum();" value="인증하기">
		<br><br>
		<label for="phoneNum" class="">인증번호 확인</label>
		<p id="" class="input-hint">6자리 숫자<br> </p>
		<input type="text" id="phoneNumCheck" name="phoneNumCheck" class="form-control" style="width:73%; display:inline;"
				placeholder="인증 번호를 입력해 주세요"  maxlength="6" readonly="readonly">
		<input type="button" class="btn btn-primary btn-block text-uppercase" 
				onclick="javascript:fn_serialNumCheck();" value="인증번호 확인"> 
				
				<input type="text" class="timer" style="border: none; color: red;">
	</div>
	
	<div id="hiden_findId" style="display:none">
		<input type = "text">
	</div>


	<div class="modal-footer justify-content-center" >
		<p class="mb-1">
			<a href="../index.do" >
				Main Page
			</a>
		</p>
	</div>
</form>

<!-- jQuery -->
<script>
var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
var myVar;
function time(){
	myVar = setInterval(alertFunc, 1000); 
}
function alertFunc() {
	var min = num / 60; 
	min = Math.floor(min);
	
	var sec = num - (60 * min);
	console.log(min)
	console.log(sec)

	var $input = $('.timer').val(min + ':' + sec);

	if(num == 0){
		clearInterval(myVar)
	}
	num--;
}
var checkNum ="";   
var phoneTrue = false;
const CSRFTokken = '${_csrf.token }';
function fn_serialNum() {
	time();
	alertFunc();
	$("#phoneNumCheck").attr('readonly', false); // 버튼 누르면 리드온리 취소
	var phoneNum = document.getElementById('phoneNum').value;   
// 	alert(phoneNum);
	$.ajax({
		url: "${pageContext.request.contextPath }/AccLoginn/message?_csrf="+CSRFTokken ,
		type: "POST",
		dataType : "JSON",
		data: { "phoneNum" : phoneNum },
		success: function(res) {
			
			alert("입력하신 " + "[ " + phoneNum +" ]"+"번으로 인증번호가 발송되었습니다.");
			checkNum = res;   
		}
	});

}

//인증번호 확인 버튼
function fn_serialNumCheck() {
	var phone=$('#phoneNum').val()
	
	if($("#phoneNumCheck").val()==checkNum){
// 		alert("인증번호가 확인되었습니다.");   
		phoneTrue = true;
		clearInterval(myVar);
// 		console.log(phone);
		$.ajax({
			url:"${pageContext.request.contextPath }/AccLoginn/finallyFindId.do?_csrf="+CSRFTokken,
			type:"POST",
			data:{"phoneNum" : phone} ,
			dataType : "JSON",
			success:function(data){
				let test = data.result;
				alert(test);
			},
			error:function(err){
				console.log(err);
				alert("에러입니다. 관리자에게 문의하여 주시기 바랍니다.");
			}
		});
	
	}else{
		alert("인증번호가 일치하지 않습니다.");
	}
}
</script>