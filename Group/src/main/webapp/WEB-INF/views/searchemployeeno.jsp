<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
  <head>
  <title>Smart-Groupware</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Smart-Groupware</title>

    <!-- Bootstrap -->
    <link href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/font-awesome.min.css" media="screen" title="no title">
    <!-- Custom style -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/style.css" media="screen" title="no title">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/join.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    
    <script>
					function search(){
						if(document.pwsearch.email.value==""){
							alert("구글 이메일을 입력해 주세요.");
							document.pwsearch.email.focus();
							return
						}
						if(document.pwsearch.employeeName.value==""){
							alert("이름을 입력해 주세요.");
							document.pwsearch.employeeName.focus();
							return
						}
						
						
						document.pwsearch.submit();
					}
	</script>
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
               <a class="navbar-brand topnav" href="/group">Smart Groupware-System</a>
           </div>
           <!-- Collect the nav links, forms, and other content for toggling -->
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <!--  <ul class="nav navbar-nav navbar-right">
                   <li>
                       <a href="#about">About</a>
                   </li>
                   <li>
                       <a href="#services">Services</a>
                   </li>
                   <li>
                       <a href="#contact">Contact</a>
                   </li>
               </ul> -->
           </div>
           <!-- /.navbar-collapse -->
       </div>
       <!-- /.container -->
   </nav>
	
	
	<br><br><br><br><br><br>
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1>사원번호 받기 <small>employeeNo (mail_send)</small></h1>
        </div>
        <form class="form-horizontal" action="${pageContext.servletContext.contextPath }/mail/mailSendNo" name="pwsearch" method="post" >

        <div class="form-group">
          <label class="col-sm-3 control-label" for="email">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="email" name="email" type="email" placeholder="구글 이메일">
        </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label" for="employeeName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="employeeName" name="employeeName" type="text" placeholder="이름">
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-sm-12 text-center">
          	<button type="button" class="btn btn-primary" onclick="search()">사원번호 전송<i class="fa fa-check spaceLeft"></i></button>
          	<button class="btn btn-danger" type="reset" onclick="location.href='/group'">돌아가기<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
