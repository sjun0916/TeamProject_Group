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
%>
<script type="text/javascript">

function month_onchange(){
	var month = smonth.value;
	var year = syear.value;
	var addr = "NewFile.jsp?year="+year+"&month="+month;
	location.href=addr;
}
function year_onchange(){
	var year = syear.value;
	var month = smonth.value;
	var addr = "NewFile.jsp?year="+year"&month="+month;
	
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
		
		<table>
			
			<tr>
				<td>
					<input type="button" value="회사" name="company">&nbsp;
				</td>
				<td>
					<input type="button" value="부서" name="class">&nbsp;
				</td>
				<td>
					<input type="button" value="개인" name="personal">
				</td>
				
				<td>
					<b>&nbsp;
					<select id="syear" onchange="year_onchange()">
					<%for(i=2015;i<=2025;i++) {%>
						<option><% out.print(i+"년");%></option>
						<%} %>
					</select>
					</b>
				</td>
				<td>
					<b>&nbsp;
					<select id="smonth" onchange="month_onchange()" >
					<%for(i=1;i<=12;i++){ %>
						<option><%out.print(i+"월"); %></option>
					<%} %>
					</select>
					</b>
				</td>
		</table>
		
		<table>
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
				
				out.print("<td width='100' height='100'>"+i+"</td>");
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