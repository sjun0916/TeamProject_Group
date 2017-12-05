<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>1234
<script type = "text/javascript">
<%
	if(request.getParameter("employeeNo") == "" && request.getParameter("employeeNo") == null
		&& request.getParameter("password") == "" && request.getParameter("password") == null){
		%> history.go(-1);
<%	}
%> 
</script>  
</head>
<body>


</body>
</html>
