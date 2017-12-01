<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/message.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/email_3.png"/>" width="50" height="50"/>
			받은메일함 <small>receive mail &nbsp;&nbsp;&nbsp;/받은 메일은 google에서도 확인 가능합니다.</small>
		</h1>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">
	
	<input type="hidden" name="receiverEmail" id="receiverEmail">
      <input type="hidden" id="senderEmail" value="${authUser.email}">
			
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">메일함</h3>

				<div class="box-tools" style="padding: 0px; text-align: right; float: left">

					 <div class="input-group input-group-sm" style="width: 150px;">

					</div>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body table-responsive no-padding">
			<form id="form1" name="form1" method="post">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th width="10%">메일번호</th>
							<th width="15%">보낸사람</th>
							<th width="60%">제목</th>
							<th width="15%">받은시간</th>
						</tr>

						<c:choose>
                			<c:when test="${fn:length(list) > 0}">
                    		<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.mailNum }</td>
								<td>${row.senderMail }</td>
								<td class="title"> <a href="${pageContext.request.contextPath }/mail/view?mailNum=${row.mailNum}">
                                
							          <c:choose>
							           <c:when test="${fn:length(row.title) > 23}">
							            <c:out value="${fn:substring(row.title,0,23)}"/>....
							           </c:when>
							           <c:otherwise>
							            <c:out value="${row.title}"/>
							           </c:otherwise> 
							          </c:choose>
								
                                </a>
                                <input type="hidden" id="IDX" value="temp"></td>
								<td>${row.regdate }</td>
							</tr>
						</c:forEach>
						</c:when>
          			    <c:otherwise>
                   			 <tr>
                        		<td colspan="5">수신한 메일이 존재하지 않습니다.</td>
                    		</tr>
                		</c:otherwise>
            		</c:choose>
					</tbody>
				</table>
				<div class="box-footer">
                <button type="button" class="btn btn-primary pull-right btn-sm" onclick="location.href='/group/mail'">메일쓰기</button>
            	</div>
				<table class="tmptable" width="100%">
				<tr>
					<td colspan="7" align="center"><jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" /></td>
				</tr>
			</table>
			<br>
		</form>
			</div>

		</div>
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