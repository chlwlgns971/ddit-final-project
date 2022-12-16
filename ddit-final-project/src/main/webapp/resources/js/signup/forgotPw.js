const CSRFTokken = $("input[name=_csrf]").val();

$(function(){
	$(".mail_check_button").click(function(){
//		alert("입력한 메일로 임시 비밀번호가 발송됩니다.");
		Swal.fire({
			text: "입력한 메일로 임시 비밀번호가 발송됩니다.",
			icon: 'success',
		})
		$.ajax({
			url : "/rest4Trip/AccLoginn/findPw.do?_csrf="+CSRFTokken ,
			type : "POST",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify( {
				accId : $(".acc_Id").val(),
				sumMail : $(".mail_input").val()
			}),
			success : function(result) {
				alert(result);
			},
			error: function (request, status, error) {
				console.log("code: " + request.status)
				console.log("message: " + request.responseText)
				console.log("error: " + error);
			}
		})
	});
})