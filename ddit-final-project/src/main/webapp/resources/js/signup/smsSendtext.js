const CSRFTokken = $("meta[name=_csrf]").attr("content");

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


	$.ajax({
		url: "${pageContext.request.contextPath }/AccLoginn/message?_csrf="+CSRFTokken ,
		type: "POST",
		dataType : "JSON",
		data: { "phoneNum" : phoneNum },
		success: function(res) {
			alert("입력하신 " + "[ " + phoneNum +" ]"+"번호로 인증번호가 발송되었습니다.");
			checkNum = res;   
		}
	});

}

//인증번호 확인 버튼
function fn_serialNumCheck() {
	if($("#phoneNumCheck").val()==checkNum){
		alert("인증번호가 확인되었습니다.");   
		phoneTrue = true;
		clearInterval(myVar);
	}else{
		alert("인증번호가 일치하지 않습니다.");
	}

}
//인증번호 일치시 번호에 해당하는 ID를 alert로 출력
//function 