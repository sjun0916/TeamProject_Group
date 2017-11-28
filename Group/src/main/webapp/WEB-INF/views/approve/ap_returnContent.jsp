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
		<li class="active">기안반려 상세보기</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<a href="<c:url value='/ap/list?dftCode=${pgList.dftCode}'/>" class="btn-success btn-lg" >
				<span class="glyphicon glyphicon-edit"></span> 목록바로가기
			</a>
		</div>   
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">기안반려 상세보기</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><span class="glyphicon glyphicon-bookmark"></span> 기안코드</th>
							<th colspan="8">
								<center>${draft.dftCode}</center>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td >기안제목</td>
							<td colspan="8" align="center">${draft.dftTitle}</td>
						</tr>
						<tr>
							<td >기안내용</td>
							<td colspan="8" align="center">${draft.dftContent}</td>
						</tr>
						<tr>
							<td>반려사유</td>
							<td style="color:red;" colspan="8" align="center">${draft.proReason}</td>
						</tr>
						
						<tr>
							<td>분류</td>
							<td>${draft.docFileGroup}</td>
							<td></span> 기안등록날자</td>
							<td>${draft.dftDate}</td>
							<td></span> 반려결재날자</td>
							<td>${draft.dftDate}</td>
						</tr>
						
						
						<tr>
							<td>기안자(사원번호)</td>
							<td>${draft.mmName}(${draft.mmCode})</td>
							<td>직급</td>
							<td>${draft.ptName}</td>
							<td>부서</td>
							<td>${draft.dpName}</td>
						</tr>
						
						<tr>
							<td>결재자(사원번호)</td>
							<td>${draft.proApprovalName}(${draft.proApproval})</td>
							<td>직급</td>
							<td>${draft.pPtName}</td>
							<td>부서</td>
							<td>${draft.pDpName}</td>
						</tr>
						
						<tr>
							<td>결재진행현황</td>
							<td>${draft.dftFinalState}</td>
							<td>파일</td>
							<td colspan="6"><a href="<c:url value='/ap/dftDownFile?dftCode=${draft.dftCode}'/>">${draft.dftFileOri}</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>