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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/message.js" type="text/javascript"></script>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			쪽지 <small>ㅋㅋㅋㅋ</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

			
			<h2>메일 리스트</h2>

<table class="board_list">
	<colgroup>
		<col width="10%" />
		<col width="*" />
		<col width="15%" />
		<col width="20%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">메일번호</th>
			<th scope="col">받은사람</th>
			<th scope="col">내용</th>
			<th scope="col">보낸시간</th>

		</tr>
	</thead>
	<tbody>
		        <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list }" var="row">
                       
                        <tr>
                            <td>${row.mailNum }</td>
                            <td>${row.senderMail }</td>
                            <td class="title">
                                <a href="${pageContext.request.contextPath }/content_mail/view?mailNum=${row.mailNum}">
                                
							          <c:choose>
							           <c:when test="${fn:length(row.content) > 23}">
							            <c:out value="${fn:substring(row.content,0,23)}"/>....
							           </c:when>
							           <c:otherwise>
							            <c:out value="${row.content}"/>
							           </c:otherwise> 
							          </c:choose>
								
                                </a>
                                <input type="hidden" id="IDX" value="temp">
                            </td>
                            <td>${row.writeDate }</td>
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
<br />

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>