<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/join.js" type="text/javascript"></script>

<link
	href="${pageContext.servletContext.contextPath }/assets/css/join.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="form-wrap">
		<form  name="loginform" method="post" action="${pageContext.servletContext.contextPath }/user/join" enctype="multipart/form-data" >
			<img src="/groupware/assets/images/title.png" />
			<div>
				<p id="join">회원가입</p>
			</div>
			<table>
				<tr>
					<td>사번</td>
					<td>사번을 뜨는 알람 만들기</td>
				</tr>
				<tr>
					<td>소속부서</td>
					<td>
					<select id="teamId" name="teamId" style="width:160.8px; HEIGHT:22PX">
						<option value="001">인사부</option>
						<option value="002">행정부</option>
						<option value="003">개발부</option>
						<option value="004">영업부</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
					<select id="positionId" name="positionId" style="width:160.8px; HEIGHT:22PX" >
						<option value="001">사장</option>
						<option value="002">과장</option>
						<option value="003">대리</option>
						<option value="004">사원</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="employeeName" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" /> </td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>프로필사진</td>
					<td><input type="file" name="file"></td>
				</tr>
				
			</table>
			<button id="submit" style="width:160.8px; HEIGHT:22PX" >가입요청하기</button>
		</form>
	</div>

</body>
</html>