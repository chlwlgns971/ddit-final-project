<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<security:csrfMetaTags/>
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />
<style>

</style>
</head>
<body>
	<header class="header" id="pageTop">
		<tiles:insertAttribute name="headerMenu" />
	</header>

	<section class="page-title">
		<div class="page-title-img bg-img bg-overlay-darken"
			style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg4.jpg);">
			<div class="container">
				<div class="row align-items-center justify-content-center" 
					style="height: 200px;">
					<div class="col-lg-6">
						<div class="page-title-content">
							<div class="title-border">
								<h2 class="text-uppercase text-white font-weight-bold">
									회원가입
								</h2>
							</div>
							<p class="text-white mb-0"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<div class="main-wrapper booking">
		<section class="bg-smoke py-10">
			<div class="container">
				<div
					class="rounded media media-list-view media-border flex-column align-items-stretch mb-5"
					style="font-weight: bold;">
					<tiles:insertAttribute name="main" />
				</div>
				<div class="row">
					<%-- 					<tiles:insertAttribute name="leftMenu"/> --%>
					<div class="col-lg-9"></div>
				</div>
			</div>
		</section>
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	<tiles:insertAttribute name="postScript" />
</body>
</html>

