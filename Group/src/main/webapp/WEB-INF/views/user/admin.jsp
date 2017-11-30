<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<title>Smart-Groupware[ADMIN]</title>
<head>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" media="screen" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/assets/jqgrid/css/ui.jqgrid.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/jqgrid/js/jquery.jqGrid.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin.js" type="text/javascript"></script>
 <script type="text/javascript">  
 
 </script>
</head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>


<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/id-card.png"/>" width="50" height="50"/>
			사원 가입 승인 대기 목록 <small>ADMIN</small>
		</h1>

	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">
		
		<hr>
		
		 <div class="wrap">
	    	<form id="searchEmployeeForm" name="searchEmployeeForm">
				<table id="searchEmployeeTable">
					<tbody align="center">
					<tr >
						<th scope="row" >팀명</th>
						<td colspan="2">
							<select id="teamId" name="teamId" style="width:178.4px; HEIGHT:20px">
							</select>
						</td>
						<th scope="row" >이름</th>
						<td colspan="2">
							<input type="text" size=30  id="employeeName" name="employeeName">							
						</td>
						<td>
							<button type="button" class="search" id="searchEmployeeButton" tabindex="3">검색</button>
						</td>
					</tr>					
					</tbody>					
				</table>
			</form>
		</div>
		<hr>

		 <div id="list_div">
			<table id="list"></table>

		</div>

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>