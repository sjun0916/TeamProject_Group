<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Report <small>out</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> report</a></li>
			<li class="active">state</li>
		</ol>
	</section>
	<!-- 여기에 적기 -->
	<section class="content">
		<div class="row">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title"></h3>

					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" id="keyword" name="table_search"
								class="form-control pull-right" placeholder="Search">
							<div class="input-group-btn">
								<button type="button" onclick="searchReport()"
									class="btn btn-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody id="resultReport">
							<tr>
								<th>서류번호</th>
								<th>신청자</th>
								<th>신청상태</th>
								<c:if test="${page eq 'check'}">
									<th>신청사유</th>
									<th></th>
									<th></th>
								</c:if>
								<c:if test="${page eq 'state'}">
									<th>기타사항</th>
								</c:if>
							</tr>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.report_no}</td>
									<td>${vo.reg_id}</td>

									<c:if test="${page eq 'state'}">
										<td><c:choose>
												<c:when test="${vo.reg_result eq '0'}">
													<span class="label label-danger">반려</span>
												</c:when>
												<c:when test="${vo.reg_result eq '1'}">
													<span class="label label-warning">등록</span>
												</c:when>
												<c:when test="${vo.reg_result eq '2'}">
													<span class="label label-primary">승인</span>
												</c:when>
											</c:choose></td>
									</c:if>
									<c:if test="${page eq 'check'}">
										<div class="btn-group">
											<td><input type="button"
												onclick="ReportAgree('${vo.report_no}','${vo.reg_id}','${vo.connect_no}')"
												class="btn btn-inline btn-info btn-xs" value="허가"><input
												type="button"
												onclick="ReportDisAgree('${vo.report_no}','${vo.reg_id}','${vo.connect_no}')"
												class="btn btn-inline btn-default btn-xs" value="취소">
											</td>
											<td>${vo.reg_reason}</td>
										</div>
									</c:if>
									<c:if test="${page eq 'state'}">
										<td><c:choose>
												<c:when test="${vo.reg_result eq '2'}">
													<input type="button" onclick="openReport(${vo.report_no})"
														class="btn btn-info btn-xs" value="서류보기">
												</c:when>
												<c:when test="${vo.reg_result eq '0'}">${vo.reg_cancel}</c:when>
												<c:otherwise>처리 대기중</c:otherwise>
											</c:choose></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
			</div>

		</div>
	</section>
	<form name="goto" action="" method="post">
			<input type="hidden" id="reportNo" name="report_no"> 
			<input type="hidden" id="id" name="reg_id"> 
			<input type="hidden" id="cancel" name="reg_cancel">
			<input type="hidden" id="connect_no" name="connect_no"> 
	</form>
</div>
<div class="example-modal">
	<div class="modal" id="myModal3" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="disable()">
						<span aria-hidden="true" onclick="disable()">&times;</span>
					</button>
					<h4 class="modal-title" id="modal3Title"></h4>
				</div>
				<div class="modal-body"
					style="min-height: 300px; max-height: 763px;">
					<div id="modal3StateColor" class="small-box bg-red">
						<div class="inner">
							<h3 id="modal3State">65</h3>

							<p id="modal3No">Unique Visitors</p>
						</div>
						<div class="icon">
							<i class="fa fa-fw fa-folder-open"></i>
						</div>



					</div>
					<dl class="dl-horizontal" id="reportDetail">
					</dl>
					<div class="form-group">
						<label>신청사유</label> <input type="text" id="reason"
							class="form-control" placeholder="신청사유를 입력하세요">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" style="width: 25%" id="modify"
						class="btn btn-primary" onclick="applyReport()">신청</button>
					<button type="button" style="width: 25%" class="btn btn-secondary"
						data-dismiss="modal" onclick="disable()">닫기</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>
