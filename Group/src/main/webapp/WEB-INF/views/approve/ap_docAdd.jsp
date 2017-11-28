<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="modal fade" id="putInDocFom" role="dialog">
<div class="modal-dialog">

<!-- 본문 시작 -->
<div class="modal-content">
		<div class="modal-header">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 문서양식등록</h4>
		</div>
		</div>
		
		<div class="modal-body">
		
			<form action="<c:url value='/ap/addDoc'/>" method="post" enctype="multipart/form-data" id="DocumentForm">
	        	
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						문서분류입력
					</label>
					<input type="text" class="form-control" name="docFileGroup" id="docFileGroup" >
				</div>

				<div class="form-group form-group-sm">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						문서분류입력
					</label>
					<input type="file" class="form-control" name="uploadFile" id="uploadFile" >
				</div>

				&nbsp;
		
				<div class="form-group">
				       <button type="button"  class="btn btn-default btn-success btn-block" id="DocumentBtn">등록</button> 
				</div>

	   		</form>	
		</div>
		
</div>


<!-- 본문 끝 -->
</div>
</div>	
</body>
</html>