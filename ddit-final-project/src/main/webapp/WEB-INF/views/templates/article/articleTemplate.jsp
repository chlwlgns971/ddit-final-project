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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />
<style>
li {
	float: left;
}

.dropdown-menu {
	min-width: 1rem;
}

.dropdown-menu.show {
	display: inline-grid;
}

pre {
	Color: #999999;
	font-size: 15px;
	font-family: "Montserrat", "Arial", sans-serif;
	Margin: 0px 0px 48px;
}

.pagination {
	margin: revert;
}
.btn btn-primary{
	color: white;
}
</style>
</head>
<body id="body" class="up-scroll">
	<header class="header" id="pageTop">
		<tiles:insertAttribute name="headerMenu" />
	</header>

	<div class="main-wrapper booking">

		<tiles:insertAttribute name="main" />
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>

	<tiles:insertAttribute name="postScript" />
</body>
</html>