<c:if test="${page eq 'main'}">
	<script type="text/javascript">
		$(function() {
			$(document).on(
							"click",
							"table tr td",
							function() {
								$('#myModal3 #modal3No').text(
										$(this).parent().children().eq(0)
												.text());
								$('#myModal3 #modal3State').text(
										$(this).parent().children().eq(1)
												.text());
								var detail = '';
								detail += "<dt>서류번호</dt>";
								detail += "<dd>"
										+ $(this).parent().children().eq(0)
												.text() + "</dd>";
								detail += "<dt>제목</dt>";
								detail += "<dd>"
										+ $(this).parent().children().eq(1)
												.text() + "</dd>";
								detail += "<dt>등록자</dt>";
								detail += "<dd>"
										+ $(this).parent().children().eq(2)
												.text() + "</dd>";
								detail += "<dt>등록일</dt>";
								detail += "<dd>"
										+ $(this).parent().children().eq(3)
												.text() + "</dd>";
								$('#myModal3 #reportDetail').html(detail);

								if ($(this).parent().children().eq(4).text() == "승인완료") {
									$('#myModal3 #modal3StateColor').attr(
											"class", "small-box bg-green");
								}
								if ($(this).parent().children().eq(4).text() == "반려") {
									$('#myModal3 #modal3StateColor').attr(
											"class", "small-box bg-red");
								}
								$('#myModal3 #reportDetail').html();
								$('#myModal3').modal();

							});
		});
		function searchReport() {

			$
					.ajax({
						type : "get",
						url : "${pageContext.request.contextPath}/report/out/search",
						data : {
							"reprt_No" : $("#keyword").val()
						},
						success : function(data) {
							var datas = data.data;
							var htmlCode = "<tr><th>서류번호</th><th>제목</th><th>등록자</th><th>등록일</th><th>상태</th></tr>";
							if (data.state = "success") {
								$
										.each(
												datas,
												function(i, v) {
													htmlCode += "<tr><td>"
															+ v.report_no
															+ "</td><td>"
															+ v.reg_title
															+ "</td><td>"
															+ v.reg_id
															+ "</td><td>"
															+ v.reg_register
															+ "</td><td>";
													if (v.reg_state == 0) {
														htmlCode += "<span class='label label-danger'>반려</span>"
													}
													if (v.reg_state == 3) {
														htmlCode += "<span class='label label-success'>승인완료</span>"
													}
													htmlCode += "</td></tr>"
												});
								$("#resultReport").html(htmlCode);
							}
						}
					});

		}
		function applyReport() {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/report/out/apply",
				data : {
					"report_no" : $('#myModal3 #modal3No').text(),
					"reg_reason" : $('#reason').val()
				},
				success : function(data) {

				}

			});

	
	}
	</script>
</c:if>
<c:if test="${page eq 'check'}">
	<script>
function ReportAgree(reportNo,id,connect_no){
	document.goto.action="${pageContext.request.contextPath}/report/out/agree";
	document.getElementById("reportNo").value =reportNo;
	document.getElementById("connect_no").value =connect_no;
	
	document.getElementById("id").value=id;
	document.goto.submit();
}
function ReportDisAgree(reportNo,id,connect_no){
	document.goto.action="${pageContext.request.contextPath}/report/out/disagree";
	var reason = prompt("취소사유를 입력해주세요", "보안상 거부");
	if(reason!=null){
	document.getElementById("cancel").value =reason;
	document.getElementById("reportNo").value =reportNo;
	document.getElementById("connect_no").value =connect_no;

	document.getElementById("id").value=id;
	document.goto.submit();
	}
	else{
		alert("취소 사유를 입력해주세요")
	}
}
</script>
</c:if>

<c:if test="${page eq 'state'}">
	<script>
	function openReport(report_no){
	
		 var wX = screen.availWidth;
		 var wY = screen.availHeight;
		 var url ="${pageContext.request.contextPath}/report/out/detatilReport/"+report_no;
		 wY = (wY-38);
		var winIntro = window.open(url,"서류보기","width="+ wX + ", height="+ wY + ", scrollbars=no, status=yes,scrollbars=no,  resizable=yes, direction=yes, location=no,menubar=no, toolbar=no, titlebar=yes");
		winIntro.focus();	
	}
	
	
</script>
</c:if>