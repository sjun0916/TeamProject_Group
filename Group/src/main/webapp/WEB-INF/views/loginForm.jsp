<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body, #wrap {
	height: 100%
}

#loginImg {
	background-image:url("http://www.clearfit.co.kr/images/CLF_roll_mirror.jpg");
	position: absolute;
	width: 100%;
	height: 300px;
	top: 50%;
	margin-top: -150px;
	opacity: 0.4;
}

#loginForm {
	position: absolute;
	width : 300px;
	right: 50px;
	top: 50%;
	margin-top: -106px;
	
}
button {
	width: 100%;
}

</style>
</head>
<body>

	<div id="wrap">

		<div id="loginImg">
		
		</div>
		<div>
			<form id="loginForm">
				<div class="form-group">
					<label for="exampleInputEmail1">ID</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span></span> <input
							type="text" class="form-control" id="act" placeholder="Account">
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">PASSWORD</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></span> <input
							type="password" class="form-control" id="pwd" placeholder="Password">
					</div>
				<div><a href="/group/memberjoin">REGISTER</a> || <a href="">비밀번호 찾기</a></div>
				<div>
					<a href="/group/home">MAIN(TEST)</a>
				</div>
				</div>
				<button type="submit" class="btn btn-danger">Connection</button>
			</form>
		</div>
		
	</div>

</body>
</html>
