
//휴대폰 번호 입력 부분
const autoHyphen = (target) => {
	target.value = target.value
						 .replace(/[^0-9]/g, '')
						 .replace(/^(\d{3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
	}
//집전화번호 입력 부분
const autoHyphen2 = (target) => {
	target.value = target.value
						 .replace(/[^0-9]/g, '')
						 .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3")
						 .replace(/(\-{1,2})$/g, "");
	}
//사업자번호 입력부분
const autoHyphen3 = (target) => {
	target.value = target.value
						 .replace(/[^0-9]/g, '')
						 .replace(/^(\d{3})(\d{2})(\d{5})$/g, "$1-$2-$3")
						 .replace(/(\-{1,2})$/g, "");
}