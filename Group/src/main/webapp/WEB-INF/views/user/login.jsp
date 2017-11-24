<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>Smart-Groupware System</title>
<head>
<!-- Bootstrap Core CSS -->
    <link href="<c:url value='/resources/loginCSS/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/resources/loginCSS/resources/css/landing-page.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/loginCSS/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- RSA javascript library / cdn 올리는 순서 틀리면 안 됨 -->
	<script src="<c:url value='/resources/loginCSS/resources/js/rsa/jsbn.js'/>"></script>
	<script src="<c:url value='/resources/loginCSS/resources/js/rsa/rsa.js'/>"></script>
	<script src="<c:url value='/resources/loginCSS/resources/js/rsa/prng4.js'/>"></script>
	<script src="<c:url value='/resources/loginCSS/resources/js/rsa/rng.js'/>"></script>
	
	<script src="<c:url value='/resources/loginCSS/resources/js/jquery-3.1.1.min.js'/>"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
       <div class="container topnav">
           <!-- Brand and toggle get grouped for better mobile display -->
           <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand topnav" href="#">Smart Groupware-System</a>
           </div>
           <!-- Collect the nav links, forms, and other content for toggling -->
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav navbar-right">
                   <li>
                       <a href="#about">About</a>
                   </li>
                   <li>
                       <a href="#services">Services</a>
                   </li>
                   <li>
                       <a href="#contact">Contact</a>
                   </li>
               </ul>
           </div>
           <!-- /.navbar-collapse -->
       </div>
       <!-- /.container -->
   </nav>
	<div class="intro-header">
       <div class="container">
		<div class="row">
               <div class="col-lg-12">
                   <div class="intro-message">
                       <h1>Smart Groupware-System</h1>
                       <h3>made by groupwhere - 강현아, 김신협, 김성준, 박은영, 이형진</h3>
                       <hr class="intro-divider">
                    <div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<h5 class="text-center" style="color:black;">
								SIGN UP</h5>
								<form class="form form-signup" role="form" name="loginform" method="post" action="${pageContext.servletContext.contextPath }/user/auth">
									<div class="form-group">
										<input type="hidden" id="RSAModulus" value="${RSAModulus}">
										<input type="hidden" id="RSAExponent" value="${RSAExponent}">
										<div class="input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
											<input type="text" class="form-control" name="employeeNo" id="employeeNo" placeholder="사번을 입력하세요" />
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
											<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요" />
										</div>
									</div>
									<div><a href="${pageContext.servletContext.contextPath }/user/join">REGISTER</a> || <a href="">비밀번호 찾기</a></div>
									<button type="submit" class="btn btn-sm btn-primary btn-block">로그인</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
       <!-- /.container -->
</div>
   <!-- /.intro-header -->

<div class="content-section-a">
	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-sm-6">
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
					<h2 class="section-heading">Smart Groupware-System:<br>사내편의를 말하다</h2>
					<p class="lead" style="font:1.1em/1em 돋움, serif;line-height:normal;">사내편의를 위한<a target="_blank" href="#">&nbsp;Smart Groupware-System</a> 
						는 인사관리부터<br/> 전자결재, 게시판까지 기본 편의를 제공하며 나아가 <br/>전자메일, 일정관리까지 실질적인 편의를 제공하는 어플리케이션<br/>입니다.</p>
				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<img class="img-responsive" src="resources/loginCSS/resources/img/ipad.png" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
