<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<form:form method="post" action="${pageContext.request.contextPath }/AccLoginn/accountBisSign.do" 
			modelAttribute="AccountSignUpVO" role="form" class="from" id="join_form">
	<security:csrfInput/>
	<!-- Signup Modal Business -->
	<h3 class="modal-title text-uppercase font-weight-bold" style="text-align:center;">
		<br>
		사업자회원가입
		<br>
		<br>
		<br>
	</h3>
	<!-- 회원가입 분류 -->
	<div class="memCodeRadio" style="margin-left:8%;width: 85%;">
		<!-- 호텔사업자 -->
		<form:radiobutton path="memCode" value="ROLE_HC"  id="hrBiz" name="memCode2" checked="checked"/> 호텔사업자
		<!-- 렌트카사업자 -->
		<form:radiobutton path="memCode" value="ROLE_RC"  id="rcBiz" name="memCode2" style="margin-left:10%;"/> 렌트카사업자
		<br><br>
	</div>	
	
	
	<!-- ID 입력 -->
	<div class="id" style="margin-left:8%;width: 85%;">
		<h4 >ID</h4>
		<form:input path="accId" type="text" name="accId"
				class="form-control bg-smoke id_input" placeholder="영문 소문자로 시작 숫자포함 4글자 이상" id="accId" pattern="[a-z][a-zA-Z0-9]{3,12}"
				maxlength="12" minlength="4" required="required" />
				<span id="accIdChk" ></span>
				<div><font id="id_feedback" size="2"></font></div>
	</div>
	
	<!-- PW 입력 -->
	<div class="pw" style="margin-left:8%;width: 85%;">
		<br>
		<h4 >비밀번호</h4>
		<form:password path="accPw" class="form-control bg-smoke" name="accPw"
				placeholder="영문자, 숫자, 특수문자 조합 7자리 이상" id="accPw" maxlength="16" minlength="7" required="required"/>
		<!-- PW 확인 -->
		<input type="password" class="form-control bg-smoke" required="required"
				placeholder="영문자, 숫자, 특수문자 조합 7자리 이상" id="accPw2" maxlength="16" minlength="7">
	</div>
	
	<!-- 회사명 입력-->
	<div class="name" style="margin-left:8%;width: 85%;">
		<br>
		<h4 >회사명</h4>
		<form:input path="comCnam" type="text" class="form-control bg-smoke" id="comCnam" 
				placeholder="한글 또는 영문" required = "required" />
	</div>
	
	<!-- 연락처1 -->
	<div class="phone1" style="margin-left:8%;width: 87%; ">
		<br>
		<h4>핸드폰번호</h4>
		<form:input path="comHphon" style="width:84%; display: inline;" id="comHphon" 
				aria-describedby="employee-pnum-hint" type="text" name="comHphon" 
				oninput="autoHyphen(this)" maxlength="13" class="form-control bg-smoke"
				placeholder="01012341234" required = "required"/>
		<!-- 문자인증 -->
		<input type="button" 
				class="btn btn-primary btn-block text-uppercase btnclick"
				onclick="javascript:fn_serialNum();" value="휴대폰인증"/>
		<!-- 연락처 1 인증 -->
		<br><br>
		<div id="checkPnumindividual" style="display:none">
			<label for="phoneNum" class="">인증번호 확인</label>
			<p id="" class="input-hint">6자리 숫자<br> </p>
			<input type="text" id="phoneNumCheck" name="phoneNumCheck" class="form-control" style="width:82%; display:inline;"
					placeholder="인증 번호를 입력해 주세요"  maxlength="6" readonly="readonly"/>
			<input type="button" class="btn btn-primary btn-block text-uppercase" 
					onclick="javascript:fn_serialNumCheck();" value="인증번호 확인"/> 
					
			<input type="text" class="timer" style="border: none; color: red;">
		</div>
	</div>
	
	<!-- 담당자 입력-->
	<div class="name" style="margin-left:8%;width: 85%;">
		<br>
		<h4 >담당자 이름</h4>
		<form:input path="comNam" type="text" class="form-control bg-smoke" id="comNam" 
				placeholder="담당자 이름" required = "required" />
	</div>
	
	<!-- 연락처2 -->
	<div class="comPhon" >
		<br>
		<h4 style="margin-left:8%;width: 73%;">회사전화번호</h4>
		<form:input path="comPhon" style="margin-left:8%;width: 85%;" id="comPhon" 
				aria-describedby="employee-pnum-hint" type="text" name="comPhon" 
				oninput="autoHyphen2(this)" maxlength="13" class="form-control bg-smoke"
				placeholder="01012341234 / 0422228202" />
	</div>
	
	<!-- 이메일 -->
	<div class="email" style="margin-left:8%;width: 85%;">
		<br>
		<h4 >이메일</h4>
		<input name="email1" id="email1" type="text"/>@
		<input name="email2" id="email2" type="text"/>
		<form:hidden path="comMail" value=""/>
		<select name="select_Email" id="selectEmail">
			<option value="" disabled >선택하기</option>
			<option value="directly" id="selectEmailText" selected>직접입력</option>
			<option value="gmail.com" id="gmail.com" >gmail.com</option>
			<option value="naver.com" id="naver.com">naver.com</option>
			<option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			<option value="hotmail.com" id="hotmail.com">hotmail.com</option>
			<option value="nate.com" id="nate.com">nate.com</option>
		</select>
		
		<br>
		<!-- 구독 체크박스 -->
		<input type="checkbox" value="news"  name="NEWS_LATTER" checked="checked"/>뉴스레터 구독
	</div>

	<!-- 주소 -->
	<!-- 카카오 주소 API -->
	<div class="mb-3" style="margin-left:8%;width: 85%;">
		<br>
		<h4>회사주소</h4>
		<!-- 기본주소 입력 -->
		<div class="mb-43" style="">
			<form:input path="comAddr" style="width: 88%; display: inline;" type="text" 
				class="form-control bg-smoke" required="required" placeholder="시,군,구,동" 
				readonly="readonly" />
			<input style="float: right;" type="button" id="bisaddress_kakao" 
				class="btn btn-primary btn-block text-uppercase" required="required"
				value="주소찾기" />
		</div>
		<!-- 상세주소 입력-->
		<form:input path="comAddr2" type="text" class="form-control bg-smoke" 
				placeholder="상세주소 입력" />
	</div>
	
	<!-- 사업자번호 -->
	<div class="mb-3" style="margin-left:8%;width: 85%;">
		<h4>사업자번호</h4>
		<form:input path="comRnum" type="text" class="form-control bg-smoke" id="comRnum" maxlength="10"
				required="required" oninput="autoHyphen3(this)" placeholder="사업자 번호 입력" />
	</div>
	<div class="mb-3 form-check mb-0" style="margin-left:8%;width: 73%;">
		<input type="checkbox" class="form-check-input" id="exampleCheck4" checked = "checked">
		<label class="form-check-label text-gray-color mb-3" for="exampleCheck4" > 
			가입 버튼을 누름으로서 사이트 이용 약관에 동의합니다.
		</label>
	</div>
	
	<div class="join_button_wrap" align = "center">
		<input type="button" onclick="javascript:joinform_check();" 
				class="btn btn-primary btn-block text-uppercase join_button" 
				value="회원가입"/>
	</div>

	<!-- 로그인화면으로 이동 -->
	<div class="modal-footer justify-content-center" >
		<p class="mb-1">
			<a href="../index.do" >
				Main Page
			</a>
		</p>
	</div>
