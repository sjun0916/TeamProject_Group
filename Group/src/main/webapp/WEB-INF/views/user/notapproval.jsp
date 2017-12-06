<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>/</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/Simple/css/bootstrap.css" rel="stylesheet">
    <!-- Fontawesome core CSS -->
    <link href="${pageContext.request.contextPath}/resources/Simple/css/font-awesome.min.css" rel="stylesheet" />
    <!--GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!-- custom CSS here -->
    <link href="${pageContext.request.contextPath}/resources/Simple/css/style.css" rel="stylesheet" />
    
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
           </div>
           <!-- /.navbar-collapse -->
       </div>
       <!-- /.container -->
   </nav>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
    <!--jumbotron-->
    <div class="jumbotron  text-center ">
        <h4 class="top-pad head-main">가입 승인 대기  </h4>
        <hr>
        <p>현재 관리자의 승인을 기다리고 있습니다. 승인 후 이용해 주세요.</p>
         <a href="/group"><i class="fa fa-mail-reply"></i>&nbsp;PLEASE GO BACK</a>
    </div>
    


    <!--Footer end -->
    <!--Core JavaScript file  -->
    <script src="${pageContext.request.contextPath}/resources/Simple/js/jquery-1.10.2.js"></script>
    <!--bootstrap JavaScript file  -->
    <script src="${pageContext.request.contextPath}/resources/Simple/js/bootstrap.js"></script>
</body>
</html>
