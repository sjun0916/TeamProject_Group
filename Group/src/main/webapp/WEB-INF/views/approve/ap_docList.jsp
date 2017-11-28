<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
	<script>
	/* 문서 입력 페이지 불러오기  */
		$(document).on('click','#putInDoc',function(){
			$('#putInDocFom').modal();
		});
	
	/* 문서 등록 요청 */
		$(document).on('click','#DocumentBtn',function(){
			console.log('h1')
			var form = $('#DocumentForm')[0];
			console.log(form);
	        var formData = new FormData(form);
	        console.log(formData); 
	             $.ajax({
	                url: '/smart/ap/addDoc',
	                type : "POST",
	        		data : formData,
	        		dataType : "json",
	        		contentType: false,
	                processData: false,
	                cache: false,
	        		success : function(data) {
						if(data.check ='성공'){
							alert('입력되었습니다');
							$('#putInDocFom').modal('hide');
							console.log('안녕1'+data)
							$.each(data.selDoc,function(i,resultMap){
								$('#docTbody').append(`
										<tr>
											<td>`+resultMap.docCode+`</td>
											<td>`+resultMap.docFileGroup+`</td>
											<td>`+resultMap.docFileOri+`</td>
											<td><button="button">다운로드</td>
										</tr>
										`)
							})
						}else{
							alert('다시 입력해주세요');
						}						
	                }
	             
	            });
	         });
			
		/* 문서 구분 검색 */
		$(document).on('click','#docSearchBtn',function(){
			var docFileGroup = $('#docRequirement').serialize();
			console.log('h1'+docFileGroup);
			$('#docTbody').empty();
			$('#docSerachTbody').empty();
			$.ajax({
				url : '/smart/ap/searchDoc',
				data : docFileGroup,
				dataType : 'json',
				type : 'post',
				success : function(data){
					console.log('h2')
					console.log(data[0].docCode)
					$.each(data,function(i,document){
						$('#docSerachTbody').append(`
								<tr>
									<td>`+document.docCode+`</td>
									<td>`+document.docFileGroup+`</td>
									<td>`+document.docFileOri+`</td>
									<td><a href="<c:url value='/ap/docDownFile?docCode=`+document.docCode+`'/>" class="btn-success">다운받기</td>
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
		<li class="active">문서 양식</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">문서양식함</h3>
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
					
					<button type="button" class="btn-primary btn-lg" id="docSearchBtn">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</form>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>문서번호</th>
							<th>문서분류</th>
							<th width="600">문서이름</th>
							<th>Download</th>
						</tr>
					</thead>
					
					<tbody id="docSerachTbody">
					
					
					</tbody>
					
					<tbody id="docTbody">
						<c:forEach var="docList" items="${docList}">
						
							<tr>
								<td>${docList.docCode}</td>
								<td>${docList.docFileGroup}</td>
								<td>${docList.docFileOri}</td>
								<td><a href="<c:url value='/ap/docDownFile?docCode=${docList.docCode}'/>" class="btn-success">다운받기</a></td>
							</tr>
						
						</c:forEach>
					</tbody>
				</table>
				<!-- 관리자만 보이는 메뉴 -->				
				<button type="button" class="btn-success" id="putInDoc">문서양식 추가</button>
			</div>
		</div>
	</div>
</div>
<c:import url="./ap_docAdd.jsp"></c:import> <!--팝업창 문서추가  -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>