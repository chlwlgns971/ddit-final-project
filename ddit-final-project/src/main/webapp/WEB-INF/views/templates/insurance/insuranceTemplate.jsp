<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />

<style>
.modal-dialog{
	max-width: 800px;
}
a{
 color: #969696;
 
}
p:hover{
	color: #01ace4;
	font-size: 0.885rem;
}
a:hover{
	color: #01ace4;
}
.modal-header{
	background-color: #e6f7fc;
}
.modal-header h5{
	color: #01ace4;
}
th a{
	color: black;
}
label{
	color: #969696;
}
label:hover{
	color: #01ace4;
	font-size: 0.885rem;
}
.addCusNum{
	margin-bottom: 1rem;
    padding-top: inherit;
}

</style>
</head>

<body id="body" class="up-scroll">
	<header class="header" id="pageTop">
		<tiles:insertAttribute name="headerMenu" />
	</header>
	<!-- ====================================
  ——— HEADER
  ===================================== -->
	<div class="main-wrapper single-package-right-sidebar">


		<!-- ====================================
———	PAGE TITLE
===================================== -->
		<section class="page-title">
			<div class="page-title-img bg-img bg-overlay-darken"
				style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg13.jpg);">
				<div class="container">
					<div class="row align-items-center justify-content-center"
						style="height: 200px;">
						<div class="col-lg-6">
							<div class="page-title-content">
								<div class="">
									<h2 class="text-uppercase text-white font-weight-bold">City
										Museum Tour</h2>
								</div>
								<p class="text-white mb-0">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- ====================================
———	PACKAGES SECTION
===================================== -->
		<section class="py-10">
			<div class="container">
				<tiles:insertAttribute name="main" />
			</div>
		</section>
	</div>
	<!-- element wrapper ends -->
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>

	<tiles:insertAttribute name="postScript" />
</body>
</html>

