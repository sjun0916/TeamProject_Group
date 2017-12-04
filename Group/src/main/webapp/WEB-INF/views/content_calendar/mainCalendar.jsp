<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="calendar">
	<form id="monthView" name="monthView">
		<table>
		  <tr>
		    <td><table>
		      <tr>
<!-- 		        <td width="6%">Year&nbsp;</td> -->
		        <td width="73%" rowspan="2" align="center"><h3><label>${iYear}년 ${iMonth}월 ${iDay}일</label></h3></td>
<!-- 				<td width="6%">Month&nbsp;</td> -->
		      </tr>
    		</table></td>
  		</tr>
<!--   		일정목록		 -->
		<tr>
			<td><table><style>align-content: center;</style>
					<tbody>
						<tr>
							<th>분류</th>
							<th>제목</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
						<c:if test="${calList}==null">오늘 일정이 없습니다.</c:if>
						<c:forEach var="calList" items="${calList}" varStatus="status">
							<tr>
								<td><c:out value="${calList.calendar_kind}"/></td>
								<td><c:out value="${calList.calendar_title}"/></td>
								<td><c:out value="${calList.calendar_cont}"/></td>
								<td><c:out value="${calList.calendar_start}"/>-<c:out value="${calList.calendar_end}"/></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table></td>
			</tr>
		</table>
	</form>
</div>