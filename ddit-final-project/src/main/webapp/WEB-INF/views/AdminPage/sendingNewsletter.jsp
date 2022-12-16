<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<form method="post" action="${pageContext.request.contextPath }/mypage/admin/sendNewsletter">
<security:csrfInput/>
	<div class="mainInfo">
		<!-- Table Section -->
		<div class="table-dashboard">
			<div class="row">
				<div class="mb-7 mb-lg-0">
					
					<h3>
						뉴스레터 발송
					</h3>
					<br>
					<div class="col-lg-12">
						<div class="form-group">
							<input type="text" name="title" class="form-control" style="font-size: 1.2rem; background: white" placeholder="뉴스레터 제목" required="required"/>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="form-group">
							<textarea name="content" id="editor" style="height: 500px; font-size: 1.2rem" ></textarea>
						</div>
					</div>
					<!-- CKEditor5 -->
					<script
						src="${pageContext.request.contextPath }/resources/js/ckeditor5/build/ckeditor.js">
						
					</script>
<!-- 					
					<div class="col-12">
						<!-- Button trigger modal -->
						<button type="submit" class="btn btn-info text-white py-2 px-5"
							style="float: left;">전송</button>
					</div>
				</div>
			</div>
		</div>
<!-- 	</div> -->
</form>

<script>

let result = '${result }';
if (result.length>0){
	alert(result);
}
const CSRFTokken = $("meta[name=_csrf]").attr("content");
	ClassicEditor.create( document.querySelector( '#editor' ),{
		ckfinder: {
			uploadUrl: '${pageContext.request.contextPath }/file/imageUpload?_csrf='+CSRFTokken
		}
	});

</script>


