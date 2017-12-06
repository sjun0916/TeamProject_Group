
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
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
		if (form1.content.value == "") {
			alert("글 내용을 입력해주세요.");
			form1.content.focus();
			return;
		}

		var digit = "";
		if ($("#chkBox").prop("checked")) {
			digit = digit + "Y";
		} else {
			digit = digit + "N";
		}
		document.form1.important.value = digit;
		//alert(document.form1.important.value);
		document.form1.submit();
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/megaphone.png"/>" width="50" height="50"/>
			공지사항 <small>notice write</small>
		</h1>
	</section>

	<!-- Content 메인 -->

	<section class="content container-fluid">
	<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Notice Write</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" name="form1" action="NoticeSave" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	<div class="form-group">
                  <label for="chkBox" class="col-sm-2 control-label">Important</label>
                  <div class="col-sm-10">
							<input type="checkbox" id="chkBox" name="chkBox">
                  </div>
                </div>
                <div class="form-group">
                  <label for="team" class="col-sm-2 control-label">부서명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="team" value="<c:out value="${authUser.teamName}"/>" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label for="write" class="col-sm-2 control-label">작성자</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="write" value="[<c:out value="${authUser.positionName}"/>]<c:out value="${authUser.employeeName}"/>" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label for="title" class="col-sm-2 control-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" value="<c:out value="${noticeInfo.title}"/>" placeholder = "제목을 입력해주세요.">
                  </div>
                </div>
                <div class="form-group">
                  <label for="attach" class="col-sm-2 control-label">파일첨부</label>
                  <div class="col-sm-10">
                    <c:forEach var="listview" items="${listview}" varStatus="status">
								<input type="checkbox" name="noticefilenum"  value="<c:out value="${listview.noticefilenum}"/>">
								<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br/>
					</c:forEach>
					<input type="file" id="attach" name="uploadfile" multiple="" />
                  </div>
                </div>

				<div class="form-group">
                  <label for="content" class="col-sm-2 control-label">내용</label>
                  <div class="col-sm-10">
                  	<textarea id="compose-textarea" class="textarea" name="content" style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" placeholder = "내용을 입력해주세요."><c:out value="${noticeInfo.content}" /></textarea>
                  </div>
                </div>
               <input type="hidden" name="important" value="<c:out value="${noticeInfo.important}"/>">
				<input type="hidden" name="writerpos" value="<c:out value="${authUser.positionName}"/>">
				<input type="hidden" name="departname" value="<c:out value="${authUser.teamName}"/>">
				<input type="hidden" name="writer" value="<c:out value="${authUser.employeeName}"/>">
				<input type="hidden" name="noticenum" value="<c:out value="${noticeInfo.noticenum}"/>">
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
              	<button type="button" class="btn btn-default" onClick="history.back();">돌아가기</button>
                <button type="button" class="btn btn-info pull-right" onclick="fn_formSubmit()">글등록</button>
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
