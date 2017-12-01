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
		        <td width="6%">Year&nbsp;</td>
		        <td width="7%">
				<!-- start year and end year in combo box to change year in calendar -->
				<select name="iYear" onchange="submit()">
			        <c:forEach var="iy" begin="${iTYear-5}" end="${iTYear+10}" step="1" varStatus="loop">
			        	<c:choose>
					    	<c:when test="${loop.index == iYear}">
				    			<option value="${loop.index}" selected>${loop.index}</option>
				    		</c:when>
							<c:otherwise>
								<option value="${loop.index}">${loop.index}</option>	
							</c:otherwise>
						</c:choose>
					</c:forEach>
			   </select>&nbsp;&nbsp;</td>
				       
	        <td width="73%" align="center"><h3>&nbsp;${iYear}년 ${iMonth}월&nbsp;</h3></td>
				        
		        <td width="6%">Month&nbsp;</td>
		        <td width="8%">
									
				<!-- print month in combo box to change month in calendar -->
				<select name="iMonth" onchange="submit()">
					<c:forEach var="im" begin="1" end="12" step="1" varStatus="loop">
						<c:choose>
						   	<c:when test="${loop.index == iMonth}">
						  		<option value="${loop.index}" selected>${loop.index}</option>
						   	</c:when>
							<c:otherwise>
								<option value="${loop.index}">${loop.index}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select></td>
			 </tr>
    		</table></td>
  		</tr>
  							
		<tr>
			<td><table>
					<tbody>
					<tr>
						<th>Sun</th>								          
						<th>Mon</th>
						<th>Tue</th>
						<th>Wed</th>
						<th>Thu</th>
						<th>Fri</th>
						<th>Sat</th>
					</tr>
					<c:set var="cnt" value="1"/>
					<c:forEach var="i" begin="1" end="${iTotalweeks}" step="1" varStatus="loop">
						<tr>
							<c:forEach var="j" begin="1" end="7" step="1" varStatus="loop2">
								<c:choose>
									<c:when test="${cnt<weekStartDay || (cnt-weekStartDay+1)>days}">
										<td align="center" height="35">&nbsp;</td>
									</c:when>
									<c:otherwise>
										<td align="center" height="35" id="day_${cnt-weekStartDay+1}">
											<span>${cnt-weekStartDay+1}</span><br>
										</td>
	      							</c:otherwise>
								</c:choose>
								<input type="hidden" value="${cnt=cnt+1}">
							</c:forEach>
						</tr>
					</c:forEach>
					</tbody>
				</table></td>
			</tr>
		</table>
	</form>
</div>