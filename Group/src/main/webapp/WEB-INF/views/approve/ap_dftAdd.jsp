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
	
	/* 1차 결재선  */
	$(document).on('focus','#aprApproval1',function(){
		var department = $('#depSearch1').val();
		var position = $('#posSearch1').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h1');
				console.log(data);
				$.each(data, function(i, member){
					$('#1').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
				}
			
		})
	})
	
	/* 2차 결재선 */
	$(document).on('focus','#aprApproval2',function(){
		var department = $('#depSearch2').val();
		var position = $('#posSearch2').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				console.log(data);
				$.each(data, function(i, member){
					$('#2').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
			
			}
		})
	})
	
	/* 3차 결재선 */
	$(document).on('focus','#aprApproval3',function(){
		var department = $('#depSearch3').val();
		var position = $('#posSearch3').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h3');
				console.log(data);
				$.each(data, function(i, member){
					$('#3').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
				});
			}
		
		})
	})
	
	/* 결재라인 저장하기  */
	$(document).on('click','#aprSaveBtn',function(){
		console.log('결재선')
		var data = $('#approvalForm').serialize();
		console.log(data);
		$.ajax ({
			url:'/smart/ap/addApr',
			type : 'POST',
			data : data,
			dataTpye : 'json',
			success : function(data){
				console.log('결재선 원');
				console.log(data);
				if(data !=0){
					alert('입력되었습니다') 
				}else{
					alert('다시 시도하세요')
					}
				}
			
		})
	})
	 	
	/* 결재라인 불러오기 */
	$(document).on('click','#aprGetBtn',function(){
		$('#putInAprFom').modal();
		var mmCode = $('#mmCode').val();
		console.log('h1'+mmCode);
		
		$.ajax({
			url:'/smart/ap/listApr',
			type : 'POST',
			data : { 'mmCode' : mmCode },
			dataType : 'json',
			success : function(data){
				console.log('성공');
				$('#aprListForm').empty();
				console.log(data[0].aprCode);
				
				$.each(data,function(i, apr){
					$('#aprListForm').append(`
							<tr>
								<td id="1">`+apr.aprCode+`</td>
								<td>`+apr.aprName1+`</td>
								<td>`+apr.aprName2+`</td>
								<td>`+apr.aprName3+`</td>
								<td><button type = "button" id="aprChoBtn">선택</button></td>
							</tr>`);
				})		
			}
		})
	
	})
	
	/* 결재선 화면에 뿌려주기  */
	$(document).on('click','#aprChoBtn', function(){
		var aprCode = $(this).parent().parent().children('#1').text();
		console.log(aprCode)
		
		$.ajax({
			url: '/smart/ap/selApr',
			data : { 'aprCode' : aprCode },
			type : 'POST',
			dataType : 'json',
			success : function(data){
				console.log('결재선성공');
				console.log('이름:'+data.map1.mmName);
				console.log($('#aprApproval1').val());
				 $('#depSearch1').val(data.map1.dpCode).attr('selected','selected');
				 $('#posSearch1').val(data.map1.ptCode).attr('selected','selected');
				 $('#1').after('<option value="'+data.map1.mmCode+'">'+data.map1.mmName+'</option>');
				 $('#aprApproval1').val(data.map1.mmCode).attr('selected','selected');
				 
				 $('#depSearch2').val(data.map2.dpCode).attr('selected','selected');
				 $('#posSearch2').val(data.map2.ptCode).attr('selected','selected'); 
				 $('#2').after('<option value="'+data.map2.mmCode+'">'+data.map2.mmName+'</option>');
				 $('#aprApproval2').val(data.map2.mmCode).attr('selected','selected'); 
				 
				 $('#depSearch3').val(data.map3.dpCode).attr('selected','selected');
				 $('#posSearch3').val(data.map3.ptCode).attr('selected','selected'); 
				 $('#3').after('<option value="'+data.map3.mmCode+'">'+data.map3.mmName+'</option>');
				 $('#aprApproval3').val(data.map3.mmCode).attr('selected','selected'); 
				 
				 $('#aprCode').val(aprCode);
				 $('#putInAprFom').modal('hide');
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
		<li class="active">전자결재신청</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">전자결재신청</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form role="form" id="approvalForm">
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label for="mmCode">
								<span class="glyphicon glyphicon-save red"></span> 
								임시보관함에 저장기능
							</label>
							<br/>
							<input type="radio" name="dftCheck" value="true" checked="checked"/>사용
							<input type="radio" name="dftCheck" value="false" />사용하지않음
						</div>
					</div>	
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label for="mmCode">
								<span class="glyphicon glyphicon-user"></span> 
								사원코드
							</label>
							<input type="text" class="form-control" name="mmCode" id="mmCode" value="${sessionScope.mmCode}" readonly="readonly"/>
						</div>
					</div>				
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label for="dftTitle">
								<span class="glyphicon glyphicon-modal-window"></span> 
								문서제목
							</label>
							<input type="text" class="form-control" name="dftTitle" id="dftTitle" placeholder="문서제목">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label for="docCode">
								<span class="glyphicon glyphicon-ok-sign"></span> 
								문서구분
							</label>
							<select name="docCode" id="docCode" class="form-control">
								<c:forEach var="doc" items="${doc}">
									<option value="${doc.docCode}">${doc.docFileGroup}</option>
								</c:forEach>
								
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label for="firstname">
								<span class="glyphicon glyphicon-inbox"></span> 
								문서선택
							</label>
							<input type="file" class="form-control" name="uploadFile">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
			    		<div class="col-md-12">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">
							    	<span class="glyphicon glyphicon-comment"></span>기안내용
							    </label>
							    <input type="text" class="form-control" name="dftContent">
							</div>
			            </div>
			        </div>
		    	</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="firstname">
							<span class="glyphicon glyphicon-eye-open"></span> 
							결제선선택<span style="color:red;">(*부서,직급을 선택하시면 해당직원이 자동검색 됩니다)</span>
						</label>
						<table class="table table-bordered table-condensed">
							<thead>
								<tr>
									<th></th>
									<th class="col">부서</th>
									<th class="col">직급</th>
									<th class="col">직원 이름</th>
								</tr>
							</thead>
 
							<tbody id="selectAllAprForm">
								<tr>
									<th class="row">1차 결재자</th>
									<td>
										<select name="depSearch1" id="depSearch1" class="form-control">
											<option value=0>부서</option>
												<c:forEach var="dep" items="${dep}">
												<option value="${dep.dpCode}">${dep.dpName}</option>
												</c:forEach>
										</select>
									</td>
									<td>
										<select name="posSearch1" id="posSearch1" class="form-control">
											<option value=0>직급</option>
												<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
												</c:forEach>											
										</select>				
									</td>
									<td>					        	
										<select name="aprApproval1" id="aprApproval1" class="form-control">
											<option id=1 value=0>이름</option>
										</select>						
									</td>
								</tr>
							<tr>
								<th class="row">2차 결재자</th>
								<td>				        
									<select name="depSearch2" id="depSearch2" class="form-control">
										<option>부서</option>
											<c:forEach var="dep" items="${dep}">
												<option value="${dep.dpCode}">${dep.dpName}</option>
											</c:forEach>						
									</select>
								</td>
								<td>
									<select name="posSearch2" id="posSearch2" class="form-control">
										<option>직급</option>
											<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
											</c:forEach>															
									</select>
								</td>
								<td>
									<select name="aprApproval2" id="aprApproval2" class="form-control">
										<option id=2 value=0>이름</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="row">3차 결재자</th>
								<td>
									<select name="depSearch3" id="depSearch3" class="form-control">
										<option>부서</option>								
											<c:forEach var="dep" items="${dep}">
											<option value="${dep.dpCode}">${dep.dpName}</option>
											</c:forEach>											
									</select>
								</td>
								<td>
									<select name="posSearch3" id="posSearch3" class="form-control">
										<option>직급</option>
											<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
											</c:forEach>															
									</select>
								</td>
								<td>
									<select name="aprApproval3" id="aprApproval3" class="form-control">
										<option id=3 value=0>이름</option>
									</select>
								</td>
							</tr>  
						</table>
					</div>
					
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<button class="col-sm-6 btn-info" type="button" id="aprSaveBtn">결재라인저장</button>					
							<button class="col-sm-6 btn-info" type="button" id="aprGetBtn">결재라인불러오기</button>
							<br/><br/><br/><br/>	
						</div>
						<input type="text" name="aprCode" hidden="hidden" value="0">
					</div>
				</div>
				
				<div class="form-group" align="center">
					<button type="button" class="btn-success btn-lg" id="appApplyBtn"> 전자결제신청 </button>
					<button type="reset" class="btn-success btn-lg" > 다시작성 </button>    
				</div>
			</form>
			</div>
		</div>
	</div>
</div>			
<br/><br/><br/><br/><br/><br/><br/><br/>
<c:import url="./ap_aprAdd.jsp"></c:import> <!--팝업창 --> 
</body>
</html>