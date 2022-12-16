function joinform_check() {
	/*변수생성*/
	//아이디
	var accId = document.getElementById("accId");
	//비밀번호
	var pwd = document.getElementById("accPw");
	//비밀번호검사
	var accPw2 = document.getElementById("accPw2");
	//성
	var memKln = document.getElementById("memKln");
	//이름
	var memKfn = document.getElementById("memKfn");
	//영문성
	var memEln = document.getElementById("memEln");
	//영문이름
	var memEfn = document.getElementById("memEfn");
	//내국인
	var KR = document.getElementById("KR");
	//외국인
	var FG = document.getElementById("FG");
	//생년월일
	var female = document.getElementById("memBirth");
	//성별
	var frmale = document.getElementById("frmale");
	var man = document.getElementById("man");
	//연락처
	var memHphon = document.getElementById("memHphon");
	//이메일
	var email1 = document.getElementById("email1");
	//이메일
	var email2 = document.getElementById("email2");
	// email1, 2 결합
	var comMail = document.getElementById("memMail");
	//주소
	var memAddr = document.getElementById("memAddr");
	var memDaddr = document.getElementById("memDaddr");
	//약관동의
	var memCons = document.getElementById("memCons");

	if (accId.value == "") { //해당 입력값이 없을 경우 
		alert("아이디를 입력하세요.");
		accId.focus(); 
		return false; //아무것도 반환하지 말아라 이 코드부터 아무것도 진행하지 말것
	};
	
	if (accPw.value == "") {
		alert("비밀번호를 입력하세요.");
		accPw.focus();
		return false;
	};
	
	//비밀번호 영문자+숫자+특수조합(7~25자리 입력) 정규식
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,25}$/;
		if (!pwdCheck.test(accPw.value)) {
			alert("비밀번호는 영문자+숫자+특수문자 조합으로 7~25자리 사용해야 합니다.");
		accPw.focus();
		return false;
	};
	
	if (accPw.value !== accPw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		accPw2.focus();
		return false;
	};
	
	if (memKln.value == "") {
		alert("성을 입력하세요.");
		memKln.focus();
		return false;
	};
	if (memKfn.value == "") {
		alert("이름을 입력하세요.");
		memKfn.focus();
		return false;
	};
	if (memEln.value == "") {
		alert("영문 성을 입력하세요.");
		memKfn.focus();
		return false;
	};
	if (memEfn.value == "") {
		alert("영문 이름을 입력하세요.");
		memEfn.focus();
		return false;
	};
	
	if (!KR.checked && !FG.checked) { //둘다 미체크시
		alert("국적을 선택해 주세요.");
		KR.focus();
		return false;
	};
	if (!frmale.checked && !man.checked) { //둘다 미체크시
		alert("국적을 선택해 주세요.");
		frmale.focus();
		return false;
	};
	
	var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
	if (!reg.test(memHphon.value)) {
		alert("전화번호는 숫자만 입력할 수 있습니다.");
		memHphon.focus();
		return false;
	};
	
	if (email1.value == "") {
		alert("이메일 주소를 입력하세요.");
		email1.focus();
		return false;
	};
	//도메인 정규식
	if (email2.value == "") {
		alert("도메인이 누락되었습니다.");
		email2.focus();
		return false;
	};
	
	if (!memCons.checked) { //체크박스 미체크시
		alert("약관 동의를 체크하세요.");
		memCons.focus();
		return false;
	};
	// 주소1
	if (memAddr.value == "") {
		alert("기본주소를 입력하세요.");
		memAddr.focus();
		return ;
	};
	// 주소2
	if (memDaddr.value == "") {
		alert("상세주소를 입력하세요.");
		memDaddr.focus();
		return ;
	};
	
	memMail.value = email1.value + '@' + email2.value;
	console.log("memMail" , memMail.value);
	alert("회원가입이 완료되었습니다.");
	
	// 전송
	$("#join_form")[0].submit();
}