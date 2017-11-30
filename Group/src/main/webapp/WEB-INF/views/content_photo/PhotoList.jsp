<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/PhotoList.css"/>'>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐츠 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/photo-camera.png"/>" width="50" height="50"/>
			사진첩 <small>photo</small>
		</h1>
	</section>
	<!-- 컨텐츠 메인 -->
	<section class="content container-fluid">
		<form id="form1" name="form1" method="post">
			<table>


				<tbody>
					<tr>
						<c:forEach var="listview" items="${listview}" varStatus="status">
							<c:url var="link" value="PhotoRead">
								<c:param name="photonum" value="${listview.photonum}" />
							</c:url>

							<td><img
								src="\group\imgUpload\2017\<c:out value="${listview.realname}"/>"
								width="400" height="300" /><br> <c:out value="${listview.writer}"/><a href="${link}"><c:out
										value="${listview.title}" /></a></td>
							<c:if test="${status.count%3 eq 0 || status.last}">
					</tr>
					</c:if>

					</c:forEach>
				</tbody>
			</table>
			<table class="tmptable">
				<tr>
					<td><jsp:include
							page="/WEB-INF/views/common/pagingforSubmit.jsp" /> <a
						href="PhotoForm"><p style="text-align: right">글작성</a></td>
				</tr>
				<tr>
					<td>
						<div>
							<%-- <input type="hidden" name="category1" value="${searchVO.category1}"/>  --%>
							<input type="checkbox" name="searchType" value="title"
								<c:if test="${fn:indexOf(searchVO.searchType, 'title')!=-1}">checked="checked"</c:if> />
							<label class="chkselect" for="searchType1">제목</label> <input
								type="checkbox" name="searchType" value="writer"
								<c:if test="${fn:indexOf(searchVO.searchType, 'writer')!=-1}">checked="checked"</c:if> />
							<label class="chkselect" for="searchType2">작성자</label> <input
								type="text" name="searchKeyword" style="width: 150px;"
								maxlength="50"
								value='<c:out value="${searchVO.searchKeyword}"/>'
								onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
							<input name="btn_search" value="검색" class="btn_sch" type="button"
								onclick="fn_formSubmit()" />


						</div>
					</td>
				</tr>
			</table>
		</form>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
</body>
</html>