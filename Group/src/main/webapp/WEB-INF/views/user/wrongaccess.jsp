<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Smart-Groupware</title>
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
	<br><br><br><br><br><br><br><br>
    <div id="home-sec">
        <div class="overlay">
            <div class="container">
                <div class="row text-center ">
                    <div class="col-md-5">
                        <img src="${pageContext.request.contextPath}/resources/errorPage/img/crane.png" class="img-set" />
                    </div>
                    <div class="col-md-5 col-md-offset-2 c-white">
                        <h2>페이지 오류 안내</h2>
                        <hr>
                        <p>
                     	       페이지 주소가 잘못 입력되었거나 변경되어 페이지를 찾을 수 없습니다.
                     	       주소를 다시 확인해주세요.
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
