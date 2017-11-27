<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Smart-Groupware</title>
<head>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
</head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 1126px; text-align: center;">
    <!-- Main content -->
    <section class="content" class="center">

      <div class="row center" style="margin : auto;">
        <div class="col-md-12" style="margin : auto;">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Check Mail</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
					<form:form commandName="checkcheck">
						<br><br><br>
						<c:if test="${result eq 'success'}" >
						<p> 요청하신 메일이 성공적으로 발송 되었습니다. </p>
						<img src="<c:url value="/resources/icon/mailOK.png"/>" width="35" height="35"/>
						<br><br>
						<a href="${pageContext.request.contextPath}/home"> 홈 이동 </a>
						</c:if>
						<c:if test="${result eq 'fail'}" >
						<img src="<c:url value="/resources/icon/mailfail.png"/>" width="35" height="35"/>
						<br><br><br>
						<p> 발송에 실패했습니다. 구글 계정을 다시 확인 해주세요 </p>
						<br><br>
						<a href="${pageContext.request.contextPath}/mail"> 다시시도 </a>
						</c:if>
						
						<br><br><br><br><br><br><br><br><br><br><br><br>
						
					</form:form>              		
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>