<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Menu Zord -->
<nav class="nav-menuzord nav-menuzord-transparent navbar-sticky">
	<div class="container clearfix">
		<div id="menuzord" class="menuzord">
			<a href="${pageContext.request.contextPath }/"
				class="menuzord-logo-brand"></a>
			<ul class="menuzord-menu menuzord-right" style="width: 630px;">
				<li class=" active "><a class=""
					href="${pageContext.request.contextPath }/">Home</a></li>

				<li class=""><a href="${pageContext.request.contextPath }/prod/airline">항공권</a></li>

				<li class=""><a href="javascript:void(0)">상품</a>
					<ul class="dropdown drop-up">
						<li class=""><a
							href="${pageContext.request.contextPath }/prod/packageList">패키지</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/prod/hotelList">호텔</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/prod/rentcarList">렌터카</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/insurance/iForm">보험</a></li>
					</ul></li>

				<li class=""><a href="javascript:void(0)">고객센터</a>
					<ul class="dropdown drop-up">
						<li class=""><a href="${pageContext.request.contextPath }/article/serviceList/BC003">공지사항</a>
						</li>
						<li class=""><a href="${pageContext.request.contextPath }/article/serviceList/BC005">자주묻는 질문</a></li>
					</ul></li>

				<li class=""><a href="javascript:void(0)">커뮤니티</a>

					<ul class="dropdown drop-up">
						<li class=""><a href="${pageContext.request.contextPath }/article/articleList/BC001">동행게시판</a>
						</li>
						<li class=""><a href="${pageContext.request.contextPath }/article/articleList/BC002">장터게시판</a></li>
					</ul></li>



				<li class=""><a
					href="${pageContext.request.contextPath }/blog/blogMainPage">블로그</a>
					<ul class="dropdown drop-up">
						<li class="">
							<a href="${pageContext.request.contextPath }/blog/blogMainPage">블로그게시판</a>
						</li>
						<li class="">
							<security:authorize access="hasAnyRole('ROLE_CM','ROLE_HC','ROLE_RC','ROLE_SA','ROLE_MA')">
							<security:authentication property="principal" var="principal" />
							<a href="${pageContext.request.contextPath }/blog/01/rest4TripBlog?id=${principal.realUser.accId}">내 블로그</a>
							</security:authorize>
						</li>
					</ul>
				</li>
				<security:authorize access="!isAuthenticated()">
					<li class=""><a href="javascript:void(0)"
						data-bs-toggle="modal" data-bs-target="#login">로그인</a></li>
				</security:authorize>

				<security:authorize access="hasAnyRole('ROLE_CM','ROLE_HC','ROLE_RC','ROLE_SA')">
					<security:authentication property="principal" var="principal" />
					<form id="viewForm" action="${pageContext.request.contextPath }/memberView">
					</form>
					<li class=""><a data-who="${principal.username }" data-bs-toggle="modal" data-bs-target="#myMenuModal">${principal.username }님</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_MA')">
					<security:authentication property="principal" var="principal" />
					<li class="">
						<a href="javascript:void(0)" >관리페이지</a>
						<ul id="admin" class="dropdown drop-up">
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/editForm">관리자 계정 관리</a>
		                </li>
		
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/manageMem">회원 관리</a>
		                </li>
		
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/manageNotice">공지사항 관리</a>
		                </li>
		
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/manageCoupon">쿠폰 관리</a>
		                </li>
		
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/sendingNewsletter">뉴스레터 발송</a>
		                </li>
		
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/manageDestination">여행지 관리</a>
		                </li>
		                <li class="">
		                  <a href="<%=request.getContextPath()%>/mypage/admin/chartView">통계 자료</a>
		                </li>
		                <li class="">
							<a href="javascript:void(0)" onclick="logoutForm.submit();">Logout</a>
		                </li>
		              </ul>
					</li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>
<!-- 마이페이지 모달창 시작 -->
<%@ include file="/WEB-INF/views/includee/myModal.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/kmb/kmb.js?<%=System.currentTimeMillis()%>"></script>

<!-- 마이페이지 모달창 종료 -->






