// 아이디 (데이터 유효성 검사)
$('.id_input').on('keyup', function(){
//	alert("눌리니");
	idvalue = $(this).val().trim();
	
	idreg = /^[a-z][a-zA-Z0-9]{3,12}$/ 
	
	// 정규식 검사 : 맞으면 true, 틀리면 false.
	if(idreg.test(idvalue)){
		console.log(idvalue);
		checkId(this);
		$(this).css('border', '2px solid green');
	}else{
		$(this).css('border', '2px solid red');
		return;
	}
});

//-----------------------------------------------------
// 아이디(중복검사) 일반회원

function checkId(textbox){
	var id = $('#accId').val(); //id값이 "accId"인 입력란의 값을 저장
	
		
	if (id.length >=4){
			
		$.ajax({
			url:'/rest4Trip/AccLoginn/idCheck' , //Controller에서 요청 받을 주소
			type:'post', //POST 방식으로 전달
			data:JSON.stringify({id:id}),
			contentType : "application/json;charset=utf-8",
			beforeSend: function( xhr ) {
				xhr.setRequestHeader(header, token);
			},
			success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
				if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
					$('#id_feedback').html("사용 가능한 아이디입니다."); 
					$('#id_feedback').attr("display", "none");
					$('#id_feedback').css("color", "green");
				} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
					$('#id_feedback').html("사용 불가능한 아이디입니다.");
					$('#id_feedback').attr("display", "none");
					$('#id_feedback').css("color", "red");
//					alert("사용중인 아이디거나 잘못된 아이디 입니다. \n아이디를 다시 입력해주세요");
					Swal.fire({
						text: "사용중인 아이디거나 잘못된 아이디 입니다. \n아이디를 다시 입력해주세요",
						icon: 'error',
					})
					$('#accId').val('');
					$(textbox).css('border', '2px solid red');
					return;
				}
				console.log("Stirng" , cnt);
			},
//			error: function (request, status, error) {
//				console.log("code: " + request.status)
//				console.log("message: " + request.responseText)
//				console.log("error: " + error);
//			}
		});
	};
};