</form:form>
<script>
var pNumBlank = $("")
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
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'
function fn_serialNum() {
	time();
	alertFunc();
	$("#phoneNumCheck").attr('readonly', false); // 버튼 누르면 리드온리 취소
	var phoneNumber = document.getElementById('comHphon').value;   
// 	alert(phoneNumber);
	$.ajax({
	url: "${pageContext.request.contextPath }/AccLoginn/message?_csrf="+CSRFTokken ,
	type: "POST",
	dataType : "JSON",
	data: { "phoneNum" : phoneNumber },
		success: function(res) {
			alert("입력하신 " + "[ " + phoneNumber +" ]"+"번호로 인증번호가 발송되었습니다.");
			checkNum = res;   
		}
	});
}

$(".btnclick").click(function(){
	$("#checkPnumindividual").show();
})

//인증번호 확인 버튼
function fn_serialNumCheck() {
	var phone=$('#phoneNum').val()

	if($("#phoneNumCheck").val()==checkNum){
		alert("인증번호가 확인되었습니다.");   
		phoneTrue = true;
		clearInterval(myVar);
		console.log(phone);
	}else{
	alert("인증번호가 일치하지 않습니다.");
	}

}
</script>
<script src="<%=request.getContextPath()%>/resources/js/signup/autoHyphen.js" ></script>
<script src="<%=request.getContextPath()%>/resources/js/signup/idCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/signup/kakaoAddr_bis.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/signup/mail.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" type="text/css" 
		href="${pageContext.request.contextPath}/resources/css/accountSign.css">
<script src="<%=request.getContextPath()%>/resources/js/signup/signCheckBis.js?<%=System.currentTimeMillis()%>" ></script>