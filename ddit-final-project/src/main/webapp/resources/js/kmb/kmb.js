	let viewModal = $("#myMenuModal").on("hidden.bs.modal", function(event){
		$(this).find(".modal-header").empty();
		viewForm.get(0).reset();
	}).on("show.bs.modal", function(event){
		let dataTr = event.relatedTarget;
		viewForm.submit();
	});
	let viewForm = $("#viewForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
	
		$.ajax({
			url : url,
			method : method,
			dataType : "html",
			success : function(resp) {
				viewModal.find(".modal-header").html(resp);
			},
			error : function(errorResp) {
				console.log(errorResp.status);
				viewModal.find(".modal-header").html(errorResp.responseText);
			}
		});
		return false;
	});