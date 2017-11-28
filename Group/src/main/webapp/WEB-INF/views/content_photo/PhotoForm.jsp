
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	function fn_formSubmit() {
		var form1 = document.form1;

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


		document.form1.submit();
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->
	<section class="content-header">
		<h1>
			사진첩 <small>Photo Write</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Content 메인 -->
	<section class="content container-fluid">

		<form name="form1" action="PhotoSave" method="post"
			enctype="multipart/form-data">
			<table border="1" style="width: 600px">
				<caption>게시판</caption>
				<colgroup>
					<col width='15%' />
					<col width='*%' />
					<col width='90px' />
				</colgroup>
				<tbody>
					<tr>
						<td>부서명</td>
						<td><c:out value="${authUser.teamName}" /></td>

					</tr>
					<tr>
						<td>작성자</td>
						<td>[<c:out value="${authUser.positionName}" />] <c:out
								value="${authUser.employeeName}" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="2"><input type="text" name="title" size="70"
							maxlength="250" placeholder="제목을 입력해주세요."
							value="<c:out value="${photoInfo.title}"/>"></td>
					</tr>
					<tr>
						<td>첨부</td>
						<td colspan="2"><c:forEach var="listview" items="${listview}"
								varStatus="status">
								<input type="checkbox" name="filenum"
									value="<c:out value="${listview.filenum}"/>">
								<a
									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach> <input type="file" name="uploadfile" multiple="" id="uploadfile" /></td>
					</tr>


				</tbody>
			</table>
			<input type="hidden" name="writerpos"
				value="<c:out value="${authUser.positionName}"/>"> <input
				type="hidden" name="departname"
				value="<c:out value="${authUser.teamName}"/>"> <input
				type="hidden" name="writer"
				value="<c:out value="${authUser.employeeName}"/>"> <input
				type="hidden" name="photonum"
				value="<c:out value="${photoInfo.photonum}"/>">
			<%-- 			<c:if test="${authUser.role == 'ADMIN'}"> --%>
			<a href="#" onclick="fn_formSubmit()" style="float: right;">글등록</a>
			<%-- 			</c:if> --%>
		</form>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
</body>
</html>