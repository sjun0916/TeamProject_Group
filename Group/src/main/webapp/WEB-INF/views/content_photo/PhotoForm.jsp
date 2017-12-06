
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<script>

	function fn_formSubmit() {
		var form1 = document.form1;
// 		var fileValue = $("#uploadfile").val().split("\\");
// 		var fileName = fileValue[fileValue.length-1]; // 파일명


		if (form1.title.value == "") {
			alert("글 제목을 입력해주세요.");
			form1.title.focus();
			return;
		}
		if( $("uploadfile").val() != "" ){
			var ext = $('#uploadfile').val().split('.').pop().toLowerCase();
			      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');			 
				 return;
		      }
			}	
// 		document.form1.filename.value = fileName;
		document.form1.submit();
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/photo-camera.png"/>"
				width="50" height="50" /> 사진첩 <small>photo write</small>
		</h1>

	</section>

	<!-- Content 메인 -->


	<section class="content container-fluid">
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">Photo Write</h3>
			</div>
			<!-- /.box-header -->
			<!-- form start -->
			<form class="form-horizontal" name="form1" action="PhotoSave"
				method="post" enctype="multipart/form-data">
				<div class="box-body">
					<div class="form-group">
						<label for="team" class="col-sm-2 control-label">부서명</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" id="team"
								value="<c:out value="${authUser.teamName}"/>"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="write" class="col-sm-2 control-label">작성자</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" id="write"
								value="[<c:out value="${authUser.positionName}"/>]<c:out value="${authUser.employeeName}"/>"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">제목</label>

						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title"
								value="<c:out value="${photoInfo.title}"/>"
								placeholder="제목을 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label for="attach" class="col-sm-2 control-label">사진첨부</label>

						<div class="col-sm-10">
					
							<c:forEach var="listview" items="${listview}" varStatus="status">
							
								<input type="checkbox" name="photofilenum"
									value="<c:out value="${listview.photofilenum}"/>">
								<a
									href="fileDownload2?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach>
							<input type="file" id="uploadfile"
								name="uploadfile" multiple="" />
						</div>
					</div>
					<input type="hidden" name="writerpos"
						value="<c:out value="${authUser.positionName}"/>"> <input
						type="hidden" name="departname"
						value="<c:out value="${authUser.teamName}"/>"> <input
						type="hidden" name="writer"
						value="<c:out value="${authUser.employeeName}"/>"> <input
						type="hidden" name="photonum"
						value="<c:out value="${photoInfo.photonum}"/>">
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-default"
						onClick="history.back();">돌아가기</button>
					<button type="button" class="btn btn-info pull-right"
						onclick="fn_formSubmit()">사진등록</button>
				</div>
				<!-- /.box-footer -->
			</form>
		</div>

	</section>

	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
</body>
</html>
