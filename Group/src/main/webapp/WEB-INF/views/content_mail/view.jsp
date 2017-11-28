<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<title>Smart-Groupware</title>
<head>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
 <%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			메일내용 <small>ㄴㅁ</small>
		</h1>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		 <form name="boardWriteForm" method="post" action="${pageContext.servletContext.contextPath }/board/write">
			<table class="board_view">
				<colgroup>
					<col width="15%">
					<col width="*" />
				</colgroup>
				<tbody>

					<tr>
						<th scope="row" >제목</th>
						<td><input id="contentTitle" class="wdp_90" value="${title}"  readonly style="border:0px;"></input></td>
					</tr>
					<tr>
						<td colspan="2" class="view_text"><textarea rows="20"
								cols="110" title="내용" id="contentContent" name="contentContent" readonly>${content}</textarea></td>
					</tr>

				</tbody>

			</table>
			<input type="hidden" id="employeeNo" name="employeeNo" value=${authUser.employeeNo }>
			<input type="hidden" id="teamId" name="teamId" value=${authUser.teamId }>
			<input type="hidden" id="boardId" name="boardId" value=${boardId }>
			<div class="right">
					<button type="button"  onClick="history.back();">돌아가기</button>
			</div>
				<span>
				</span>
		</form>

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>