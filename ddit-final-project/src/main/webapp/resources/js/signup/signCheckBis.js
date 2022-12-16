function joinform_check() {
	/* 변수생성 */
	// 아이디
	var accId = document.getElementById("accId");
	// 비밀번호
	var pwd = document.getElementById("accPw");
	// 비밀번호검사
	var accPw2 = document.getElementById("accPw2");
	// 회사명
	var comCnam = document.getElementById("comCnam");
	// 연락처
	var comHphon = document.getElementById("comHphon");
	// 담담자
	var comNam = document.getElementById("comNam");
	// 이메일
	var email1 = document.getElementById("email1");
	// 이메일2
	var email2 = document.getElementById("email2");
	// email1, 2 결합
	var comMail = document.getElementById("comMail");
	// 주소
	var comAddr = document.getElementById("comAddr");
	// 주소2
	var comAddr2 = document.getElementById("comAddr2");
	// 사업자구분
	var comRnum = document.getElementById("comRnum");
	
	// 아이디
	if (accId.value == "") { // 해당 입력값이 없을 경우 같은말: if(!uid.value)
		alert("아이디를 입력하세요.");
		accId.focus(); // focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		return; // return: 반환하다 return false: 아무것도 반환하지 말아라 아래 코드부터 아무것도
						// 진행하지 말것
	};
	// 비밀번호
	if (accPw.value == "") {
		alert("비밀번호를 입력하세요.");
		accPw.focus();
		return ;
	};

	// 비밀번호 영문자+숫자+특수조합(7~16자리 입력) 정규식
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if (!pwdCheck.test(accPw.value)) {
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 7~16자리 사용해야 합니다.");
		accPw.focus();
		return ;
	};
	// 비밀번호2
	if (accPw.value !== accPw2.value) {
		alert("비밀번호가 일치하지 않습니다..");
		accPw2.focus();
		return ;
	};
	// 회사명
	if (comCnam.value == "") {
		alert("회사명을 입력하세요.");
		comCnam.focus();
		return ;
	};
	// 회사연락처
	var reg = /^[0-9]+/g; // 숫자만 입력하는 정규식
	if (!reg.test(comHphon.value)) {
		alert("담당자 연락처를 입력하세요.");
		comHphon.focus();
		return ;
	};
	// 담당자명
	if (comNam.value == "") {
		alert("담장자를 입력하세요.");
		comNam.focus();
		return ;
	};
	// 이메일
	if (email1.value == "") {
		alert("이메일 주소를 입력하세요.");
		email1.focus();
		return ;
	};
	// 도메인
	if (email2.value == "") {
		alert("도메인이 누락되었습니다.");
		email2.focus();
		return ;
	};
	// 주소1
	if (comAddr.value == "") {
		alert("회사의 기본주소를 입력하세요.");
		comADR.focus();
		return ;
	};
	// 주소2
	if (comAddr2.value == "") {
		alert("회사의 상세주소를 입력하세요.");
		comADR2.focus();
		return ;
	};
	// 사업자번호
	if (comRnum.value == "") {
		alert("사업자번호를 입력하세요");
		comRnum.focus();
		return ;
	};
	comMail.value = email1.value + '@' + email2.value;
	console.log("comMail" , comMail.value);
	
	alert("회원가입이 완료되었습니다.");
	// 전송
	$("#join_form")[0].submit();
	
}