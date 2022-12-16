var div2 = document.getElementsByClassName("div2");
//console.log("ran", div2);

function handleClick(event) {
//	console.log("글자", event.target);
//	console.log(this);

	console.log(event.target.classList);

	for (var i = 0; i < div2.length; i++) {
		$(div2[i]).removeClass("active");
	}
	$(event.target).addClass("active");

	
	
//	if (event.target.classList[1] === "clicked") {
//		event.target.classList.remove("clicked");
//	} else {
//		for (var i = 0; i < div2.length; i++) {
//			div2[i].classList.remove("clicked");
//		}
//		event.target.classList.add("clicked");
//	}
}

function init() {
	console.log("int", div2.length);
	for (var i = 0; i < div2.length; i++) {
		div2[i].addEventListener("click", handleClick);
	}
}

init();