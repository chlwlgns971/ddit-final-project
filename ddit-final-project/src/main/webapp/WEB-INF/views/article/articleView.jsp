<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<style>
.temp{
width: 100px;
height: 100px;
}
</style>

<security:authentication property="principal" var="principal" />
<section class="page-title">
${pagingVO }
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg4.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="title-border">
							<h2 class="text-uppercase text-white font-weight-bold" id="title">커뮤니티</h2>
						</div>
						<p class="text-white mb-0"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="py-9">
	<div class="container">
		<div class="card card-lg card-transparent mb-8">


			<div class="card-body px-2 py-6">
				<h3 class="mb-4">${article['artTitle'] }</h3>
				<div class="meta-post-sm mb-4">
					<ul class="list-unstyled d-flex flex-wrap mb-0">
						<li class="meta-tag me-4 mb-1"><i
							class="fa fa-user text-gray-color" aria-hidden="true"></i> <a
							class="text-gray-color hover-text-primary" href=""><span
								class="ms-1 text-capitalize">${article.accId }</span> </a></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><i
							class="fas fa-calendar-alt" aria-hidden="true"></i> <span
							class="ms-1 text-capitalize">${article.artDate }</span></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><i
							class="far fa-eye" aria-hidden="true"></i> <span
							class="ms-1 text-capitalize">${article.artHit }</span></li>

						<li class="meta-tag text-gray-color me-4 mb-1"><a class=''
							href='#' id='navbarScrollingDropdown' role='button'
							data-bs-toggle='dropdown' aria-expanded='true'
							style='color: black; float: right'> <i
								class='fas fa-ellipsis-v' aria-hidden='true'></i>
						</a>
							<ul class='dropdown-menu'
								aria-labelledby='navbarScrollingDropdown'>
								<li><c:url value="/article/articleUpdate" var="updateURL">
										<c:param name="what" value="${article['artNum'] }" />
									</c:url> <a href="${updateURL }" class='dropdown-item'>수정</a></li>
								<li><a class='dropdown-item' href='#' id="deleteBtn">삭제</a>
								</li>
								<li><a class="dropdown-item" href="#"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop">신고</a>
								</li>
							</ul></li>
					</ul>
					<!-- 			<table> -->
					<!-- 				<tr> -->
					<%-- 					<td colspan="2"><c:url value="/article/articleUpdate" --%>
					<%-- 							var="updateURL"> --%>
					<%-- 							<c:param name="what" value="${article['artNum'] }" /> --%>
					<%-- 						</c:url> <a href="${updateURL }" class="btn btn-primary">글 수정</a> <a --%>
					<!-- 						href="#" id="deleteBtn" class="btn btn-danger">글 삭제</a></td> -->
					<!-- 				</tr> -->
					<!-- 			</table> -->
					<form name="deleteForm" method="post"
						action="${cPath }/article/articleDelete">
						<input type="hidden" name="artNum" value="${article['artNum'] }" />
						<input type="hidden" name="writer" value="${article['accId'] }" />
						<input type="hidden" name="deleter"
							value="${principal.realUser.accId }" />
						<!-- 				<input type="hidden" name="_csrf" value="token" /> -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

					<!-- 			신고버튼 -->
					<!-- Button trigger modal -->
					<!-- Modal -->
					<form id="reportForm" method="POST" action="${cPath }/report">
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">신고</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<select name="repCode" class="form-select form-select-lg mb-3"
											aria-label=".form-select-lg example">
											<option selected value="REPC001">신고유형</option>
											<option value="REPC001">스팸홍보/도배글</option>
											<option value="REPC002">음란물입니다.</option>
											<option value="REPC003">불법정보를 포함하고 있습니다.</option>
											<option value="REPC004">청소년에게 유해한 내용입니다.</option>
											<option value="REPC005">욕설/생명경시/혐오/차별적 표현입니다.</option>
											<option value="REPC006">개인정보 노출 게시물입니다.</option>
											<option value="REPC007">불쾌한 표현이 있습니다.</option>
											<option value="REPC008">명예훼손 또는 저작권이 침해되었습니다.</option>
											<option value="REPC009">불법촬영물등이 포함되어 있습니다.</option>
										</select> <input type="hidden" name="repBcode"
											value="${article.artBCode }" /> <input type="hidden"
											name="artNum" value="${article['artNum'] }" /> <input
											type="hidden" name="repId" value="${article.accId }" /> <input
											type="hidden" name="memId"
											value="${principal.realUser.accId }" /> <input type="hidden"
											name="${_csrf.parameterName}" value="${_csrf.token}" />

										<div class="col-lg-12">
											<div class="form-group">
												<textarea id="editor" name="repCont"
													style="height: 500px; font-size: 1.2rem" placeholder="내용"></textarea>
											</div>
										</div>
										<!-- CKEditor5 -->
										<script
											src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js">
											
										</script>
										<script>
											ClassicEditor.create(document
													.querySelector('#editor'),
													{
														height : '500px'
													});
										</script>

									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary"
											style="background-color: red; border-color: red;">신고</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" style="width: 100px;">Close</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 			신고버튼 -->
				</div>
				<div>${article['artCont'] }</div>

			</div>

		</div>
		<!-- 여기부터 -->
		<div
			class="card-footer d-flex align-items-center bg-smoke rounded p-3 p-md-4"
			style="margin-top: 5%">
			<span class="font-weight-bold font-size-15">Comments</span>
		</div>
		<!-- 댓글영역 -->
		<div class="mb-7 p-3 p-md-4" id="listBody"></div>
		<!-- <div class="mb-7"> -->
		<!-- 	<h3 class="mb-6">댓글</h3> -->
		<!-- 	<div class="media mb-8"> -->
		<!-- 		<table class="table table-bordered"> -->
		<!-- 			<tbody id="listBody"> -->

		<!-- 			</tbody> -->
		<!-- 		</table> -->


		<!-- 	</div> -->
		<!-- </div> -->
		<!-- 여기까지 나중에 요 주석은 지워야함.지훈이한테 댓글 넘긴 후에 -->

		<div class="mb-7 mb-lg-0">
			<h3 class="mb-6">댓글 작성</h3>

			<form id="replyForm" action="${cPath }/reply" method="post">
				<select hidden="hidden" name="replyScope" class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example">
					<option value="reply001">공개댓글</option>
					<option value="reply002">비공개댓글</option>
				</select>
				<div class="form-group">
					<textarea id="textarea" name="replyCont"
						class="form-control border-0 bg-smoke" rows="7"
						placeholder="Your Message"></textarea>
				</div>
				<input type="hidden" name="artNum" value="${article.artNum }" /> <input
					type="hidden" name="replyReStep" value="0" /> <input type="hidden"
					name="replyReLevel" value="0" />
				<security:csrfInput />
				<div class="form-group">
					<input type="hidden" name="accId"
						value="${principal.realUser.accId }" />
				</div>

				<!-- 		<input type="button" id="bopen" name="replyScope" value="공개댓글" class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium"style="display: initial;"/>		 -->
				<!-- 		<input type="button" id="block" name="replyScope" value="비공개댓글" class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium" style="display: none;"/>		 -->
				<button type="button" id="bopen" name="replyScope" value="REPLY001"
					class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium">
					<i class="fas fa-lock-open" style="display: initial;"></i>
				</button>
				<button type="button" id="block" name="replyScope" value="REPLY002"
					class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium"
					style="display: none;">
					<i class="fas fa-lock"></i>
				</button>
				<input type="submit"
					class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium"
					value="댓글 달기" />


			</form>
			﻿ ﻿

		</div>
	</div>
