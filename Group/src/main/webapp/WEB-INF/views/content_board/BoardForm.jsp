
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	function fn_formSubmit() {
		var form1 = document.form1;

		if (form1.writer.value == "") {
			alert("작성자를 입력해주세요.");
			form1.writer.focus();
			return;
		}
		if (form1.title.value == "") {
			alert("글 제목을 입력해주세요.");
			form1.title.focus();
			return;
		}
		if (form1.content.value == "") {
			alert("글 내용을 입력해주세요.");
			form1.content.focus();
			return;
		}
		document.form1.submit();
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->
	<section class="content-header">
		<h1>
			부서 게시판 <small>Board Write</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Content 메인 -->
	<section class="content container-fluid">

		<form name="form1" action="BoardSave" method="post"
			enctype="multipart/form-data">
			<table border="1" style="width: 600px">
				<caption>게시판</caption>
				<colgroup>
					<col width='15%' />
					<col width='*%' />
				</colgroup>
				<tbody>
					<tr>
						<td>부서명</td>
						<td><input type="text" name="departname" size="20"
							maxlength="20" value="<c:out value="${boardInfo.departname}"/>"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size="20" maxlength="20"
							value="<c:out value="${boardInfo.writer}"/>"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="70" maxlength="250"
						placeholder = "제목을 입력해주세요."
							value="<c:out value="${boardInfo.title}"/>"></td>
					</tr>
					<tr>
						<td>첨부</td>
						<td><c:forEach var="listview" items="${listview}"
								varStatus="status">
								<input type="checkbox" name="filenum"
									value="<c:out value="${listview.filenum}"/>">
								<a
									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach> <input type="file" name="uploadfile" multiple="" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="5" cols="60"><c:out
									value="${boardInfo.content}" /></textarea></td>
					</tr>
					
				</tbody>
			</table>
			<input type="hidden"  name="boardnum"
				value="<c:out value="${boardInfo.boardnum}"/>"> <a href="#"
				onclick="fn_formSubmit()" style="float:right;" >글등록</a>
				
		</form>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
