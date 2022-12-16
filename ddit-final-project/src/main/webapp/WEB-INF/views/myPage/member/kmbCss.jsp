<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS Part 가져오기 -->
<link href='<%=request.getContextPath()%>/resources/css/kmb.css'
	rel='stylesheet'>

<!-- 스크립트 부분 -->

<!-- 모달창 띄우기 -->
<script type="text/javascript">
 $("#exampleModal").load("/myPageModal");
</script>
<!-- 모달창 띄우기  종료-->




<!-- 통계 부분  종료 -->

<!-- 비밀번호 찾기 팝업 -->
<script type="text/javascript">
	function veryfyBtn() {
		let mem_pass = $('#acc_pass').val();
		let mem_pass_check = '${AccountVO.accPw }';
		console.log(mem_pass);
		if (mem_pass == mem_pass_check) {
			$('#verifyMsg').css('color','blue');
			$('#verifyMsg').css('margin-left','25px');
			$('#verifyMsg').html('기존 비밀번호와 같습니다.');
			$('.newPswd').css('border', '2px solid lightblue');
			$('#changePW').prop('disabled',true);
			$('.modifyInput').prop('disabled',false);
			
		}else if (mem_pass != mem_pass_check) {
			$('#verifyMsg').css('color','red');
			$('#verifyMsg').css('margin-left','25px');
			$('#verifyMsg').html('기존 비밀번호와 다릅니다.');			
		}else if (mem_pass==null){
			$('#verifyMsg').css('color','red');
			$('#verifyMsg').css('margin-left','25px');
			$('#verifyMsg').html('아무런 값도 입력되지 않았습니다.');
		}
	};
	
	$(function(){
		// 비밀번호 재확인 검사
			$('#modifyPswdValid').on('keyup', function(){
				let mem_pass_check = '${AccountVO.accPw }';
				let modifyPswd = $('#modifyPswd').val();
				let modifyPswdValid = $('#modifyPswdValid').val();
					if(modifyPswd == modifyPswdValid){
						if(modifyPswdValid!=mem_pass_check){
							$(verifyInput).css('hidden', 'false');
							$('#verifyInput').html('적합한 비밀번호 입니다.');
							$('#verifyInput').css('color','blue');
							$('#pswdUpdateBtn').prop('disabled',false);
						}else{
							$('#verifyInput').html('기존의 비밀번호 입니다.');
							$('#verifyInput').css('color','red');
							$('#pswdUpdateBtn').prop('disabled',true);
						}
					}else{
							$('#verifyInput').html('비밀번호가 일치하지 않습니다');
							$('#verifyInput').css('color','red');
							$('#pswdUpdateBtn').prop('disabled',true);
				}	
			})
	});
	
</script>
<script type="text/javascript">
function popupClose(){
	let rowcnt='<c:out value="${rowcnt}" default="0" escapeXml="true" />';
	if(rowcnt=='1'){
// 		self.opener = self;

		window.close();
	}
}
</script>
<!-- 비밀번호 찾기 팝업  종료-->

<!-- 동행친구 정보 팝업 닫기 -->
<script type="text/javascript">
function complyPopClose(){
	window.close();
}
</script>
<!-- 동행친구 정보 팝업 닫기 종료-->

<!-- 쿠폰 탭 테이블 보이기 -->
<script type="text/javascript">
// $(document).ready(function(){
// 	let couponCode='abc';
// 	let couponCnt=${couponCnt};
// 	let	intCouponCnt=parseInt(couponCnt);
	
// 	console.log(${couponCnt});
// 	console.log(couponCode);
// 	for(let i=1;i<=intCouponCnt;i++){
// 	if(${couponVO.couCode}=="CPP"){
// 		couponCode="%";
// 	}else if(${couponVO.couCode}=="CPD"){
// 		couponCode="할인";
// 	}
// 	console.log(couponCode);
// 		$('#couponTableTd').append('<tr><td class="mcTD">${couponVO.couNam}</td><td class="mcTD">${couponVO.couSdate}~${couponVO.couEdate}</td><td class="mcTD">${couponVO.couDisc}couponCode</td></tr>');
// 	}
// 	console.log('강명범');
	
// }); 

</script>
<!-- 쿠폰 탭 테이블 보이기 종료-->

<!-- 동행페이지 친구 테이블 보기 -->


<!-- 동행페이지 친구 테이블 보기 종료-->

