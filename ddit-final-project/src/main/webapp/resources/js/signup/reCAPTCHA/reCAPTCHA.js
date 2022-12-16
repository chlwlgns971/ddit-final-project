//일반회원
var onloadCallback = function() {
	grecaptcha.render('html_element', {
		'sitekey' : '6LfHAjYhAAAAAMM7-4vT_pWOV7Gzgc7S0WDYMGDB'
	});
};

var isCapchaSuccess = false;

function successCaptcha() {
	return isCapchaSuccess = true;  
} 
//약관 및 캡차 검증 확인
function writeOK() {
//radio버튼 값 가져오기
	var provisionYn = $("input:radio[name=provisionYn]:checked").val();
	var memberInfoYn = $("input:radio[name=memberInfoYn]:checked").val();
	if(isCapchaSuccess === false || provisionYn === "N" || memberInfoYn === "N") {
//		alert("약관동의 및 검증을 확인해주세요");
		Swal.fire({
			text: "약관동의 또는 자동가입방지 검증을 진행해 주세요",
			icon: 'error',
		})
//			return false;
	} else {
		Swal.fire({
			text: "약관동의 및 자동가입방지 검증이 완료되었습니다.",
			icon: 'success',
		})
//		alert("약관동의 및 검증이 완료되었습니다.");
		$("#hdn").show();
	};
};