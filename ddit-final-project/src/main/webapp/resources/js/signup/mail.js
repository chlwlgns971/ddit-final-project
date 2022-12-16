// 메일 도메인 변경
$(function(){
	$("#selectEmail").change(function(){
		if($("#selectEmail").val() == "directly"){
			$("#email2").attr("disabled", false);
			$("#email2").val("");
			$("#email2").focus();
		} else {
			$("#email2").val($("#selectEmail").val());
		}
	});
});

// 메일 발송

var code = "";	//이메일전송 인증번호 저장위한 코드
/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	var email = $(".mail_input").val();			// 입력한 이메일
	var cehckBox = $(".mail_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
	var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
	
	/* 이메일 형식 유효성 검사 */
	if(mailFormCheck(email)){
		alert("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
// 		warnMsg.css("display", "inline-block");
	} else {
		alert("올바르지 못한 이메일 형식입니다.");
// 		warnMsg.css("display", "inline-block");
		return false;
	}
	
	$.ajax({
		
		type:"GET",
		url:"mailCheck.do?email=" + email,
		success:function(data){
			
			console.log("data : " + data);
			cehckBox.attr("disabled",false);
			boxWrap.attr("id", "mail_check_input_box_true");
			code = data;
		}
	});
});
/* 인증번호 비교 */
$(".mail_check_input").blur(function(){

	var inputCode = $(".mail_check_input").val();		// 입력코드    
	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과   
	
	if(inputCode == code){								// 일치할 경우
		checkResult.html(" 수신된 임시비밀번호를 확인하여 주시기 바랍니다.");
		checkResult.attr("class", "correct");
		checkResult.css("color", "green");
	} else {											// 일치하지 않을 경우
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
		checkResult.css("color", "red");
	}
});

/* 입력 메일 형식 유효성 검사 */
function mailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}

