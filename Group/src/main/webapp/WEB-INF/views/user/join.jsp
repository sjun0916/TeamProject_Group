<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
  <title>Smart-Groupware</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/font-awesome.min.css" media="screen" title="no title">
    <!-- Custom style -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/joinCSS/css/style.css" media="screen" title="no title">
	
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/join.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    
    <script type="text/javascript">

function joinCheck(){
	if(document.loginform.employeeName.value==""){
		alert("이름을 입력해 주세요.");
		document.loginform.employeeName.focus();
		return
	}

	var checkEmail = /^[\w]{4,}@gmail.com$/;
	var employeeEmail = $("#email").val();
	if(checkEmail.test(employeeEmail)==false || employeeEmail==""){
		alert("구글 이메일을 입력해 주세요.");
		document.loginform.email.focus();
		return false;
	}

	if(document.loginform.password.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.loginform.password.focus();
		return
	}
	
	document.loginform.submit();
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
           </div>
           <!-- /.navbar-collapse -->
       </div>
       <!-- /.container -->
   </nav>
	
	
	<br><br><br><br><br><br>
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입 <small>register</small></h1>
        </div>
        <form class="form-horizontal" name="loginform" method="post" action="${pageContext.servletContext.contextPath }/user/join" enctype="multipart/form-data">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="num">사원번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="num" name="num" type="text" placeholder="신청시 자동 등록(관리자에게 문의)" disabled>
        </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="employeeName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="employeeName" name="employeeName" type="text" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="email">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="email" name="email" type="email" placeholder="구글 이메일">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="password">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="password" name="password" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="positionId">직급</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <select id="positionId" class="form-control" name="positionId" style="width:200px; HEIGHT:30PX" >
							</select>
                </div>
              </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="teamId">부서</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <select id="teamId" class="form-control" name="teamId" style="width:200px; HEIGHT:30PX" >
							</select>
                </div>
              </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="file">프로필사진</label>
        <div class="col-sm-6">
          <input class="form-control" id="file" name="file" type="file" placeholder="프로필사진">
        </div>
        </div>
        
        <div class="form-group">
          <div class="col-sm-12 text-center">
          	<button type="button" class="btn btn-primary" onclick="joinCheck()">가입요청<i class="fa fa-check spaceLeft"></i></button>
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
