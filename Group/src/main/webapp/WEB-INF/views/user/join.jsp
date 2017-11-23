<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/join.js" type="text/javascript"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/loginCSS/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="<c:url value='/resources/loginCSS/resources/css/panelSearch.css'/>" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">사원정보 등록폼</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-horizontal" name="loginform" method="post" action="${pageContext.servletContext.contextPath }/user/join" enctype="multipart/form-data" >
					<div class="form-group">
						사번 : 자동등록 (알람 만들기)
						<div class="col-sm-3">
							이름 : <input type="text" class="form-control" name="employeeName"placeholder="사원 이름" />
						</div>
						
						<div class="col-sm-3">
							이메일 : <input type="text" class="form-control" name="email" placeholder="사원 이메일">
						</div>
					
					<div class="form-group">
						<div class="col-sm-3">
							비밀번호 : <input type="password" class="form-control" name="password"	placeholder="비밀번호">
						</div>
					</div>

					<div class="form-group">
						<span style="color:red; font-size:10pt">직급</span>
						<div class="col-sm-3">
							<select id="positionId" class="form-control" name="positionId" style="width:160.8px; HEIGHT:22PX" >
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<span style="color:red; font-size:10pt">부서</span>
						<div class="col-sm-3">
							<select id="teamId" class="form-control" name="teamId" style="width:160.8px; HEIGHT:22PX" >
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">
							프로필사진 : <input type="file" name="file">
						</div>
					</div>
					
					</div>
					
					<div align="center">
						<button id="submit" style="width:160.8px; HEIGHT:22PX" class="btn-success btn-lg">가입요청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>