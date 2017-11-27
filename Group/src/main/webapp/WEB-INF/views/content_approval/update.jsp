<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			서류관리 <small>서류작성하기</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Report</a></li>
			<li class="active">Make</li>
		</ol>
	</section>

	<!-- Main content -->

		<!-- /.box-header -->
		<div class="box-body">
			<form name='report'  onsubmit="return false;" method="post">
				<!-- select -->
				<div class="box box-solid">
					<!-- /.box-header -->
					<div class="box-body">
						<div class="box-group" id="accordion">
							<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne" aria-expanded="false" class="collapsed">
											결제 절차 확인 </a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse"
									aria-expanded="false" style="height: 0px;">
									<div class="box-body">
										<div class="form-group">
											<label>결재인원 체크</label> <select id="submissionPersonnel"
												class="form-control">
												<option value="1">단순 제출용(1명)</option>
												<option value="2">2명</option>
												<option value="3">3명</option>
												<option value="4">4명</option>
												<option value="5">5명</option>
											</select>
											
											<div id="Personnel">
												<div class="form-group">
													<label>결제자1</label> <select
														class="form-control select2 select2-hidden-accessible"
														name="reg_manager1"
														style="width: 100%;" tabindex="-1" aria-hidden="true">
														<c:forEach items="${memberList}" var="vo">
														<option value="${vo.member_enum}">[${vo.dep_name}]${vo.member_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel box box-danger">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo" class="collapsed" aria-expanded="false">
											결제 서류 선택 </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									aria-expanded="false" style="height: 0px;">
									<div class="box-body">
										<div class="form-group">
											<label>서류 제목</label> <input type="text" id="reg_title" name="reg_title" class="form-control"
												placeholder="제목을 입력하세요">
										</div>
										<div class="form-group">
											<select class="form-control" id="type">
												<c:forEach items="${reportList}" var="fileName" >
													<option value="${fileName}">${fileName}</option>
												</c:forEach>
												<input type="hidden" id="reg_type" name="reg_type" value="${reportList.get(0)}"/>
												<input type="hidden" id="reg_labelnum" name="reg_labelnum" value="${reportList.get(0)}"/>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="panel box box-success">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree" class="collapsed" aria-expanded="false">
											기타 참고사항 </a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									aria-expanded="false" style="height: 0px;">
									<div class="box-body">
									<label>라벨</label> <select id="reg_labe"
												class="form-control">
												<option value="0">없음</option>
											<c:forEach var="vo" items="${labelList}">
												<option value="${vo.label_num}">${vo.label_name}</option>
											</c:forEach>
											
											</select>
										<div class="form-group">
										<label>commnet</label>
											<textarea name="comment" class="form-control" rows="3"
												placeholder="Enter ..."></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<input type="button" class="btn btn-block btn-primary btn-flat"
					value="작성" onclick="writeReport()" />
			</form>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.content -->

<script type="text/javascript">
var title;
	function writeReport() {
		var e = document.getElementById("type");
		var f = document.getElementById("reg_labe");
		var reportType = e.options[e.selectedIndex].value;
		var labelNum = f.options[f.selectedIndex].text;
		var labelName = f.options[f.selectedIndex].value;
		document.getElementById("reg_type").value=reportType;
		document.getElementById("reg_labelnum").value=labelName;
		if($("#reg_title").val().trim()!=""){
		var gsWin = window
				.open('about:blank',
						'payviewer',
						'top=0,left=0,width='
								+ (screen.availWidth)
								+ ',height='
								+ (screen.availHeight)
// 								+ ',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1'
								);
		var frm = document.report;
 		frm.action = '${pageContext.request.contextPath}/report/select/'+ reportType;
		frm.target = "payviewer";
		frm.method = "get";
		frm.submit();
		}else{
			alert("제목을 입력하세요");
		}
	}
	$(function() {
		$('#submissionPersonnel')
				.change(
						function() {
							var personnel = $(
									'#submissionPersonnel option:selected')
									.val();
							var htmlCode = '';
							for (var i = 0; i < personnel; i++) {
								htmlCode += '<div class="form-group">';
								htmlCode += '<label>결제자' + (i + 1) + '</label>';
								htmlCode += '<select name="reg_manager'+(i+1)+'" class="form-control select2 select2-hidden-accessible" style="width: 100%;" tabindex="-1" aria-hidden="true">';
								<c:forEach items="${memberList}" var="vo">
								htmlCode +='<option value="${vo.member_enum}">[${vo.dep_name}]${vo.member_name}</option>';
								</c:forEach>
								htmlCode += '</select>';
							}
							$("#Personnel").html(htmlCode);
							$(".select2").select2();
						});
		$(".select2").select2();

	})
</script>
<!-- Select2 -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/select2/select2.full.min.js"></script>
