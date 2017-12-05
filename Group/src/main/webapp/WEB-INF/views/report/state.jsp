<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<link rel='stylesheet' type='text/css' href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<!-- Content Wrapper. Contains page content -->
<style>
.sjgfont {
	font-weight: 700;
}

.modalscroll {
	width: 41em;
	height: auto;
	line-height: 2em;
	/* border: 1px solid #ccc; */
	padding: 0;
	margin: 0;
	overflow: auto;
	overflow-x: hidden;
}

.label {
	font-weight: 700;
	line-height: 1;
	white-space: nowrap;
	vertical-align: baseline;
	text-align: center;
}

.checked {
	color: #3bc1c5 !important;
	border: 2px solid #3bc1c5 !important;
	font-weight: 700;
}

.panel-label {
	display: inline-block;
	max-width: 77px;
	padding: 0 3px;
	line-height: 20px;
	font-size: 12px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper" style="min-height: 841px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/archives.png"/>" width="50" height="50"/>
			문서결재함 <small>electronic document approval</small>
		</h1>
	</section>
	<br>
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">${title}</h3>

				<div class="box-tools" style="padding: 0px; text-align: right; float: left">
					 <div class="input-group input-group-sm" style="width: 150px;">
						<!-- <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

						<div class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
							</button>
						</div> -->
					</div>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body table-responsive no-padding">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th width="10%">서류번호</th>
							<th width="35%">제목</th>
							<th width="20%">작성일</th>
							<th width="15%">현황</th>
							<th width="20%">사유</th>
						</tr>
						<c:forEach items="${list}" var="vo">
							<tr id="${vo.REPORT_NO}">
								<td>${vo.REPORT_NO}</td>
								<td>${vo.REG_TITLE}</td>
								<td>${vo.REG_DATE}</td>
								<td><c:if test="${vo.REG_STATE eq 0}">
										<span class="label label-danger">반려됨</span>
									</c:if> <c:if test="${vo.REG_STATE eq 1}">
										<span class="label label-primary">등록 완료</span>
									</c:if> <c:if test="${vo.REG_STATE eq 2}">
										<span class="label label-warning">처리중</span>
									</c:if> <c:if test="${vo.REG_STATE eq 3}">
										<span class="label label-success">처리완료</span>
									</c:if></td>
								<td>${vo.REG_REASON}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<div class="example-modal">
		<div class="modal" id="myModal3" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="disable()">
							<span aria-hidden="true" onclick="disable()">&times;</span>
						</button>
						<h4 class="modal-title" id="modal3Title"></h4>
					</div>
					<div class="modal-body" style="min-height: 300px; max-height: 763px;">
						<div id="modal3StateColor" class="small-box bg-red">
							<div class="inner">
								<h3 id="modal3State">65</h3>
								<p id="modal3No">Unique Visitors</p>
							</div>
							<div class="icon">
								<i class="fa fa-fw fa-folder-open"></i>
							</div>
							<a href="#" onclick="doc()" class="small-box-footer"> 서류보기 
								<i class="fa fa-arrow-circle-right">
									<form name="report" action="" method="post">
										<input type="hidden" name="regCont" id="regCont" value="????????" />
									</form>
								</i>
							</a>
						</div>
						<dl class="dl-horizontal" id="reportDetail">
							<dt>서류번호</dt>
							<dd>서류번호 위치</dd>
							<dt>제출일</dt>
							<dd>제출 날짜 위치</dd>
							<dt>결재자1</dt>
							<dd>이름</dd>
							<dd>날짜</dd>
							<dt>기타사항</dt>
							<dd>기타사항 위치</dd>
							<dd>사유</dd>
						</dl>

					</div>
					<div class="modal-footer">
						<c:if test="${title eq '승인대기중'}">
							<button type="button" style="width: 25%" id="modify"
								class="btn btn-primary" onclick="checkReport()">승인</button>

							<button type="button" style="width: 25%" id="modify"
								class="btn btn-primary" onclick="changModal()">반려</button>
						</c:if>
						<button type="button" style="width: 25%" class="btn btn-secondary"
							data-dismiss="modal" onclick="disable()">닫기</button>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
	<div class="modal" id="myModal4" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="disable()">
						<span aria-hidden="true" onclick="disable()">&times;</span>
					</button>
					<h4 class="modal-title">반려</h4>
				</div>
				<div class="modal-body"
					style="min-height: 300px; max-height: 763px;">
					<div id="rollbackinfo" class="info-box bg-yellow">
						<span class="info-box-icon"><i
							class="fa fa-fw fa-folder-open"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">서류번호</span> <span
								class="info-box-number" id ="NOT_report_no">5,200</span>
						</div>

						<!-- /.info-box-content -->
					</div>
					<dl class="dl-horizontal">
						<dt>제목</dt>
						<dd>제목 위치</dd>
						<dt>제출일</dt>
						<dd>제출 날짜 위치</dd>
						<dt>결재자1</dt>
						<dd>이름</dd>
						<dd>날짜</dd>
						<dt>기타사항</dt>
						<dd>기타사항 위치</dd>
						<dd>사유</dd>
					</dl>
					<div class="form-group has-error">
						<label class="control-label" for="inputError"><i
							class="fa fa-times-circle-o"></i>반려사유</label> <input type="text"
							class="form-control" id="inputError" placeholder="Enter ...">
						<span class="help-block">위와같은 이유로 반려합니다</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" style="width: 25%" id="modify"
						class="btn btn-primary" onclick="rollback()">반려</button>
					<button type="button" style="width: 25%" class="btn btn-secondary"
						data-dismiss="modal" onclick="disable()">닫기</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		$("tr:has('td')").click(
						function(event) {
							var data = $(this).parent().children().eq(1).text();
							//var report_no = $("input[name=box]:checked").val();
							var reportNo = $(event.target).parent().attr("ID");
							
							$.ajax({
										type : "POST",
										url : '${pageContext.request.contextPath}/report/selectOne',
										data : {
											"reportNo" : reportNo
										},
										dataType : 'json',
										
										success : function(data) {
											var state = data.regState;
											var v = data.data;
											if (state = "success") {
												$("#NOT_reportNo").html(v.reportNo);
												$("#regCont").val(v.regCont);
												$("#modal3Title").text(
														v.regTitle);
												if (v.regState== 0) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-red");
													$("#rollbackinfo").attr(
															"class",
															"info-box bg-red");
													$("#modal3State").text(
															"반려됨");
												} else if (v.regState== 1) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-blue");
													$("#rollbackinfo").attr(
															"class",
															"info-box bg-blue");
													$("#modal3State").text(
															"등록됨");
												} else if (v.regState== 2) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-yellow");
													$("#rollbackinfo")
															.attr("class",
																	"info-box bg-yellow");
													$("#modal3State").text(
															"처리대기중");
												} else if (v.regState== 3) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-green");
													$("#rollbackinfo")
															.attr("class",
																	"info-box bg-green");
													$("#modal3State").text(
															"처리완료");
												}
												$("#modal3No")
														.text(v.reportNo);

												var html = " <dt>제목</dt>";
												html += "<dd>";
												html += v.regTitle;
												html += "</dd>";
												html += " <dt>서류유형</dt>";
												html += "<dd>";
												html += v.regType;
												html += "</dd>";
												html += "<dt>제출일</dt>";
												html += "<dd>";
												html += v.regDate;
												html += "</dd>";
												if (v.regManager1
														&& v.regUpdate1) {
													html += "<dt>결재자1</dt>";
													html += "<dd>"
															+ v.regManager1
															+ "</dd>";
													html += "<dd>"
															+ v.regUpdate1
															+ "</dd>";
												}
												if (v.regManager2
														&& v.regUpdate2) {
													html += "<dt>결재자2</dt>";
													html += "<dd>"
															+ v.regManager2
															+ "</dd>";
													html += "<dd>"
															+ v.regUpdate2
															+ "</dd>";
												}
												if (v.regManager3
														&& v.regUpdate3) {
													html += "<dt>결재자3</dt>";
													html += "<dd>"
															+ v.regManager3
															+ "</dd>";
													html += "<dd>"
															+ v.regUpdate3
															+ "</dd>";
												}
												if (v.regManager4
														&& v.regUpdate4) {
													html += "<dt>결재자4</dt>";
													html += "<dd>"
															+ v.regManager4
															+ "</dd>";
													html += "<dd>"
															+ v.regUpdate4
															+ "</dd>";
												}
												if (v.regManager5
														&& v.regUpdate5) {
													html += "<dt>결재자5</dt>";
													html += "<dd>"
															+ v.regManager5
															+ "</dd>";
													html += "<dd>"
															+ v.regUpdate5
															+ "</dd>";
												}
												if (v.regComment) {
													html += "<dt>기타사항</dt>";
													html += "<dd>";
													html += v.regComment;
													html += "</dd>";
												}
												if (v.regReason) {
													html += "<dt>반려</dt>";
													html += "<dd>";
													html += v.regReason;
												}
												$("#reportDetail").html(html);

												$('#myModal3').modal();
											} else {
												alert("서류를 가지고 오는데 실패하였습니다")
											}
										},
										error : function(e) {
											alert("제목을 눌러주세요.");
										}
									});
						});

		/*///////////////////////////////////////  */

		$("a[href='#']").click(function(e) {

			e.preventDefault();

		});

	});
	
	/*  window.onload=function(){
		 window.location.reload(true);
		
		} */
	
	
	function reLoad(){
		window.location=location.pathname;
	}
	
	function changModal() {
		$('#myModal3').modal('toggle');
		$('#myModal4').modal();
	}
	function rollback() {
		var datas = {
			"regReason" : $("#inputError").val(),
			"reportNo" : $("#modal3No").text()
		};
		$.ajax({
			type : "POST",
			data : datas,
			url : '${pageContext.request.contextPath}/report/back',
			dataType : 'json',
			success : function(data) {
				if (data.state = "success") {
					alert("성공하셨습니다.")
				}
			},
			error : function(e) {
				alert(e.responseText);
			}
		});

	}
	function checkReport() {
		$.ajax({
			type : "POST",
			data : "num=" + $("#modal3No").text(),
			url : '${pageContext.request.contextPath}/report/check',
			dataType : 'json',
			success : function(data) {
				if (data.state = "success") {
					alert("성공하셨습니다.")
				}
			},
			error : function(e) {
				alert(e.responseText);
			}
		});

	}
	function doc() {
		var frm = document.report;
		var regCont = $("#regCont").val();
		window.open('', 'payviewer', 'top=0,left=0,width='
				+ (screen.availWidth) + ',height=' + (screen.availHeight));
		frm.action = '${pageContext.request.contextPath}/report/convertHTML';
		frm.target = "payviewer";
		frm.method = "post";
		frm.regCont.value = regCont;
		frm.submit();
	}
	
</script>
</html>