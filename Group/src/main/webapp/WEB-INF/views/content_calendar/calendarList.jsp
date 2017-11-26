<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page session="false" %> --%>
<table>
<!-- 	output : date -->
	<tr>
		<th>분류</th>
		<th>제목</th>
	</tr>
	<c:choose>
		<c:when test="${doList == null}">일정이 없습니다.</c:when>
		<c:otherwise>
			<c:forEach var="list" items="${doList}" varStatus="loop">
				<tr>
					<td>${list.kind}</td>
					<td><a href="<c:url value="/calendar/addDoList"/>">
						<input type="hidden" name="schedule" value="${list.calNum}">
							${list.title}
					</a></td>
				</tr>		
			</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
<input type="button" value="추가">