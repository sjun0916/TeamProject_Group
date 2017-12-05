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
<link rel="stylesheet" type="text/css" media="screen" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/assets/jqgrid/css/ui.jqgrid.css" />

<meta http-equiv="content-type" content="text/html; charset=utf-8">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/assets/js/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/assets/js/message.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<style>
.sjgfont {
	font-weight: 700;
}

.modalscroll {
	width: 41em;
	height: auto;
	line-height: 2em;
	/* border: 1px solid #ccc; */
	padding: 0;
	margin: 0;
	overflow: auto;
	overflow-x: hidden;
}

.label {
	font-weight: 700;
	line-height: 1;
	white-space: nowrap;
	vertical-align: baseline;
	text-align: center;
}

.checked {
	color: #3bc1c5 !important;
	border: 2px solid #3bc1c5 !important;
	font-weight: 700;
}

.panel-label {
	display: inline-block;
	max-width: 77px;
	padding: 0 3px;
	line-height: 20px;
	font-size: 12px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/note.png"/>" width="50" height="50"/>
			쪽지 <small>message</small>
		</h1>

	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		 <div id="sendForm" title="메세지 전송">
  <form>
    <fieldset>
      <label for="name">전송할 내용을 입력하세요</label>
      <input type="hidden" name="receiverEmployeeNo" id="receiverEmployeeNo">
      <input type="hidden" id="senderemployeeNo" value="${authUser.employeeNo}">
 	  <textarea id = "messageArea" rows="12" cols="41" name="contents"></textarea>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
		</div>

<!-- /.box-header -->
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">쪽지함</h3>

				<div class="box-tools" style="padding: 0px; text-align: right; float: left">


					 <div class="input-group input-group-sm" style="width: 150px;">

					</div>
				</div>
			</div>


			<div class="box-body table-responsive no-padding">
				<table class="table table-hover">
					<tbody>
						<tr align="center">
							<th width="5%"><input type="checkbox" name="firstbox" id="checkAll" value="" /></th>
							<th width="10%">발신자(사원번호)</th>
							<th width="55%">메세지 내용</th>
							<th width="10%">수신시간</th>
							<th width="10%">답장</th>
							<th width="10%">삭제</th>
						</tr>
						<c:choose>
               			<c:when test="${fn:length(list) > 0}">
                    	<c:forEach items="${list }" var="row">
							<tr>
								<td><input type="checkbox" name="box" value="${row.sender}" /></td>
								<td>${row.sender }</td>
								<td>
								<a href="${pageContext.request.contextPath }/message/view?messageId=${row.messageId}">
                                
							          <c:choose>
							           <c:when test="${fn:length(row.message) > 23}">
							            <c:out value="${fn:substring(row.message,0,23)}"/>....
							           </c:when>
							           <c:otherwise>
							            <c:out value="${row.message}"/>
							           </c:otherwise> 
							          </c:choose>
								
                                </a>
                                <input type="hidden" id="IDX" value="temp">
								</td>
								<td>${row.writeDate }</td>
								<td><button id="sendMessageButton" class="btn btn-primary btn-xs" onclick="openForm('${row.sender}')">답장</button></td>
								<td><button id="deleteMessageButton" class="btn btn-primary btn-xs" onclick="deleteMessage('${row.messageId}')">삭제</button></td>
							</tr>
						</c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6">수신한 쪽지가 존재하지 않습니다</td>
                    </tr>
                </c:otherwise>
            </c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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