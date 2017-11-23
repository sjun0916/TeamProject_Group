<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
	
 <script type="text/javascript">  
 
 </script>
</head>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			Page Header <small>Optional description</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		 <div class="wrap">
	    	<form id="searchEmployeeForm" name="searchEmployeeForm">
				<table id="searchEmployeeTable">
					<tbody>
					<tr >
						<th scope="row" >팀명</th>
						<td colspan="2">
							<select id="teamId" name="teamId" style="width:178.4px; HEIGHT:17.6px">
								<option value="001">인사부</option>
								<option value="002">행정부</option>
								<option value="003">개발부</option>
								<option value="004">영업부</option>
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

<!-- 		<div id="list_div"> -->
<!-- 			<table id="list"></table> -->
			<h2>회원 목록</h2>
    <table border="1" width="700px">
        <tr>
            <th>사원번호</th>
            <th>이름</th>
            <th>부서</th>
            <th>직급</th>
            <th>이메일</th>
            
        </tr>
        <c:forEach var="employee" items="${JSONResult.success(list)}">
        <tr>
            <td>${employee.employeeNo}</td>
            <td>${employee.employeeName}</td>
            <td>${employee.teamName}</td>
            <td>${employee.positionName}</td>
            <td>${employee.email}</td>
        </tr>
        </c:forEach>
    </table>

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