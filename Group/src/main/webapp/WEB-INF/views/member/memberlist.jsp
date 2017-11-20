<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h2>회원 목록</h2>
	<table border="1" width="700px">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>회원가입일자</th>
		</tr>
		<c:forEach var="members" items="${list}" varStatus="loop">
		<tr>
			<td>${members.userId}</td>
			<!-- 회원정보 상세조회를 위해 a태그 추가 -->
			<td><a href="${path}/member/view?userId=${members.Id}">${members.Name}</a></td>
			<td>${members.Email}</td>
			<td>${members.Regdate}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>