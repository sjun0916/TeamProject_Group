<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<link href="${pageContext.servletContext.contextPath}/assets/css/search_employee.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" media="screen" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/assets/jqgrid/css/ui.jqgrid.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/jqgrid/js/jquery.jqGrid.min.js"></script>

 <script type="text/javascript">  
 
 </script>
 <script type="text/javascript">
	function makeTeamList(selectTagId){
	
	$.ajax({
		url: "/group/api/user/getTeamList",
		type: "get",
		dataType: "json",
		data:"",
		success: function( response ) {
			if( response.result != "success" ) {
				console.log( response.message );
				return;
			}
			
			$.each( response.data, function(index, vo){
				$('#'+selectTagId).append("<option value="+vo.teamId+">"+vo.teamName+"</option>");
			});
		}
	});
	
}


/**
 * 직급 리스트를 받아오는 함수
 * 파라미터는 select 아이디.
 */
function makePositionList(selectTagId){
	
	$.ajax({
		url: "/group/api/user/getPositionList",
		type: "get",
		dataType: "json",
		data:"",
		success: function( response ) {
			if( response.result != "success" ) {
				console.log( response.message );
				return;
			}
			
			$.each( response.data, function(index, vo){
				$('#'+selectTagId).append("<option value="+vo.positionId+">"+vo.positionName+"</option>");
			});
		}
	});
	
}

var dialog, form;
function initGrid() {
     
    $("#list").jqGrid({
        //로컬그리드이용
        datatype: "local",
        //그리드 높이
        height: 700,
        //컬럼명들
        colNames:['사진','이름', '소속', '직급','이메일'],
        //컬럼모델
        colModel:[
            {name:'imageUrl',align:"center",formatter:imageFormatter},
            {name:'employeeName',align:"center",width:100},
            {name:'teamName',align:"center"},
            {name:'positionName',align:"center"},
            {name:'email',align:"center",width:200},
//            {name:'IDX', index:'IDX',align:"center", width:100,formatter:sendmessageButton },
        ],
        width:1500,
        //그리드타이틀
        caption: "사원목록"
    });
}



function imageFormatter(cellvalue, options, rowObject)
{
    return '<img src="' +getContextPath()+ rowObject.imageUrl + '" />';
}

function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
function loadEmployeeData() {
	
	var gridData;
	//그리드의 데이터를 비우고
	var trf = $("#list tbody:first tr:first")[0];
	$("#list tbody:first").empty().append(trf);
	
	
	var params = jQuery("#searchEmployeeForm").serialize();
	$.ajax({
		
		 url:'/group/searchemployee',
		type:'POST',
		data:params,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        dataType: 'json',
		success:function(responseData,status) {
			console.log(responseData);
			
		    for(var i=0;i<=responseData.data.length;i++){
	            $("#list").jqGrid('addRowData',i+1,responseData.data[i]);
	    }
		    
		},
		complete: function() {			
		}
	});
	
	
}

 $(function(){

		initGrid();
		
		$('#teamId').append("<option value=''>전체</option>");
		makeTeamList('teamId');
		loadEmployeeData();
		
		$("#searchEmployeeButton").click(function(){  
			loadEmployeeData();
		});  
		
})



</script>
</head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			Page Header <small>Optional description</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		 <div class="wrap">
	    	<form id="searchEmployeeForm" name="searchEmployeeForm">
				<table id="searchEmployeeTable">
					<tbody>
					<tr >
						<th scope="row" >팀명</th>
						<td colspan="2">
							<select id="teamId" name="teamId" style="width:178.4px; HEIGHT:17.6px">
							</select>
						</td>
						<th scope="row" >이름</th>
						<td colspan="2">
							<input type="text" size=30  id="employeeName" name="employeeName">							
						</td>
						<td>
							<button type="button" class="search" id="searchEmployeeButton" tabindex="3">검색</button>
						</td>
					</tr>					
					</tbody>					
				</table>
			</form>
		</div>

		<div id="list_div">
			<table id="list"></table>

		</div>

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>