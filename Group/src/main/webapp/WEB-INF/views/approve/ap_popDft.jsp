<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="putInForDft" role="dialog">
<div class="modal-dialog">


<!-- 본문 시작 -->
<div class="modal-content">

		<div class="modal-header">
			<h2>기안등록</h2>		
		</div>
		
		<div class="modal-body">
		
		<form action="<c:url value='/ap/add'/>" method="post" enctype="multipart/form-data" id="approvalForm">
		    
		    	<div class="row">
		    		<div class="col-md-8">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[사원번호]</label>
						    <input type="text" class="form-control" name="mmName" value="${sessionScope.mmCode}">
						</div>
		            </div>
		    	</div>
		    	
		    	<div class="row">
		    		<div class="col-md-8">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[문서제목]</label>
						    <input type="text" class="form-control" name="dftTitle">
						</div>
		            </div>
		    	</div>
		    	
		    	<div class="row">
		    		<div class="col-md-8">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[문서구분]</label>
						    <select name="docCode" id="docCode" class="form-control1">
						    	<option value=0>[문서분류를 선택하세요]</option>
								
								<c:forEach var="doc" items="${doc}">
									<option value="${doc.docCode}">${doc.docFileGroup}</option>  
								</c:forEach>
															
							</select>
						</div>
		            </div>   
		    	</div>
		    	<div class ="row">
					<div class="col-md-8">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[문서선택]</label>
						    <input type="file" class="form-control" name="uploadFile">
						</div>
		            </div>
		    	</div>
		    		
				<div class="row">
					<div class="col-sm-8">
					<label for="firstname" class="control-label">[결재선 추가]</label>
				    	 <main>
							  <table class="table table-bordered table-condensed">
							    <thead>
							      <tr>
							        <th></th>
							        <th class="col">부서</th>
							        <th class="col">직급</th>
							        <th class="col">직원 이름</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <th class="row">1차 결재자</th>
							        <td>
							      
										<select name="depSearch1" id="depSearch1" class="form-control1">
										
											<option value=0>[부서을 선택하세요]</option>
											<c:forEach var="dep" items="${dep}">
												<option value="${dep.dpCode}">${dep.dpName}</option>
											</c:forEach>
											
										</select>
													
									</td>
							        <td>
							    
								        <select name="posSearch1" id="posSearch1" class="form-control1">
											<option value=0>[직급을 선택하세요]</option>
											<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
											</c:forEach>											
										</select>				
									
							        </td>
						        	<td>					        	
							        	<select name="aprApproval1" id="aprApproval1" class="form-control1">
												<option id=1 value=0>[이름을 선택하세요]</option>
												
										</select>						
							        </td>
							      </tr>
							
							   	  <tr>
							        <th class="row">2차 결재자</th>
							        <td>				        
										<select name="depSearch2" id="depSearch2" class="form-control1">
											<option>[부서을 선택하세요]</option>
												<c:forEach var="dep" items="${dep}">
													<option value="${dep.dpCode}">${dep.dpName}</option>
												</c:forEach>						
										</select>
															
									</td>
							        <td>
								        <select name="posSearch2" id="posSearch2" class="form-control1">
											<option>직급을 선택하세요</option>
												<c:forEach var="pos" items="${pos}">
													<option value="${pos.ptCode}">${pos.ptName}</option>
												</c:forEach>															
										</select>
										
							        </td>
							        <td>
							        	<select name="aprApproval2" id="aprApproval2" class="form-control1">
												<option id=2 value=0>[이름을 선택하세요]</option>
									
										</select>
							
							        </td>
							     </tr>
							
							     <tr>
							        <th class="row">3차 결재자</th>
							        <td>
										<select name="depSearch3" id="depSearch3" class="form-control1">
											<option>[부서을 선택하세요]</option>								
												<c:forEach var="dep" items="${dep}">
													<option value="${dep.dpCode}">${dep.dpName}</option>
												</c:forEach>											
										</select>
									
							        <td>
								        <select name="posSearch3" id="posSearch3" class="form-control1">
											<option>[직급을 선택하세]</option>
												<c:forEach var="pos" items="${pos}">
													<option value="${pos.ptCode}">${pos.ptName}</option>
												</c:forEach>															
										</select>
									
							        </td>
							        <td>
							        	<select name="aprApproval3" id="aprApproval3" class="form-control1">
												<option id=3 value=0>[이름을 선택하세요]</option>
										</select>
								
							        </td>
							      </tr>  
							  </table>
							&nbsp;
							<div class="row">
								<div class="col-sm-12">
								 	<button class="col-sm-6" type="button" id="aprSaveBtn">결재라인저장</button>					
									<button class="col-sm-6" type="button" id="aprGetBtn">결재라인불러오기</button>									
								</div>
							</div>	  
						</main>   
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
						 <input type="text" name="aprCode" hidden="hidden" value="0">
					</div>	 
				</div> 
				
				&nbsp;
				<div class="row">
					<div class="col-sm-8">
						<div>
						<label>[문서 임시 저장] </label>&nbsp; &nbsp; 
							<input type="radio" name="dftCheck" value="true" checked="checked">save
							&nbsp; 
							<input type="radio" name="dftCheck" value="false">reject
							&nbsp;
							&nbsp;
					</div>	
				</div>
		    	
		    	<div class="row">
		           <div class="form-group" align="center">
		                    <button type="submit" class="btn btn-default"> Submit </button>
		                    <button type="reset" class="btn btn-default" > reset </button>    
		           </div>
		  		</div>
		
		    </form>
			
	
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
		</div>
</div>
<!-- 본문 끝 -->
</div>
</div>	
</body>
</html>