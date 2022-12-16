<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<style>
#changePW, #pswdUpdateBtn {
	width: 392px;
}

.modifyInput {
	width: 190px
}

.modifyPswdForm {
	padding: 10px
}

.popUpContainer {
	width: 395px;
}

.popUpBackG-Color1 {
	background-color: #F5F5F5;
	width: 390px;
	height: 100px;
}

.popUpBackG-Color2 {
	background-color: #F5F5F5;
	width: 390px;
	height: 130px;
}

.modifyTable {
	width: 130px;
	height: 40px;
	margin-left: 30px;
	padding-top: 20px;
}

#verifyInput {
	margin-left: 30px;
}
</style>
<tiles:insertAttribute name="popUpPrescript" />
<tiles:insertAttribute name="css" />
</head>
<body onload="popupClose()">
	<tiles:insertAttribute name="popUpMain" />
</body>
</html>