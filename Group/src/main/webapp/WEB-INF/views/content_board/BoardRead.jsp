<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	function fn_formSubmit() {
		var form1 = document.form1;

		if (form1.rewriter.value == "") {
			alert("작성자를 입력해주세요.");
			form1.rewriter.focus();
			return;
		}
		if (form1.rememo.value == "") {
			alert("글 내용을 입력해주세요.");
			form1.rememo.focus();
			return;
		}
		form1.submit();
	}

	function fn_replyDelete(renum) {
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}
		var form = document.form2;

		form.action = "boardReplyDelete";
		form.renum.value = renum;
		form.submit();
	}

	var updaterenum = updateRememo = null;
	function fn_replyUpdate(renum) {
		var form = document.form2;
		var reply = document.getElementById("reply" + renum);
		var replyDiv = document.getElementById("replyDiv");
		replyDiv.style.display = "";

		if (updaterenum) {
			document.body.appendChild(replyDiv);
			var oldrenum = document.getElementById("reply" + updaterenum);
			oldrenum.innerText = updateRememo;
		}

		form.renum.value = renum;
		form.rememo.value = reply.innerText;
		reply.innerText = "";
		reply.appendChild(replyDiv);
		updaterenum = renum;
		updateRememo = form.rememo.value;
		form.rememo.focus();
	}

	function fn_replyUpdateSave() {
		var form = document.form2;
		if (form.rememo.value == "") {
			alert("글 내용을 입력해주세요.");
			form.rememo.focus();
			return;
		}

		form.action = "boardReplySave";
		form.submit();
	}

	function fn_replyUpdateCancel() {
		var form = document.form2;
		var replyDiv = document.getElementById("replyDiv");
		document.body.appendChild(replyDiv);
		replyDiv.style.display = "none";

		var oldrenum = document.getElementById("reply" + updaterenum);
		oldrenum.innerText = updateRememo;
		updaterenum = updateRememo = null;
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			부서 게시판 <small>Board Content</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ì»¨íí¸ ë©ì¸ -->
	<section class="content container-fluid">
		<table border="1" style="width: 600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='20%'/>
				<col width='*%'/>
				<col width='20%'/>
			</colgroup>
			<tbody>
				<tr>
					<td>[<c:out value="${boardInfo.departname}" />게시글]
					</td>
					<td><c:out value="${boardInfo.title}" /></td>
					<td><c:out value="${boardInfo.regdate}" /></td>
				</tr>
				<tr>
					<td colspan="2">작성자:[<c:out value="${boardInfo.writerpos}" />]<c:out
							value="${boardInfo.writer}" /></td>
					<td>
							<c:forEach var="listview" items="${listview}" varStatus="status">
								<a
									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach>
						</td>
				</tr>

				<tr>
					<td colspan="3" height="200"><c:out value="${boardInfo.content}"
							escapeXml="false" /></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 					<td>첨부</td> -->
				<%-- 					<td><c:forEach var="listview" items="${listview}" --%>
				<%-- 							varStatus="status"> --%>
				<!-- 							<a -->
				<%-- 								href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> --%>
				<%-- 								<c:out value="${listview.filename}" /> --%>
				<!-- 							</a> -->
				<%-- 							<c:out value="${listview.size2String()}" /> --%>
				<!-- 							<br /> -->
				<%-- 						</c:forEach></td> --%>
				<!-- 				</tr> -->
			</tbody>
		</table>
		<a href="BoardList">돌아가기</a> <a
			href="BoardDelete?boardnum=<c:out value="${boardInfo.boardnum}"/>">삭제</a>
		<a href="BoardForm?boardnum=<c:out value="${boardInfo.boardnum}"/>">수정</a>
		<p>&nbsp;</p>
		<div style="border: 1px solid; width: 600px; padding: 5px">
			<form name="form1" action="BoardReplySave" method="post">
				<input type="hidden" name="boardnum"
					value="<c:out value="${boardInfo.boardnum}"/>"> 작성자: <input
					type="text" name="rewriter" size="20" maxlength="20"> <br />
				<textarea name="rememo" rows="3" cols="60" maxlength="500"
					placeholder="댓글을 달아주세요."></textarea>
				<a href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>

		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div
				style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">
				<c:out value="${replylist.rewriter}" />
				<c:out value="${replylist.redate}" />
				<a href="#"
					onclick="fn_replyDelete('<c:out value="${replylist.renum}"/>')">삭제</a>
				<a href="#"
					onclick="fn_replyUpdate('<c:out value="${replylist.renum}"/>')">수정</a>
				<br />
				<div id="reply<c:out value="${replylist.renum}"/>">
					<c:out value="${replylist.rememo}" />
				</div>
			</div>
		</c:forEach>

		<div id="replyDiv" style="width: 99%; display: none">
			<form name="form2" action="BoardReplySave" method="post">
				<input type="hidden" name="boardnum"
					value="<c:out value="${boardInfo.boardnum}"/>"> <input
					type="hidden" name="renum">
				<textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">저장</a> <a href="#"
					onclick="fn_replyUpdateCancel()">취소</a>
			</form>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>
