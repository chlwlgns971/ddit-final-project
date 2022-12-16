<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<div class="mainInfo">
	<div class="card card-lg card-transparent mb-8">
		<div class="card-body px-2 py-6">
		<button id="toList" type="button" class="btn btn-info btn-sm text-white mb-2" style="margin-left: 82%; width:120px;" onclick="location.href='<%=request.getContextPath()%>/mypage/admin/manageNotice'">목록으로</button>
			<h3 class="mb-4">${articleVO.artTitle }</h3>

			<div class="meta-post-sm mb-4">
				<ul class="list-unstyled d-flex flex-wrap mb-0">
					<li class="meta-tag me-4 mb-1">
						<i class="fa fa-user text-gray-color" aria-hidden="true"></i>
						<span class="ms-1 text-capitalize text-gray-color">${articleVO.accId }</span>
					</li>
					<li class="meta-tag text-gray-color me-4 mb-1">
						<i class="fas fa-calendar-alt" aria-hidden="true"></i>
						<span class="ms-1 text-capitalize">${articleVO.artDate }</span>
					</li>

<!-- 					<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 						class="fa fa fa-tags" aria-hidden="true"></i> <span -->
<!-- 						class="ms-1 text-capitalize">Travel</span></li> -->

<!-- 					<li class="meta-tag text-gray-color me-4 mb-1"><i -->
<!-- 						class="fa fa-envelope" aria-hidden="true"></i> <span -->
<!-- 						class="ms-1 text-capitalize">8 com</span></li> -->
				</ul>
			</div>
				${articleVO.artCont }
		</div>
		
		<form id="editForm" action="${pageContext.request.contextPath }/mypage/admin/editNoticeForm" method="post">
			<input type="hidden" name="artNum">
			<input type="hidden" name="artBCode" value="${articleVO.artBCode }">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<form id="delForm" action="${pageContext.request.contextPath }/mypage/admin/delNotice" method="post">
			<input type="hidden" name="artNum">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<div class="card-footer d-flex align-items-center rounded p-3 p-md-4">
			<button type="button" onclick="fn_edit()" class="btn btn-outline-success mb-2" style="margin-left:73%;">수정</button>
			<button type="button" onclick="fn_del()" class="btn btn-outline-danger mb-2" style="margin-left:3%;">삭제</button>
		</div>
	</div>
</div>

<script>
	let editForm = $("#editForm");
	let artNumTag = $("[name=artNum]");
	let delForm = $("#delForm");
	function fn_edit(){
		let artNum = ${articleVO.artNum };
		artNumTag.val(artNum);
		editForm.submit();
	}
	function fn_del(){
		if(confirm("삭제하시겠습니까?")==true){
			let artNum = ${articleVO.artNum };
			artNumTag.val(artNum);
			delForm.submit();
		}else{
			return;
		}
		;
	}
	let message = '${message }';
	if (message.length>0){
		alert(message);
	}
</script>