<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>

<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file ="/WEB-INF/views/include/header.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- contents header -->
	<section class="content-header">
		<h1>
			Calendar <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/home"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>
	<script>
		function goTo()
		{
		  document.getElementbyId("monthView").submit();
		}
	</script>
	<!-- inputGroup -->
	
<!-- 	<section class="content container-fluid"> -->
<!-- 		<h2>Text</h2> -->
<!-- 	</section> -->

	<!-- Main content -->
	
	<section class="content">
		<div class="row">

			<div class="col-md-3">

				<div class="box box-solid">
					<form>
						<input type="submit" id="oksign" style="display: none;">
					</form>
					
			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
					
						<!-- THE CALENDAR -->
						<div id="calendar">
						<form id="monthView" name="monthView">
							<table>
								<tr>
									<td>
										<input type="checkbox" name="kind" value="1" checked="checked">회사&nbsp;
										<input type="checkbox" name="kind" value="2" checked="checked">부서&nbsp;
										<input type="checkbox" name="kind" value="3" checked="checked">개인
									</td>
								</tr>
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
								       
								        <td width="73%" align="center"><h3>&nbsp;${iYear}-${iMonth}&nbsp;</h3></td>
								        
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
								    <td><!-- ? --><table border="1">
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
<!-- 								        				a link : daylist -->
<%-- 															<a href="<c:url value="calendar/daylist"> --%>
<%-- 																<c:param name="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"></c:param> --%>
<%-- 															</c:url>" onclick="goTo()"> --%>
<%-- 															<c:import url="daylist"/> --%>
<%-- 															<c:set var="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"/> --%>
<%-- 															<input type="hidden" name="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"> --%>
<%-- 															<c:out value="${date}"/> --%>
<%-- 															<% session.setAttribute("date", "${iYear}${iMonth}${cnt-weekStartDay+1}"); %> --%>
															
									        				<span>${cnt-weekStartDay+1}</span><br>
<%-- 									        				<c:if test="${event != 'null'}"> --%>
<%-- 										        				<c:forEach var="map" items="${event}" varStatus="event"> --%>
<%-- 										        					<c:set var="number" value="${cnt-weekStartDay+1}"/> --%>
<%-- 										        					<c:if test="${map.key == number}"> --%>
<%-- 											        					<span><small>${map.value}</small></span><br> --%>
<%-- 											        				</c:if> --%>
<%-- 										        				</c:forEach> --%>
<%-- 									        				</c:if> --%>
<!-- 									        				kind:1 / kind:2 / kind:3 -->
<!-- 								        				</a> -->
								        				
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
					</div>
					<!-- /.box-body -->
				</div>
<!-- 				/. box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		</div>
	</section>
	<!-- /.content -->
	<div class="example-modal">
        <div class="modal" id="myModal3" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="disable()">
                  <span aria-hidden="true" onclick="disable()" >&times;</span></button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body" style="min-height: 300px; max-height: 763px;">
              	<div class="form-group">
              	    <label>분류:</label>
						<select disabled="">
							<option value="1">전체</option>
							<option value="2">부서</option>
							<option value="3" selected>개인</option>
						</select>

                </div>
                <!-- /.input group -->
                <div class="form-group">
                <label>기간</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-clock-o"></i>
                  </div> 
					<!-- id="reservationtime2" -->
					시작 날짜<br>
					<input type="date" class="form-control pull-right" id="startDate" disabled=""><br>
					종료 날짜<br>
					<input type="date" class="form-control pull-right" id="endDate" disabled=""><br>
                </div>
                <!-- /.input group -->
              </div>
                  <label>내용</label>
                  <textarea id="cont" class="form-control" rows="3" placeholder="내용 입력" disabled=""></textarea>
              </div>
              <div class="modal-footer"> 
                <input type="button" style="width: 25%" id="modify" class="btn btn-primary" onclick="edit()" value="수정">
                <input type="button" style="width: 25%" id="delte" class="btn btn-primary" onclick="remove()" value="삭제" />
                <button type="button" style="width: 25%" class="btn btn-secondary" data-dismiss="modal" onclick="disable()" >닫기</button>
             
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
<!--           /.modal-dialog -->
        </div>
<!--         /.modal -->
      </div>

	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>