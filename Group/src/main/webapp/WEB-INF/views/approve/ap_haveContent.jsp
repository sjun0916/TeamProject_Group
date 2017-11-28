<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<script>
	/* 파일다운로드 경로지정 */
	$(function(){
	    $("#dftFileDown").click(function(){
	    	console.log('h2')
	    	$('#dftForm').attr({action:"<c:url value='/ap/downdftFile'/>",method:"post"}).submit();  
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
		<li class="active">결재요청</li>
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
					<h3 class="panel-title">결재요청</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form  class="form-horizontal" action="<c:url value='/ap/proAdd'/>" method="post" id="dftForm">
				<div class="form-group">
					<label for="nameinput" class="col-sm-2 control-label">문서 번호</label> 	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="dftCode" value="${draft.dftCode}" readonly="readonly">
					</div>
					
					<div class="col-sm-3">
						<input type="hidden" class="form-control" name="dftDegree" value="${draft.dftDegree}" readonly="readonly" >
					</div>
				</div>
				<div class="form-group">
					<label for="Emailinput" class="col-sm-2 control-label">문서 제목</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="dftTitle" value="${draft.dftTitle}" readonly="readonly"> 													
					</div>
																
				</div>
				<div class="form-group">
					<label for="dftContent" class="col-sm-2 control-label">기안내용</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="dftContent" value="${draft.dftContent}" readonly="readonly"> 													
					</div>
																
				</div>
				<div class="form-group">
					<label for="Passwordinput" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="mmCode" value="${draft.mmCode}" readonly="readonly">
					</div>
				</div>
				
				<div class="form-group">
					<label for="Passwordinput" class="col-sm-2 control-label">결재자</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="dft_Approval" value="${draft.proApproval}"readonly="readonly">
					</div>
				</div>
					
					
				<div class="form-group">
					<label for="Emailinput" class="col-sm-2 control-label">문서 양식</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="docCode" value="${draft.docCode}" readonly="readonly"> 														
					</div>
																
				</div>
				
				<div class="form-group">
					<label for="Emailinput" class="col-sm-2 control-label">첨부 파일</label>
					<div class="col-sm-8">
						<a href="<c:url value='/ap/dftDownFile?dftCode=${draft.dftCode}'/>">${draft.dftFileOri}</a>
					</div>																	
				</div>
				
				<div class="form-group">
					<label for="Emailinput" class="col-sm-2 control-label">기안 등록 일자</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="dftDate" value="${draft.dftDate}" readonly="readonly"> 														
					</div>															
				</div>
				
				<c:set var="proApproval" value="${draft.proApproval}"></c:set>
				<c:choose>
					<c:when test="${sessionScope.mmCode == proApproval}">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="marrycheck">결재여부</label>
							<div class="col-sm-8">
								<div class="radio-inline">
									<label for="marrycheck"><input type="radio" name="proState" value=1 id="proState" checked="checked"> 승인</label>
								</div>
								<div class="radio-inline">
									<label for="marrycheck"><input type="radio" name="proState" value=2 id="proState1"> 반려</label>
								</div>
							</div>
						</div>	
						<div class="form-group">
							<label for="txtarea" class="col-sm-2 control-label">반려사유</label>
							<div class="col-sm-8">
								<textarea style = "width:800px" name="proReason" id="txtarea1" cols="50" rows="4" class="form-control"></textarea>
							</div>
						</div>
					
						<!-- 결재자 코드 가져와서 일치할 경우에 submit버튼 나타나게 -->			
						<div align="center">
							<button id="submitBtn" type="submit" class="btn-success btn-lg">결제요청</button>
						</div>
					</c:when>
				</c:choose>
			</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
								