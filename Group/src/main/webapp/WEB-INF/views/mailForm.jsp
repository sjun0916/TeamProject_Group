<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
<title>Smart-GroupWare System</title>
	<link rel="icon" type="image/png"  href="/jmcnetplug/image/jmclogo.png"/>
	<title> 비밀번호 찾기</title>
	<script type="text/javascript">
		function search(){
			if((pwsearch.employeeName.value!=null)&&(pwsearch.email.value!=null)){
				pwsearch.submit();
			}else if(pwsearch.employeeName.value==null) {
				alert("이름을 입력하세요.")
			}else if(pwsearch.email.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
	
	</script>
	
</head>
<body>

<h2 align="center">비밀번호 찾기</h2>
<div align="center">
<p >이름과 이메일 주소를 입력해 주세요.</p>
<form action="${pageContext.servletContext.contextPath }/mail/mailSending" name="pwsearch" method="post" >
	<table border="1" >
		
		<tr>
			<td>이름</td>
			<td>e-mail</td>
		</tr>
		<tr>
			<td><input type="text" name="employeeName"/></td>
			<td><input type="email" name="email" /></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="button" value="비밀번호 찾기 " onclick="search()" /></td>
			
		</tr>
	</table>

</form>
</div> 
<p align="center">로그인 페이지로 가시려면 <a href="${pageContext.servletContext.contextPath }/">로그인페이지</a>를 클릭하세요.</p>
</body>
</html>
