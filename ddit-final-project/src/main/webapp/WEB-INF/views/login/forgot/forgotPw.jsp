<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%-- <script link="<%=request.getContextPath()%>/resources/css/accountSign.css" ></script> --%>

<form:form class="mail_input_box_warn" action="forgotPw.do" id="mail_input_box_warn"
			method="post" style="margin-left:20%; margin-right:20%; ">
<security:csrfInput/>
<!-- Forgot Pw Modal -->
<br>
<h3 class="modal-title text-uppercase font-weight-bold" style="text-align:center;">
	비밀번호 찾기
</h3>
<br><br>

	<!-- 아이디 입력받기 -->
	<div class="mb-3">
		<label for="employee-id" >
			ID를 입력해 주세요
		</label>
		<p id="employee-id-hint" class="input-hint">
			아이디 입력하기 
		</p>
		<input id="acc_Id" aria-describedby="employee-pw-hint" name="acc_Id" type="text" 
				class="form-control bg-smoke acc_Id" maxlength="20" minlength="4" 
				placeholder="ddit403" required="required" autofocus="autofocus" />
	</div>

	<br>
	<!-- 이메일 입력받기 -->
	<div class="mb-3" class="mail_wrap">
		<label for="dupl-text"> E-mail로 인증 받기 </label>
		<p id="employee-id-hint" class="input-hint">
			E-mail을 입력해 주세요 <br> </p>
		<input type="text" name="mem_Mail" class="mail_check_input_box form-control bg-smoke mail_input" 
				id="mail"  placeholder="ddit403@ddit.go.kr"
				style="width:82%; display:inline;" required="required" />
		<span class="mail_input_box_warn"></span>
		<input type="button" 
				class="btn btn-primary btn-block text-uppercase mail_check_button"
				 value="전송하기" />
		
	</div>
	
	
	
	<!-- 로그인화면으로 이동 -->
	<div class="modal-footer justify-content-center">
		<p class="mb-1">
			<a href="../index.do" >
			Main Page
			</a>
		</p>
	</div>
</form:form>

<script src="<%=request.getContextPath()%>/resources/js/signup/forgotPw.js"></script>
