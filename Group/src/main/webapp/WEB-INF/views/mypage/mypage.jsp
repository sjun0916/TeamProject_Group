<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<!-- 회원수정 -->
<head>
<title>Smart-Groupware</title>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/mypage.js" type="text/javascript"></script>

 <script type="text/javascript">  
 
 </script>
 </head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			정보 수정 <small>info update</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		 <form  name="loginform" method="post" action="${pageContext.servletContext.contextPath }/mypage/modify" enctype="multipart/form-data" >

			<p>
			</p>
			<div id="menu2">
				<hr>
				<p>사번 : <input type="text" name="employeeNo1" value="${authUser.employeeNo}" disabled> 
					<input type="hidden" name="employeeNo" value="${authUser.employeeNo}" ></p>
				<hr>
				<p>비밀번호 : <input type="password" name="password" /> </p>
				<hr>
				<p>사진업로드 : <input type="file" name="file" value="${authUser.imageUrl}"></p>
				<hr>
				<p>이름 : <input type="text" name="employeeName" value="${authUser.employeeName}"/></p>
				<hr>
				<p>소속 : <input type="text" name="teamName" value="${authUser.teamName}"  disabled></p>
				<hr>
				<p>이메일 : <input type="text" name="email" value="${authUser.email}" /></p>
				<hr>
				<p>직급 : <input type="text" name="positionName" value="${authUser.positionName}" disabled > </p>
				<hr>
				<hr><hr><hr>
				<button id="submit" style="width:160.8px; HEIGHT:22PX">변경하기</button>
				<hr><hr><hr>
				<hr><hr><hr>
				<hr><hr>
			</div>
		</form>

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>