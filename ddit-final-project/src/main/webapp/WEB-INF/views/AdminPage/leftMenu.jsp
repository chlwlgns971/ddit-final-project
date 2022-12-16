<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<div class="col-md-12 col-lg-3">
	<div class="row">
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded overflow-hidden">
				<img id="profileImgSrc" src="<security:authentication property="principal.realUser.accImg"/>" data-src="<security:authentication property="principal.realUser.accImg"/>" alt="Generic placeholder image" class="w-100 rounded-circle me-1 lazyestload">
				<security:authentication property="principal" var="principal" />
				<h5 class="text-right">관리자 ${principal.username }님,<br/> 좋은 하루 되세요.😀</h5>
			</div>
		</div>
		<div class="col-md-6 col-lg-12">
			<div class="mb-6 bg-white p-3 border-top border-top-5 border-primary rounded">
				<table class="box">
					<tbody>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/editForm'>관리자 계정 관리</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/manageMem'>회원 관리</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/manageNotice'>공지사항 관리</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/manageCoupon' >쿠폰 관리</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/sendingNewsletter' >뉴스레터 발송</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/manageDestination'>여행지 관리</a></td>
						</tr>
						<tr>
							<td class="menus"> <a href='<%=request.getContextPath()%>/mypage/admin/chartView'>통계 자료</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	let profileImgSrcValue='${profileImg}';
	let profileImgSrc = document.getElementById("profileImgSrc");
	if(profileImgSrcValue!=""&&null!=profileImgSrcValue){
		profileImgSrc.src=profileImgSrcValue;
		profileImgSrc.dataset.src=profileImgSrcValue;
	}
</script>
