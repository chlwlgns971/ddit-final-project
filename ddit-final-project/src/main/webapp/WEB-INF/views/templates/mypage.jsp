<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<meta name="theme-color" content="#7952b3">

<title><tiles:getAsString name="title" /></title>

<tiles:insertAttribute name="preScript" />
<tiles:insertAttribute name="kmbCSS" />
<tiles:insertAttribute name="kmbPlugin" />

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#menu {
	width: 100%;
}

.menus {
	text-align: center;
	font-size: 1rem;
	height: 45px;
}

.text-right {
	padding-top: 20px;
	text-align: right;
}

.profile {
	width: 100%;
}

.box {
	width: 100%;
}

.infoTable {
	width: 100%;
}

th {
	text-align: right;
}

td {
	padding: 10px;
}

.buttons {
	text-align: center;
}

h4 {
	padding-top: 10px;
	padding-left: 10px;
}

.mainInfo {
	padding: 15px;
}
</style>
<!-- Custom styles for this template -->
<%-- <link href="<%=request.getContextPath()%>/resources/css/dashboard.css" --%>
<!-- 	rel="stylesheet"> -->
</head>
<body id="body" class="up-scroll">
	<tiles:insertAttribute name="headerMenu" />
	<section class="bg-smoke py-10">
		<div class="container">
			<div class="row">
				<tiles:insertAttribute name="leftMenu" />
				<div class="col-lg-9">
					<div
						class="rounded border-primary border-top border-top-5 media media-list-view media-border flex-column align-items-stretch mb-5">
						<tiles:insertAttribute name="main" />
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	<tiles:insertAttribute name="postScript" />
</body>

</html>