<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>


<%@ include file ="/WEB-INF/views/include/header.jsp" %>


<% Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	request.setCharacterEncoding("utf-8");
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = nowYear;
	int month = nowMonth;
	int i;
	
	if(strYear != null){
		year = Integer.parseInt(strYear);
	}
	if(strMonth!=null){
		month = Integer.parseInt(strMonth);
	}
	cal.set(year,month-1,1);
	int startDay = 1;
	
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	request.setAttribute("nowYear", nowYear);
	request.setAttribute("nowMonth", nowMonth);
%>
<script type="text/javascript">

function month_onchange(){
	var month = smonth.value;
	var year = syear.value;
	var addr = "calendarMonth.jsp?year="+year+"&month="+month;
	location.href=addr;
}
function year_onchange(){
	var year = syear.value;
	var month = smonth.value;
	var addr = "calendarMonth.jsp?year="+year"&month="+month;
	
	location.href=addr;
}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			Page Header <small>Optional description</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ì»¨íí¸ ë©ì¸ -->
	<section class="content container-fluid">
		
		<table border="1">
			
			<tr>
				<td>
					<label class="switch">
  						<input type="checkbox" checked>
  						<span class="slider round"></span>
  						회사
					</label>

				</td>
				<td>
					<label class="switch">
  						<input type="checkbox" checked>
  						<span class="slider round"></span>
  						부서
					</label>
				</td>
				<td>
					<label class="switch">
  						<input type="checkbox" checked>
  						<span class="slider round"></span>
  						개인
					</label>
				</td>
				<td>
					<input type="button" value="${nowYear-1}년" name="pre_year" onclick="">
				</td>
				<td>
					<input type="button" value="${nowMonth-1}월" name="pre_month">
				</td>
				
				<td>
					<b>&nbsp;
					<input type="text" value="${nowYear}년" size="6" disabled>
					</b>
				</td>
				<td>
					<input type="text" value="${nowMonth}월" size="6" disabled>
				</td>
				<td>
					<input type="button" value="${nowMonth+1}월" name="next_month">
				</td>
				<td>
					<input type="button" value="${nowYear+1}년" name="next_year">
				</td>
		</table>
		
		<table border="1">
		<tr>
			<td width="100" height="100">월</td>
			<td width="100" height="100">화</td>
			<td width="100" height="100">수</td>
			<td width="100" height="100">목</td>
			<td width="100" height="100">금</td>
			<td width="100" height="100">토</td>
			<td width="100" height="100">일</td>
		</tr>
		<%
			int newLine=0;
			out.print("<tr>");
			
			for(i=1;i<week;i++){
				out.print("<td width='100' height='100'>&nbsp;</td>");
				newLine++;
			}
			
			for(i=startDay;i<=endDay;i++){
				
				out.print("<td width='100' height='100'>"+
				"<input type='button' value='"+i+"'></td>");
				newLine++;
				if(newLine==7 && i != endDay){
					out.print("</tr><tr>");
					newLine=0;
				}
			}
			
			while(newLine>0 && newLine<7){
				out.print("<td width='100' height='100'>&nbsp;</td>");
				newLine++;
			}
			out.print("</tr>");
		%>
	</table>
	
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>