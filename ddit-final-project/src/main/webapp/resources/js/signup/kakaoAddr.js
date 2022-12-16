// 카카오주소

window.onload = function(){
	// 일반회원 주소입력
	document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("memAddr").value = data.address; // 주소 넣기
				document.querySelector("input[name=memDaddr]").focus(); //상세입력 포커싱
			}
		}).open();
	});
}
