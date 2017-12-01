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
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/mypage.js" type="text/javascript"></script>
<script type="text/javascript">  
</script>
<script type="text/javascript">
	function passwordCheck(){
		var pass2 ="";
		if(document.mypage.password2.value != ${authUser.password}){
			alert("현재 비밀번호가 맞지 않습니다.");
			document.mypage.password2.focus();
			return
		}
		document.mypage.submit();
	}
</script>
 
 </head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/contract.png"/>" width="50" height="50"/>
			마이페이지 <small>mypage</small>
		</h1>

	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	
	<section class="content container-fluid">
	<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Info Update</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form  name="mypage" class="form-horizontal" method="post" action="${pageContext.servletContext.contextPath }/mypage/modify" enctype="multipart/form-data" >
              <div class="box-body">
                <div class="form-group">
                  <label for="team" class="col-sm-2 control-label">프로필 사진</label>
                  <div class="col-sm-10">
                    <c:choose>
					<c:when test="${authUser.imageUrl!=null}">
					<img src="\group\profileImg\<c:out value="${authUser.imageUrl}"/>"
					class="img-circle" alt="User Image" width="50" height="50">
					</c:when>
					<c:otherwise>
					<img src="${pageContext.request.contextPath}/resources/icon/person.png" class="img-circle" alt="User Image" width="50" height="50">
					</c:otherwise>
					</c:choose>
                  </div>
                </div>
                <div class="form-group">
                  <label for="imageUrl" class="col-sm-2 control-label">사진 변경</label>
                  <div class="col-sm-10">
                    <input type="file" name="file" id="imageUrl" value="<c:out value="${authUser.imageUrl}"/>">
                  </div>
                </div>
                <hr>
                <div class="form-group">
                  <label for="employeeNo" class="col-sm-2 control-label">사원번호</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="employeeNo" name="employeeNo" value="<c:out value="${authUser.employeeNo}"/>" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label for="teamName" class="col-sm-2 control-label">부서</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="teamName" name="teamName" value="<c:out value="${authUser.teamName}"/>" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label for="positionName" class="col-sm-2 control-label">직급</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="positionName" name="positionName" value="<c:out value="${authUser.positionName}"/>" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label for="employeeName" class="col-sm-2 control-label">이름</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="employeeName" name="employeeName" value="<c:out value="${authUser.employeeName}"/>" >
                  </div>
                </div>
                <div class="form-group">
                  <label for="email" class="col-sm-2 control-label">이메일</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="email" name="email" value="<c:out value="${authUser.email}"/>" >
                  </div>
                </div>
                <div class="form-group">
                  <label for="password2" class="col-sm-2 control-label">현재 비밀번호</label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="password2" name="password2" >
                  </div>
                </div>
                <div class="form-group">
                  <label for="password" class="col-sm-2 control-label">새로운 비밀번호</label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" >
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer ">
              	<button type="button" class="btn btn-default" onClick="history.back();">돌아가기</button>
                <button type="button" class="btn btn-info pull-right" onClick="passwordCheck()">변경하기</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>

	</section>
	
	
	
	
<!-- 	<section class="content container-fluid"> -->

<%-- 		 <form  name="loginform" method="post" action="${pageContext.servletContext.contextPath }/mypage/modify" enctype="multipart/form-data" > --%>

<!-- 			<p> -->
<!-- 			</p> -->
<!-- 			<div id="menu2"> -->
<!-- 				<hr> -->
<%-- 				<p>사번 : <input type="text" name="employeeNo1" value="${authUser.employeeNo}" disabled>  --%>
<%-- 					<input type="hidden" name="employeeNo" value="${authUser.employeeNo}" ></p> --%>
<!-- 				<hr> -->
<!-- 				<p>비밀번호 : <input type="password" name="password" /> </p> -->
<!-- 				<hr> -->
<%-- 				<p>사진업로드 : <input type="file" name="file" value="${authUser.imageUrl}"></p> --%>
<!-- 				<hr> -->
<%-- 				<p>이름 : <input type="text" name="employeeName" value="${authUser.employeeName}"/></p> --%>
<!-- 				<hr> -->
<%-- 				<p>소속 : <input type="text" name="teamName" value="${authUser.teamName}"  disabled></p> --%>
<!-- 				<hr> -->
<%-- 				<p>이메일 : <input type="text" name="email" value="${authUser.email}" /></p> --%>
<!-- 				<hr> -->
<%-- 				<p>직급 : <input type="text" name="positionName" value="${authUser.positionName}" disabled > </p> --%>
<!-- 				<hr> -->
<!-- 				<hr><hr><hr> -->
<!-- 				<button id="submit" style="width:160.8px; HEIGHT:22PX">변경하기</button> -->
<!-- 				<hr><hr><hr> -->
<!-- 				<hr><hr><hr> -->
<!-- 				<hr><hr> -->
<!-- 			</div> -->
<!-- 		</form> -->

<!-- 	</section> -->
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>