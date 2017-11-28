<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="modal fade" id="putInAprFom" role="dialog">
<div class="modal-dialog">

<!-- 본문 시작 -->
<div class="modal-content">
		<div class="modal-header">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 결재선 가져오기</h4>
		</div>
		</div>
		
		<div class="modal-body">
		
			<form action="<c:url value='/ap/listApr'/>" method="post" id="approvalForm">
	        	
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						사원이름
					</label>
					<input type="hidden" class="form-control" name="mmCode" id="mmCode" value="${sessionScope.mmCode}">
					<input type="text" class="form-control" name="mmCode" id="mmCode" value="${sessionScope.mmName}">
					
				</div>
	
			<div class="container">
			    <table width="550" height="120">
					<thead>
						<tr>
							<th width="100">번호</th>
							<th width="160">1차 결재선</th>
							<th width="160">2차 결재선</th>
							<th width="160">3차 결재선</th>
							<th width="100">선택</th>
						</tr>
					</thead>
					<tbody id="aprListForm">
						
					</tbody>
				</table>
			</div>
			&nbsp;
	

	   		</form>	
		</div>
		
</div>


<!-- 본문 끝 -->
</div>
</div>	
</body>
</html>