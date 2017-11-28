<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<script>
	
	/* 검색 페이지  */
	$(document).on('click','#searchBtn',function(){
		var formData = $('#apRequirement').serialize();
		console.log(formData)
		$('#originalContent').empty();
		$('#apContent').empty();
		$.ajax({
			url : '/smart/ap/searchDft',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('test');
				console.log(data[0].dftTitle)
				$.each(data, function(i,serachList){
					$('#apContent').append(`
							<tr>
								<td>`+serachList.dftCode+`</td>
								<td><a href="<c:url value='/ap/Content?dftCode=`+serachList.dftCode+`'/>">`+serachList.dftTitle+`</td>
								<td>`+serachList.docFileGroup+`</td>
								<td>`+serachList.mmName+`</td>
								<td>`+serachList.pMmName+`</td>
								<td>`+serachList.dftDate+`</td>
								<td>`+serachList.proRealTime+`</td>
								<td>`+serachList.dftFinalState+`</td>
							</tr>
							`)
				}) 
			}
		})
	})
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#approval').css('display','');
	});
	
	//패널 검색폼 여닫기 이벤트 핸들러
	$(document).on('click', '.panel-heading span.clickable', function(e){
	    var $this = $(this);
		if(!$this.hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideUp();
			$this.addClass('panel-collapsed');
			$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
		} else {
			$this.parents('.panel').find('.panel-body').slideDown();
			$this.removeClass('panel-collapsed');
			$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
		}
	})
	
	</script>
	
</head> 
<c:import url="../mainIndex.jsp"></c:import>
<body>
<!-- 본문 -->
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">결제대기목록</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">결제문서검색</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline" id="apRequirement">
					<div class="form-group">
						<label for="docFileGroup">분류</label>
						<select name="docFileGroup" class="form-control">
							<option value="문서없음">::분류::</option>
							<c:forEach var="docList" items="${docList}">
								<option value ="${docList.docFileGroup}">${docList.docFileGroup}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="dftDegree">차수</label>
						<select name="dftDegree" class="form-control">
							<option value="0">::차수::</option>
							<option value="1">1차</option>
							<option value="2">2차</option>
							<option value="3">3차</option>
						</select>
					</div>
					<div class="form-group">
						<label for="proState">진행상황</label>
						<select name="proState" class="form-control">
							<option value="3">::진행상황::</option>
							<option value="0">대기</option>
							<option value="2">반려</option>
							<option value="1">완료</option>
						</select>
					</div>
					
					<button type="button" class="btn-success btn-lg" id="searchBtn">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<p style="color:red;">*버튼을 클릭하시면 조건별로 리스트를 확인하실수 있습니다!!</p>
	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/ap/list?apProgress=1'/>" class="btn btn-info">
			<span class="glyphicon glyphicon-search"></span> 결재 대기 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=2'/>" class="btn btn-info">
			<span class="glyphicon glyphicon-play"></span> 결재 반려 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=3'/>" class="btn btn-info">
			<span class="glyphicon glyphicon-check"></span> 결재 완료 목록
		</a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>기안번호</th>
				<th>결재명</th>
				<th>기안분류</th>
				<th>기안자</th>
				<th>결재자</th>
				<th>기안등록일자</th>
				<th>최근결재일자</th>
				<th>결재진황현황</th>				
			</tr>
		</thead>
		
		<tbody id="apContent">
		
		</tbody>
		
		<tbody id="originalContent" >
			<c:forEach var="pgList" items="${pgList}">
				<tr>
					<input type="hidden" id="dftCode" value="${pgList.dftCode}"/>
					<td>${pgList.dftCode}</td>
					<td><a href="<c:url value='/ap/Content?dftCode=${pgList.dftCode}' />">${pgList.dftTitle}</a></td>
					<td>${pgList.docFileGroup}</td>
					<td>${pgList.mmName}</td>
					<td>${pgList.pMmName}</td>
					<td>${pgList.dftDate}</td>
					<td>${pgList.proRealTime}</td>
					<td>${pgList.dftFinalState}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 본문 -->

<%-- <div class="container">
	
	<center>
		<h2><span class="glyphicon glyphicon-file"></span> 결재 목록</h2>
	</center>
	<hr/>
	<!-- 검색조건 -->
	<form class="form-inline" id="apRequirement">
		<div class="form-group">
			<label for="docFileGroup">분류</label>
			<select name="docFileGroup">
				<option value="문서없음">::분류::</option>
				<c:forEach var="docList" items="${docList}">
					<option value ="${docList.docFileGroup}">${docList.docFileGroup}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="dftDegree">차수</label>
			<select name="dftDegree">
				<option value="0">::차수::</option>
				<option value="1">1차</option>
				<option value="2">2차</option>
				<option value="3">3차</option>
			</select>
		</div>
		<div class="form-group">
			<label for="proState">진행상황</label>
			<select name="proState">
				<option value="3">::진행상황::</option>
				<option value="0">대기</option>
				<option value="2">반려</option>
				<option value="1">완료</option>
			</select>
		</div>
		
		<button type="button" class="btn btn-primary" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
	</form>
	
	<hr/>

	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/ap/list?apProgress=1'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-search"></span> 결재 대기 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=2'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-play"></span> 결재 반려 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=3'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-check"></span> 결재 완료 목록
		</a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>기안번호</th>
				<th>결재명</th>
				<th>기안분류</th>
				<th>기안자</th>
				<th>결재자</th>
				<th>기안등록일자</th>
				<th>최근결재일자</th>
				<th>결재진황현황</th>				
			</tr>
		</thead>
		
		<tbody id="apContent">
		
		</tbody>
		
		<tbody id="originalContent" >
			<c:forEach var="pgList" items="${pgList}">
				<tr>
					<input type="hidden" id="dftCode" value="${pgList.dftCode}"/>
					<td>${pgList.dftCode}</td>
					<td><a href="<c:url value='/ap/Content?dftCode=${pgList.dftCode}' />">${pgList.dftTitle}</a></td>
					<td>${pgList.docFileGroup}</td>
					<td>${pgList.mmName}</td>
					<td>${pgList.pMmName}</td>
					<td>${pgList.dftDate}</td>
					<td>${pgList.proRealTime}</td>
					<td>${pgList.dftFinalState}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
 --%>

 
<c:import url="./ap_comPrint.jsp"></c:import> <!--팝업창 --> 
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>