<!-- 탭 클릭시 색상 전환 -->
<script type="text/javascript">
	function onclick(kmb) {
		kmb.style.backgroundColor = "#01ace4";
	}
	function OnMouseIn(kmb) {
		kmb.style.backgroundColor = "#01ace4";
		kmb.style.font = "bold";
	}
	function OnMouseOut(kmb) {
		kmb.style.backgroundColor = "";
	}
</script>
<!-- 탭 클릭시 색상 전환  종료-->
<!-- 상품등록시 체크박스 색깔 변화 -->
<script>
// function prodOnMouseIn(kmb){
// 	kmb.style.color= "#01ace4";
// }
// function prodOnMouseOut(kmb){
// 	kmb.style.color= "";
// }
var prodSelect = document.getElementById("prodSelect")

</script>
<!-- 상품등록시 체크박스 색깔 해제 -->


<!-- 이미지 테스트 스크립트 -->
<script type="text/javascript">

var sel_file;

$(document).ready(function() {
    $("#input_img").on("change", handleImgFileSelect);
}); 

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#modifyImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
    console.log("호놀룰루");
}
// 비밀번호변경 사이트 이동


// function showUploadImage(event){
// 	var token = $("meta[name='_csrf']").attr("content");
//     var header = $("meta[name='_csrf_header']").attr("content");
//     var data = new FormData($("#storeAddForm")[0]);
    
	
// 	$.ajax({
// 		beforeSend: function(xhr){
//             xhr.setRequestHeader(header,token);
//         },
<%-- 		url : "<%=request.getContextPath()%>/mypage/member/personal/personalMemberEdit", --%>
// 		data : data,
// 		type: "post",
// 		processData:false,
//         contentType:false,
// 		enctype : "multipart/form-data"
// 	}).done(function(fragment))
	
// 	;
	
// 	/* 전달받은 데이터 검증 */
// 	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
// 	let uploadResult = $("#uploadResult");
	
// 	let obj = uploadResultArr[0];
	
// 	let str = "";
	
// 	let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
	
// 	str += "<div id='result_card'>";
// 	str += "<img src='/display?fileName=" + fileCallPath +"'>";
// 	str += "<div class='imgDeleteBtn'>x</div>";
// 	str += "</div>";		
	
// 		uploadResult.append(str);     
    
// }	


</script>
<!-- 이미지 테스트 스크립트 종료 -->
<!-- 비밀번호변경 버튼 -->
<script type="text/javascript">
function openChangePswdPop(){
	var popUp=window.open('${pageContext.request.contextPath }/mypage/member/personal/updatePswd','PMPswd','width=420px,height=400px,left=50%,top=50%,scrollbars=yes');
}
</script>
<!-- 비밀번호변경 버튼  종료-->
<!-- 동행친구 자세히보기 이동 -->
<script type="text/javascript">
function complyDetailFunc(param){
	
	var popUp=window.open("${pageContext.request.contextPath }/mypage/member/personal/ComplyDetailView?what="+param,'complyDetailView','width=420px,height=660px,left=50%,top=50%,scrollbars=yes');
}
</script>
<!-- 동행친구 자세히보기 이동  종료-->

<!-- 완료된 동행친구 온도 측정하기 팝업-->
<script type="text/javascript">
// console.log("pppp",$("#sDate"));
// var sDate=$("#sDate").text();
// alert(sDate);
function complyCompleteScore(param1,param2){
	console.log("ppp",param1);
	console.log("sDate",param2);
	var popUp=window.open("${pageContext.request.contextPath}/mypage/member/personal/ComplyCompleteScore?what1="+param1+"&what2="+param2,'ComplyCompleteScore','width=420,height=720,left=50,top=50,scrollbars=yes');
}
</script>
<!-- 완료된 동행친구 온도 측정하기 종료 -->

<!-- 점수 보기 -->
<script type="text/javascript">
function valueViewChange(){
	var values=$("#score").val();
	document.querySelector('#scoreView').innerHTML=values+'점';
	
	
	var i=parseInt(values);
	degree=0.2*i-1;
	var score=degree.toFixed(1);
	document.querySelector('#memDegree').innerHTML=score;
	console.log(score);
	$("#memDegree").val(score);
}
</script>
<!-- 점수 보기 종료-->
<!-- 동행자 창 점수주고 닫기 -->
<!-- 동행자 창 점수주고 닫기 종료-->


<!-- 스크립트 부분 종료 -->