</section>

<script type="text/javascript" defer="defer">
	let listBody = $("#listBody");
	let makeTrTag = function(reply) {
		no = reply.replyNum;
		pno = reply.replyPnum;
		writer = reply.accId;
		cont = reply.replyCont;
// 		img = repy.
		if (reply.replyScope == 'reply002') {
			cont = "비밀댓글입니다.";
		}
		let main_command = null;

		// 새로운 UI 댓글 추가	
		main_command = "<div class='dropdown'   id='del"+no+"' >";
		main_command += "<h6 class='font-weight-bold text-capitalize mb-2'>"
				+ writer + "";
		main_command += "<a class='' href=''#' id='navbarScrollingDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='true' style='color: black; float: right' >";
		main_command += "<i class='fas fa-ellipsis-v' aria-hidden='true' ></i></a>";
		main_command += "<ul class='dropdown-menu' aria-labelledby='navbarScrollingDropdown'>";
		main_command += "<li><a class='dropdown-item' onClick='editBtn(" + no
				+ ")'>수정</a></li>";
		main_command += "<li><a class='dropdown-item' onClick='deleteReplyBtn("
				+ no + ")'>삭제</a> </li>";
		main_command += "</ul></h6> </div>";
		main_command += "<div class='meta-tag text-gray-color mb-3'>";
		main_command += "<i class='fas fa-calendar-alt' aria-hidden='true'></i>";
		main_command += "<span class='ms-2 text-capitalize'>" + reply.replyDate
				+ "</span>";
		main_command += "</div>";
		main_command += "<div class='updateReply' id='repl"+ no +"' ><pre>"
				+ cont + "</pre>";
		main_command += "</div>";

		// 			main_command +=	"<form id='deleteReplyForm' name='deleteReplyForm' method='post' action='${cPath }/replyDelete'>";
		// 			main_command += "<input type='hidden' name='replyNum' value='"+no+"'/>";
		// 			main_command += '<sec:csrfInput/>';
		// 			main_command += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
		// 			main_command += '</form>';

		//

		//새로운 대댓글추가
		//버튼을 누르니 창이 열리고 내용을 적음.
// 		<button class='btn text-primary p-0' type ='button' data-bs-toggle='collapse' data-bs-target='#collapseExample"+no+"' aria-expanded='false' aria-controls='collapseExample' style='background-color:transparent'>답글</button>
		let sub_btn = "";
		sub_btn += "<div class='collapse' id='collapseExample"+no+"'>";
		sub_btn += ' <div class="card card-body">';
		sub_btn += '	<form id="replyForm" action="${cPath }/reply" method="post">';
		sub_btn += '	<div class="form-group">'
		sub_btn += '	<textarea id="textarea" name="replyCont" class="form-control border-0 bg-smoke" rows="7" placeholder="Your Message"></textarea>';
		sub_btn += '	</div>';
		sub_btn += '	<security:csrfInput />';
		sub_btn += '	<div class="form-group">';
		sub_btn += "		<input type='hidden' name='replyPnum' value='"+ no +"' />";
		sub_btn += "		<input type='hidden' name='replyRef' value='${reply.replyRef}' />";
		sub_btn += '		<input type="hidden" name="accId" value="${principal.realUser.accId }" />';
		sub_btn += '	</div>';
		sub_btn += "<input type='submit' onClick='insertSubBtn('"
				+ no
				+ "') id='insertSubForm' class='btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium' value='댓글등록'/>";
		sub_btn += '</form>';
		sub_btn += '</div>';
		sub_btn += '</div>';

		// 새로운 댓글list 띄우기	
		let trTag = null;
		//메인댓글의 ref번호
		let mainCom = reply.replyRef;

		//
		// 		let editBtn = null;
		// 		editBtn += "<div class='dropdown'>";
		// 		editBtn += "<button class='btn btn-secondary dropdown-toggle' type='button' id='dropdownMenuButton1' data-bs-toggle='dropdown' aria-expanded='false'>";
		// 		editBtn += "<i class='fas fa-ellipsis-v' style='float: right'></i></button>";
		// 		editBtn +="<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>";		
		// 		editBtn += "<li>수정</li>"; 
		// 		editBtn += "<li>삭제</li>"; 
		// 		editBtn +="</ul></div>";  

		if (reply.replyReStep == 0 && reply.replyReLevel == 0) {
			trTag = $("<div class='media mb-8'>")
					.append(
							$("<div class='img-overlay rounded me-4'>")
									.html(
// 											"<img class='temp' src='<security:authentication property="principal.realUser.accImg"/>' alt='Generic placeholder image'>"
											"<img class='w-100' src='${cPath }/resources/images/blog/comments-02.jpg' alt='Generic placeholder image'>"
													+ "<a href='' class='dropdown' />"),
							$("<div class='media-body'><div class='mb-7'>")
									.html(main_command + sub_btn),
							$("<div id='del"+no+"'>").html()

					);
		} else {

			let sub_command = "<div class='dropdown'>";
			sub_command += "<h6 class='font-weight-bold text-capitalize mb-2'>"
					+ writer + "";
			sub_command += "<a class='' href=''#' id='navbarScrollingDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='true' style='color: black; float: right' >";
			sub_command += "<i class='fas fa-ellipsis-v' aria-hidden='true' ></i></a>";
			sub_command += "<ul class='dropdown-menu' aria-labelledby='navbarScrollingDropdown'>";
			sub_command += "<li><a class='dropdown-item' href='#' >수정</a></li>";
			sub_command += "<li> <a class='dropdown-item' href='#'>삭제</a></li></ul></h6> </div>";
			sub_command += "<div class='meta-tag text-gray-color mb-3'>";
			sub_command += "<i class='fas fa-calendar-alt' aria-hidden='true'></i>";
			sub_command += "<span class='ms-2 text-capitalize'>"
					+ reply.replyDate + "</span>";
			sub_command += "</div>";
			sub_command += "<div class='updateReply' id='repl" + no +"' ><pre>"
					+ cont + "</pre>";

			// 			let sub_command = '<div class="img-overlay rounded mb-4 mb-md-0 me-md-4">';
			// 		        sub_command += '<img class="w-100 lazyestload" src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" alt="Generic placeholder image">';
			// 		        sub_command += '   <a href="" class="hover-img-overlay-dark"></a>    ';
			// 		        sub_command += ' </div>                                                                                                                                           ';
			// 		        sub_command += '<div class="media-body">                                                                                                                         ';
			// 		    let sub_command = "<h6 class='font-weight-bold text-capitalize mb-2'>"+writer+"";
			// 				sub_command += "<i class='fas fa-ellipsis-v' style='float: right'></i></h6>";
			// 				sub_command += "<div class='meta-tag text-gray-color mb-3'>";
			// 				sub_command += "<i class='fas fa-calendar-alt' aria-hidden='true'></i>";
			// 				sub_command += "<span class='ms-2 text-capitalize'>"+reply.replyDate+"</span>";
			// 				sub_command += "</div>";
			// 				sub_command += "<div class='updateReply' id='repl" + no +"' ><pre>"+cont+"</pre>";
			// 		        sub_command += ' </div> ';

			trTag = $(
					"<div class='media mb-8'><div class='img-overlay rounded me-9'><div class='media-body'><div class='mb-7'>")
					.append(
							$(
									'<div class="img-overlay rounded mb-4 mb-md-0 me-md-4">')
									.html(
											'<img class="w-100 lazyestload" src="${cPath }/resources/images/blog/comments-02.jpg" alt="Generic placeholder image">'
													+ '   <a href="" class="hover-img-overlay-dark" />'),
							$(
									"<div class='media-body'><div class='media flex-column flex-md-row mb-7' id='del"+no+"'>")
									.html(sub_command));
		}

		// 		)

		// 		.appendTo(
		// 			sub_command

		return trTag;

		//	댓글 추가
		// 	let html_btn = '<button class="btn btn-primary" type = "button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">답글</button> ';
		// 		html_btn += '<div class="collapse" id="collapseExample">';
		// 		html_btn += ' <div class="card card-body">';
		// 		html_btn += '	<form id="replyForm" action="${cPath }/reply" method="post">';
		// 		html_btn += '	<div class="form-group">'
		// 		html_btn += '	<textarea id="textarea" name="replyCont" class="form-control border-0 bg-smoke" rows="7" placeholder="Your Message"></textarea>';
		// 		html_btn += '	</div>';
		// 		html_btn += '	<security:csrfInput />';
		// 		html_btn += '	<div class="form-group">';
		// 		html_btn += "		<input type='hidden' name='replyPnum' value='"+ no +"' />";
		// 		html_btn += '		<input type="hidden" name="accId" value="${principal.realUser.accId }" />';
		// 		html_btn += '	</div>';
		// 		html_btn += '<input type="submit" class="btn btn-sm btn-outline-secondary text-uppercase py-2 font-weight-medium" value="댓글 달기"/>';
		// 		html_btn += '</form>';
		// 		html_btn += '</div>';
		// 		html_btn += '</div>';

		//

		// 댓글 수정 및 삭제		
		// 		html_edit = '<table><tr><td colspan="2">';
		// 		html_edit += "<a href='javascript:void(0)' onClick='editBtn(" + no + ")'>수정</a>";
		// 		html_edit += "<a href='javascript:void(0)' onClick='deleteReplyBtn("+no+")'>삭제</a>";
		// 		html_edit += '</td> </tr> </table>';

		//
		// 		return $("<tr>").append(
		// 				$("<div>").html(writer),
		// 				$("<div class='updateReply' id='repl" + no +"' >").html( "<pre >" + cont + "</pre>"),
		// 				$("<div>").html(reply.replyDate), $("<div>").html(html_btn),
		// 				$("<div id='del"+no+"'>").html(html_edit));
	}

	let no;
	let pno;
	let writer;
	let cont;
	let renderingReplyList = function() {
		$.ajax({
			url : "${cPath }/reply",
			data : {
				artNum : '${article.artNum }'
			},
			method : "get",
			dataType : "json",
			success : function(resp) {
				let replyList = resp.dataList;
				let trTags = [];

				if (replyList && replyList.length > 0) {

					$.each(replyList, function(idx, reply) {
						trTags.push(makeTrTag(reply));
					});
				} else {
					trTags.push($("<tr>").html(
							$("<td>").attr("colspan", "3").html("덧글 없음.")));
				}
				listBody.html(trTags);
			}
		});
	};

	//댓글 수정 버튼 누를 시, 실행
	function editBtn(no) {
		// 		alert(pid);
		let $pid = $("#repl" + no);

		let text = $pid.text();
		console.log(text);
		$pid
				.html("<form id='editReplyForm' action='${cPath}/replyUpdate' modelAttribute='reply' method='post'>"
						+ "<input type='hidden' name='replyNum' value='"+no+"'>"
						+ '<div class="row">'
						+ '<div class="col-12">'
						+ "<textarea name ='replyCont' class='form-control' rows='3'>"
						+ text
						+ "</textarea>"
						+ '</div>'
						+ '<input type="hidden" name="accId" class="form-control" value=\"'+writer+'\"/>'
						+ '<input type="hidden" />'
						+ '<sec:csrfInput/>'
						+ '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>'
						+ '</div>'
						+ "<button type='submit'  class='btn btn-sm btn-primary' style='width: 100%; margin-top: 10px'> 저 장 </button>"
						+ '</form>');

	}
	//
	//댓글 삭제 버튼을 누를 시, 실행
	function deleteReplyBtn(no) {

		// 		$(this.deleteReplyForm).submit();

		var $del = $("#del" + no);
		var text = $del.text();
		console.log(text);
		$del
				.html("<form id='deleteReplyForm' method='post' action='${cPath }/replyDelete'>"
						+ "<input type='hidden' name='replyNum' value='"+no+"'/>"
						+ '<sec:csrfInput/>'
						+ '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>'
						+ '</form>');
		//submit이 실행되도록 함.

		$('#deleteReplyForm').submit();

	}
	//
	//댓글 신고 버튼을 누를 시, 실행
	function reportReplyBtn(no) {
		$("#staticBackdrop").modal('show');

	}

	//대댓글 누를시, 실행
	function insertSubBtn(no) {

	}
	//

	$(document).ready( function() { //게시글 신고, 실행
		$("#reportForm") .on( "submit", function(event) {
 			event.preventDefault();	
			var token = $("meta[name='_csrf']") .attr('content');
											var header = $(
													"meta[name='_csrf_header']")
													.attr('content');
											if (token && header) {
												$(document)
														.ajaxSend(
																function(event,
																		xhr,
																		options) {
																	xhr
																			.setRequestHeader(
																					header,
																					token);
																});
											}
											$('form')
													.append(
															'<input type="hidden" name="_csrf" value="'+token+'">');
											let url = this.action;
											let method = this.method;
											let data = $(this).serialize();
											let reportForm = this;

											$
													.ajax({
														url : url,
														method : method,
														data : data,
														dataType : "json",
														beforeSend : function(
																xhr) {
															/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
															if (token && header) {
																xhr
																		.setRequestHeader(
																				header,
																				token);
															}
															;
															$('form')
																	.append(
																			'<input type="hidden" name="_csrf" value="'+token+'">');
															let reportNum = $(
																	this).data(
																	"what");
														},
														success : function(resp) {
															if (!resp.errors && resp.result == "OK") {
																$( '#staticBackdrop') .modal( 'hide');
																Swal.fire({
																	title:'신고가 접수되었습니다.',         // Alert 제목
																	icon:'success',        // Alert 타입
																  confirmButtonColor: '#1ab3e8'
																});
																
															} else {
																Swal.fire({
																	title:'경고!',         // Alert 제목
																	text:'신고 작성 실패',  // Alert 내용
																	icon:'warning',        // Alert 타입
																  confirmButtonColor: '#1ab3e8'
																});
															}

														},
														error : function(
																errorResp) {
															console
																	.log(errorResp.status);
															viewModal
																	.find(
																			".modal-body")
																	.html(
																			errorResp.responseText);
														}
													});

											return false;
										});
						//

						//댓글을 불러오는 메서드
						renderingReplyList();

						//메인 댓글 insert
						$("#replyForm").on("submit", function(event) {
							event.preventDefault();
							let url = this.action;
							let method = this.method;
							let data = $(this).serialize();
							let replyForm = this;
							$.ajax({
								url : url,
								method : method,
								data : data,
								dataType : "json",
								success : function(resp) {
									if (!resp.errors && resp.result == "OK") {
										renderingReplyList();
										replyForm.reset();
									} else {
										alert("덧글 작성 실패");
									}
								}
							});
							return false;
						});
						//

						//댓글 수정 버튼 누를 시, 실행
						listBody
								.on(
										"submit",
										'#editReplyForm',
										function(event) {
											event.preventDefault();
											var token = $("meta[name='_csrf']")
													.attr('content');
											var header = $(
													"meta[name='_csrf_header']")
													.attr('content');
											if (token && header) {
												$(document)
														.ajaxSend(
																function(event,
																		xhr,
																		options) {
																	xhr
																			.setRequestHeader(
																					header,
																					token);
																});
											}
											$('form')
													.append(
															'<input type="hidden" name="_csrf" value="'+token+'">');
											let url = this.action;
											let method = this.method;
											let data = $(this).serialize();
											let editReplyForm = this;
											$
													.ajax({
														url : url,
														method : method,
														data : data,
														dataType : "json",
														beforeSend : function(
																xhr) {
															/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
															if (token && header) {
																xhr
																		.setRequestHeader(
																				header,
																				token);
															}
															;
															$('form')
																	.append(
																			'<input type="hidden" name="_csrf" value="'+token+'">');
															let reportNum = $(
																	this).data(
																	"what");
														},
														success : function(resp) {
															if (!resp.errors
																	&& resp.result == "OK") {
																renderingReplyList();
																editReplyForm
																		.reset();

															} else {
																alert("글 수정 실패");
															}
														},
														error : function(
																errorResp) {
															console
																	.log(errorResp.status);
															viewModal
																	.find(
																			".modal-body")
																	.html(
																			errorResp.responseText);
														}
													});
											return false;
										});
						//

						//댓글 삭제 버튼 누를시, 실행
						listBody
								.on(
										"submit",
										'#deleteReplyForm',
										function(event) {

											event.preventDefault();
											this.replyNum = no;
											var token = $("meta[name='_csrf']")
													.attr('content');
											var header = $(
													"meta[name='_csrf_header']")
													.attr('content');
											if (token && header) {
												$(document)
														.ajaxSend(
																function(event,
																		xhr,
																		options) {
																	xhr
																			.setRequestHeader(
																					header,
																					token);
																});
											}
											$('form')
													.append(
															'<input type="hidden" name="_csrf" value="'+token+'">');
											let url = this.action;
											let method = this.method;
											let data = $(this).serialize();
											let deleteReplyForm = this;
											$
													.ajax({
														url : url,
														method : method,
														data : data,
														dataType : "json",
														beforeSend : function(
																xhr) {
															/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
															if (token && header) {
																xhr
																		.setRequestHeader(
																				header,
																				token);
															}
															;
															$('form')
																	.append(
																			'<input type="hidden" name="_csrf" value="'+token+'">');
															let reportNum = $(
																	this).data(
																	"what");
														},
														success : function(resp) {
															if (!resp.errors
																	&& resp.result == "OK") {
																renderingReplyList();
																deleteReplyForm
																		.reset();

															} else {
																alert("글 삭제 실패");
															}
														},
														error : function(
																errorResp) {
															console
																	.log(errorResp.status);
															viewModal
																	.find(
																			".modal-body")
																	.html(
																			errorResp.responseText);
														}
													});
											return false;

										});

						// 		listBody.on("click", "#deleteReplyForm", function(){
						// 			$(document.deleteReplyForm).submit();
						// 		});

						//대댓글 insert 버튼 누를시, 실행
						listBody
								.on(
										"submit",
										'#insertSubForm',
										function(event) {

											event.preventDefault();

											var token = $("meta[name='_csrf']")
													.attr('content');
											var header = $(
													"meta[name='_csrf_header']")
													.attr('content');
											if (token && header) {
												$(document)
														.ajaxSend(
																function(event,
																		xhr,
																		options) {
																	xhr
																			.setRequestHeader(
																					header,
																					token);
																});
											}
											$('form')
													.append(
															'<input type="hidden" name="_csrf" value="'+token+'">');
											let url = this.action;
											let method = this.method;
											let data = $(this).serialize();
											let insertSubForm = this;
											$
													.ajax({
														url : url,
														method : method,
														data : data,
														dataType : "json",
														beforeSend : function(
																xhr) {
															/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
															if (token && header) {
																xhr
																		.setRequestHeader(
																				header,
																				token);
															}
															;
															$('form')
																	.append(
																			'<input type="hidden" name="_csrf" value="'+token+'">');
															let reportNum = $(
																	this).data(
																	"what");
														},
														success : function(resp) {
															if (!resp.errors
																	&& resp.result == "OK") {
																renderingReplyList();
																insertSubForm
																		.reset();

															} else {
																alert("글 삭제 실패");
															}
														},
														error : function(
																errorResp) {
															console
																	.log(errorResp.status);
															viewModal
																	.find(
																			".modal-body")
																	.html(
																			errorResp.responseText);
														}
													});
											return false;
										});

					});

	//게시글 삭제 버튼 누를 시, 실행
	$("#deleteBtn").on("click", function() {
		$(document.deleteForm).submit();
	});
	//

	//비밀댓글, 공개댓글 버튼 변경

	$('#bopen').on("click", function() {
		console.log($("select"));
		$("select")[1].value = 'reply002';
		
		$('#block').css("display", "initial");
		$('input[name=replyScope]').val('reply002'); 
		event.currentTarget.style.display = "none";
		
	});

	$('#block').on("click", function() {
		$("select")[1].value = 'reply001';
		$('#bopen').css("display", "initial");
		$('input[name=replyScope]').val('reply001'); 
		event.currentTarget.style.display = "none";

	});
</script>
