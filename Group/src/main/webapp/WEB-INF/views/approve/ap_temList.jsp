<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<script>
	/* 임시목록 검색페이지 */
	$(document).on('click','#docSearchBtn', function(){
		var formData = $('#docRequirement').serialize();
		console.log('h1: '+formData);
		$('#originalContent').empty();
		$('#searchTem').empty();
		$.ajax({
			url : '/smart/ap/searchTem',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('임시')
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
		<li class="active">임시문서함</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">임시문서함</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline" id="docRequirement">
					<div class="form-group">
						<label for="docFileGroup">분류</label>
						<select name="docFileGroup" class="form-control">
							<option value="0">::분류::</option>
							<c:forEach var="docList" items="${docList}">
								<option value ="${docList.docFileGroup}">${docList.docFileGroup}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="dftCode">문서번호</label>
						<input type="text" class="form-control" name="dftCode" default="0">						
					</div>
					
					<button type="button" class="btn-success btn-lg" id="docSearchBtn">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</form>
				<label class="control-label"><b>저장 목록 [건수 : 10건]</b></label>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>차수</th>
							<th>구분</th>
							<th width="200">문서제목</th>
							<th>기안자</th>
							<th>기안부서</th>
							<th>신청일자</th>
							<th>파일명</th>
						</tr>
					</thead>
					
					<tbody id="searchTem">
					
					</tbody>
					
					<tbody id="originalContent">
						<c:forEach var="t" items="${temList}">
						<tr>
							<td>${t.dftCode}</td>
							<td>${t.docFileGroup}</td>
							<td><a href="<c:url value='/ap/temContent?dftCode=${t.dftCode}' />">${t.dftTitle}</a></td>
							<td>${t.mmName}</td>
							<td>${t.dpName}</td>
							<td>${t.dftDate}</td>
							<td>${t.dftFileOri}</td>
						</tr>
						
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
			
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>