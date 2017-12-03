<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
<!--

//-->
var date = ${iYear}${Month}${iTDay};


$.ajax({
	type:"POST",  
    url:'${pageContext.request.contextPath}/calendar/dayList',
    data : date,
    dataType : 'json',
    success:function(data){
    	var state =data.state;
        var datainfo = data.select;
        if(state="success"){
        	alert("수정성공");
        }else{
          	alert("수정실패");
        }
    }, 
    error:function(e){  
     	alert("수정실패");  
    }  
});
</script>
<div id="calendar">
	<form id="monthView" name="monthView">
		<table>
		  <tr>
		    <td><table>
		      <tr>
		        <td width="6%">Year&nbsp;</td>
		        <td width="73%" rowspan="2" align="center"><h3><label>${iYear}년 ${iMonth}월 ${iTDay}일</label></h3></td>
				<td width="6%">Month&nbsp;</td>
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
						<c:forEach>
						<tr>
						</tr>
						</c:forEach>
						
					</tbody>
				</table></td>
			</tr>
		</table>
	</form>
</div>