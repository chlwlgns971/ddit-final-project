<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="mainInfo">
	<h3>개인정보관리</h3>
	<hr>
	<table class="infoTable" >
	    <tr>
	      	<th><spring:message code="mypage.id" /></th>
	      	<td><input type="text" readonly="readonly" value=${member['memId'] }></td>
	   </tr>
	   <tr>
	    	<th><spring:message code="mypage.password" /></th>
			<td><input type="text"></td>
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.validPassword" /></th>
	      	<td><input type="text"></td>
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.name" /></th>
	      	<td><input type="text" readonly="readonly" value=${member['memName'] }></td>   
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.birth" /></th>
	      	<td><input type="text" readonly="readonly" value=${member['memName'] }></td>
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.inout" /></th>
	      	<td><input type="text" readonly="readonly" value=${member['memName'] }></td>
	   </tr>
	   <tr>
		    <th><spring:message code="mypage.gender" /></th>
		    <td>
		    	<input type='radio' name='gender' value='female' id='f' checked="checked"/> 
		    	<label for='f'>여성</label>
		    	<input type='radio' name='gender' value='male' id='m' /> 
		    	<label for='m'>남성</label>
		    </td>
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.phonenumb1" /></th>
	      	<td><input type="text"></td>
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.phonenumb2" /></th>
	      	<td><input type="text"></td>
	  </tr>
	  	<tr>
	    	<th><spring:message code="mypage.email" /></th>
	    	<td><input type="text"></td>
	   	</tr>
	   	<tr>
      		<th><spring:message code="mypage.regno" /></th>
      		<td><input type="text" readonly="readonly">&nbsp;<input type="button" class="btn btn-primary" value="주소찾기"></td>
	
	   </tr>
	   <tr>
	      	<th><spring:message code="mypage.regnodetail" /></th>
	      	<td><input type="text"></td>
	   </tr>
	   <tr>
		    <th><spring:message code="mypage.agreement"/></th>
		    <td><input type="checkbox"> &nbsp;&nbsp;<spring:message code="mypage.subscribe" /></td>
	   </tr>
	</table>
	<div class="buttons">
	   <input type="button" class="btn btn-primary" type="submit" value="수정하기">
	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="button" class="btn btn-primary" type="submit" value="취소">
	</div>

</div>
