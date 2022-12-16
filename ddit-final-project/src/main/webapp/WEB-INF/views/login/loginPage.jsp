<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<html lang="en">
  
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Login Page</title>

    <!-- Plugins css Style -->
    <link href='${pageContext.request.contextPath }/resources/js/fontawesome-5.15.2/css/all.min.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath }/resources/js/fontawesome-5.15.2/css/fontawesome.min.css' rel='stylesheet'>
    <link href="${pageContext.request.contextPath }/resources/js/animate/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/js/menuzord/css/menuzord.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/js/menuzord/css/menuzord-animations.css" rel="stylesheet">

    
    <link href='${pageContext.request.contextPath }/resources/js/fancybox/jquery.fancybox.min.css' rel='stylesheet'>
    
    <script src="<%=request.getContextPath() %>/resources/js/jquery/jquery-3.4.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery/jquery.cookie.js"></script>
    
    <!-- GOOGLE FONT -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700' rel='stylesheet'>

    <!-- CUSTOM CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/star-color2.css" id="option_style" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/loginForm.css" id="option_style" rel="stylesheet">


    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>     

<body id="body" class="up-scroll">
<!-- ====================================
——— TRAVEL TIPS SECTION
===================================== -->

<section class="py-9 py-md-10">
<script src="<%=request.getContextPath()%>/resources/css/loginForm.css"></script>
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form:form class="" action="${pageContext.request.contextPath }/login/loginCheck.do" method="post">
			<h1 class="text-info">Rest4Trip</h1>
			<h1>Sign in</h1>
			<input id="accId" aria-describedby="employee-pw-hint" name="accId" type="text" 
				class="form-control bg-smoke" placeholder="ID" maxlength="20" minlength="4" required autofocus>
				
			<input id="accPw" aria-describedby="employee-pw-hint" name="accPw" type="password" placeholder="PASSWORD" 
				class="form-control bg-smoke" required autofocus>
			<a href="${pageContext.request.contextPath }/AccLoginn/forgotId.do">Forgot your id?</a>
			<a href="${pageContext.request.contextPath }/AccLoginn/forgotPw.do">Forgot your password?</a>
			<button type="submit" class="btn btn-primary text-uppercase">Sign In</button>
		</form:form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p style="color: white; font-weight: bold;">지금 바로 여정에 로그인해서 모든 혜택을 누려보세요!</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		let signUpButton = document.getElementById('signUp');
	
		signUpButton.addEventListener('click', () => {
			 location.href = "${pageContext.request.contextPath }/AccLoginn/signup.do";
		});
	</script>
</div>

</section>


    <!-- Javascript -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/menuzord/js/menuzord.js"></script>
    
    
    
    <script src='${pageContext.request.contextPath }/resources/js/fancybox/jquery.fancybox.min.js'></script>
    
    
    
    
    
    <script src="${pageContext.request.contextPath }/resources/js/lazyestload/lazyestload.js"></script>
    
    
    
    
    
    
    
    
    <script src="${pageContext.request.contextPath }/resources/js/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/star.js"></script>
  </body>
</html>
