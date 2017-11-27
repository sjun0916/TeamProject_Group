<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>Smart-Groupware</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/wrong_base.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="user">
				<p class="jr-success">
					회원가입을 축하합니다.<br>
					가입승인을 기다려주세요
					
					<br><br>
					<a href="${pageContext.servletContext.contextPath }/user/login">돌아가기</a>
				</p>				
			</div>
		</div>
	</div>
</body>
</html>