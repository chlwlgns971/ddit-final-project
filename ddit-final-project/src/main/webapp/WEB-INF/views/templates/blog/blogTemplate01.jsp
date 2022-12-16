<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<security:csrfMetaTags/>
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />
</head>

<body>
	<div id="colorlib-page">
		<tiles:insertAttribute name="leftMenu" />
		<div id="colorlib-main">
			<tiles:insertAttribute name="main" />
			<footer class="ftco-footer ftco-bg-dark ftco-section">
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
	</div>
	<tiles:insertAttribute name="postScript" />
</body>
</html>

