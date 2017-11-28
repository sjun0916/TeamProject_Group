<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			공지사항 <small>Photo</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ì»¨íí¸ ë©ì¸ -->
	<section class="content container-fluid">
		<table border="1" style="width: 600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='20%'/>
				<col width='*%'/>
				<col width='20%'/>
			</colgroup>
			<tbody>
				<tr>
					<td>[<c:out value="${photoInfo.departname}" />게시글]
					</td>
					<td><c:out value="${photoInfo.title}" /></td>
					<td><c:out value="${photoInfo.regdate}" /></td>
				</tr>
				<tr>
					<td colspan="2">작성자:[<c:out value="${photoInfo.writerpos}" />]<c:out
							value="${photoInfo.writer}" /></td>
					<td>
							<c:forEach var="listview" items="${listview}" varStatus="status">
								<a
									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach>
						</td>
				</tr>

			
			</tbody>
		</table>
		<a href="PhotoList">돌아가기</a> 
 		<c:if test="${authUser.role == 'ADMIN'}">
		<a href="PhotoDelete?photonum=<c:out value="${photoInfo.photonum}"/>">삭제</a>
		<a href="PhotoForm?photonum=<c:out value="${photoInfo.photonum}"/>">수정</a>
		</c:if>
		
			
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>
