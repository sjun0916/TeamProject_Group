<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Exception 오류</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Error</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="${pageContext.request.contextPath}/resources/errorPage/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME ICONS STYLE  -->
    <link href="${pageContext.request.contextPath}/resources/errorPage/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="${pageContext.request.contextPath}/resources/errorPage/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400' rel='stylesheet' type='text/css' />

</head>
<body>
	<br><br><br><br>
    <div id="home-sec">
        <div class="overlay">
            <div class="container">
                <div class="row text-center ">
                    <div class="col-md-5">
                        <img src="${pageContext.request.contextPath}/resources/errorPage/icon/exception.png" class="img-set" />
                    </div>
                    <div class="col-md-5 col-md-offset-2 c-white">
                        <h2>Exception Error</h2>
                        <hr>
                        <p>
                     	       존재하지 않는 데이터베이스에 연결을 시도했거나,
                     	       <br>
                     	       손상된 파일을 열려고 하거나,
                     	       <br>
                     	       잘못된 접속 요청입니다.
                        </p>
                        <hr />
                        <br />
                        <br />
                        
                        <p>로그인 화면으로 돌아가기</p>
                        <div class="form-group">
                            <a href="/group/" class="btn btn-social-custom">Back</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
