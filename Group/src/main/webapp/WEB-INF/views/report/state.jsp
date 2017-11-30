<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
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
			Report <small>State panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> report</a></li>
			<li class="active">state</li>
		</ol>
	</section>
	<br>
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">${title}</h3>

				<div class="box-tools" style="padding: 0px; text-align: right; float: left">
					<%-- <div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
							라벨 편집 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a class="sjgfont" href="#" id="labelConnect"><i class="fa fa-tag"></i>문서에 라벨지정</a></li>
							<li><a class="sjgfont" href="#" id="labelDisConnect"><i class="fa fa-minus-square"></i>문서에서 라벨제거</a></li>
							<li><a class="sjgfont" href="${pageContext.request.contextPath}/label/select"><i class="fa fa-gear"></i>라벨 관리</a></li>
						</ul>
					</div> --%>

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
							<th><input type="checkbox" name="firstbox" id="checkAll" value="" /></th>
							<th>서류번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>현황</th>
							<th>사유</th>
						</tr>
						<c:forEach items="${list}" var="vo">
							<tr>
								<td><input type="checkbox" name="box" value="${vo.report_no}" /></td>
								<td>${vo.report_no}</td>
								<td>${vo.reg_title}</td>
								<td>${vo.reg_date}</td>
								<td><c:if test="${vo.reg_state eq 0}">
										<span class="label label-danger">반려됨</span>
									</c:if> <c:if test="${vo.reg_state eq 1}">
										<span class="label label-primary">등록 완료</span>
									</c:if> <c:if test="${vo.reg_state eq 2}">
										<span class="label label-warning">처리중</span>
									</c:if> <c:if test="${vo.reg_state eq 3}">
										<span class="label label-success">처리완료</span>
									</c:if></td>
								<td>${vo.reg_reason}</td>
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
							<a href="#" onclick="doc()" class="small-box-footer"> 서류보기 <i
								class="fa fa-arrow-circle-right">
									<form name="report" action="" method="post">
										<input type="hidden" name="reg_cont" id="reg_cont"
											value="????????" />
									</form>
							</i>
							</a>
						</div>
						<dl class="dl-horizontal" id="reportDetail">
							<dt>서류번호</dt>
							<dd>서류번호 위치</dd>
							<dt>제출일</dt>
							<dd>제출 날짜 위치</dd>
							<dt>결제자1</dt>
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
						<dt>결제자1</dt>
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

<!--라벨 지정 모달  -->
<div class="example-modal">
	<div class="modal" id="myModalPlus" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="inputLabel"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">문서에 라벨지정</h4>
				</div>
				<div class="modal-body"
					style="min-height: 200px; max-height: 763px;">
					<div style="margin-top: 25px;" class="margin-top-30">
						<strong>아래에서 선택한 라벨이 문서에 지정됩니다.</strong>
					</div>
					<!--               	<input type="text" autofocus id="label_name" placeholder="라벨명" class="form-control"> -->
					<!-- 					<input type="hidden" id="labeldeletenum" value=""> -->
					<!-- 					<input type="hidden" id="labeldeletegnum" value=""> -->
					<!-- 					<input type="hidden" id=labeldeleteonum value=""> -->
					<!-- 					<input type="hidden" id=labeldeletename value=""> -->
					<!-- 					<input type="hidden" id=labeldeletedocu value=""> -->
					<div style="margin-top: 20px;"></div>
					<div style="margin-bottom: 30px; clear: both;">
						<div class="box-footer no-padding" style="margin-top: 10px;">
							<ul class="nav nav-stacked modalscroll" id="modalulPlus">



								<c:forEach items="${labellist}" var="y" varStatus="status">

									<li><c:if test="${y.label_onum eq 0 }">
											<a class="disableLabel" id="LabelSequencePlus${status.count}"
												href="${y.label_num}" disabled="disabled"> <span
												class="label"
												style="background-color: ${y.label_color}; vertical-align: middle; margin-right: 10px;">
											</span> <span class="highlabelName">${y.label_name}</span>
											</a>
										</c:if> <c:if test="${y.label_onum eq 1 }">
											<a class="disableLabel" style="margin-left: 4%;"
												id="LabelSequencePlus${status.count}" href="${y.label_num}"
												disabled="disabled"> <span class="label"
												style="background-color: ${y.label_color}; vertical-align: middle; margin-right: 10px;">
											</span> <span class="highlabelName">${y.label_name}</span>
											</a>
										</c:if></li>
								</c:forEach>



							</ul>


						</div>


					</div>


				</div>
				<div class="modal-footer">
					<button type="button" id="savePlus" style="width: 22%;"
						class="btn btn-wide btn-o btn-info">적용</button>
					<button type="button" style="width: 22%;"
						class="btn btn-wide btn-main" data-dismiss="modal">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		$("tr:has('td')").children().not(':first-child').click(
						function() {
							var data = $(this).parent().children().eq(1).text();
							$
									.ajax({
										type : "POST",
										url : '${pageContext.request.contextPath}/report/selectOne',
										data : {
											"data" : data
										},
										dataType : 'json',
										success : function(data) {
											var state = data.state;
											var v = data.data;
											if (state = "success") {
												$("#NOT_report_no").html(v.report_no);
												$("#reg_cont").val(v.reg_cont);
												$("#modal3Title").text(
														v.reg_title);
												if (v.reg_state == 0) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-red");
													$("#rollbackinfo").attr(
															"class",
															"info-box bg-red");
													$("#modal3State").text(
															"반려됨");
												} else if (v.reg_state == 1) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-blue");
													$("#rollbackinfo").attr(
															"class",
															"info-box bg-blue");
													$("#modal3State").text(
															"등록됨");
												} else if (v.reg_state == 2) {
													$("#modal3StateColor")
															.attr("class",
																	"small-box bg-yellow");
													$("#rollbackinfo")
															.attr("class",
																	"info-box bg-yellow");
													$("#modal3State").text(
															"처리대기중");
												} else if (v.reg_state == 3) {
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
														.text(v.report_no);

												var html = " <dt>제목</dt>";
												html += "<dd>";
												html += v.reg_title;
												html += "</dd>";
												html += " <dt>서류유형</dt>";
												html += "<dd>";
												html += v.reg_type;
												html += "</dd>";
												html += "<dt>제출일</dt>";
												html += "<dd>";
												html += v.reg_register;
												html += "</dd>";
												if (v.reg_manager1
														&& v.reg_update1) {
													html += "<dt>결제자1</dt>";
													html += "<dd>"
															+ v.reg_manager1
															+ "</dd>";
													html += "<dd>"
															+ v.reg_update1
															+ "</dd>";
												}
												if (v.reg_manager2
														&& v.reg_update2) {
													html += "<dt>결제자2</dt>";
													html += "<dd>"
															+ v.reg_manager2
															+ "</dd>";
													html += "<dd>"
															+ v.reg_update2
															+ "</dd>";
												}
												if (v.reg_manager3
														&& v.reg_update3) {
													html += "<dt>결제자3</dt>";
													html += "<dd>"
															+ v.reg_manager3
															+ "</dd>";
													html += "<dd>"
															+ v.reg_update3
															+ "</dd>";
												}
												if (v.reg_manager4
														&& v.reg_update4) {
													html += "<dt>결제자4</dt>";
													html += "<dd>"
															+ v.reg_manager4
															+ "</dd>";
													html += "<dd>"
															+ v.reg_update4
															+ "</dd>";
												}
												if (v.reg_manager5
														&& v.reg_update5) {
													html += "<dt>결제자5</dt>";
													html += "<dd>"
															+ v.reg_manager5
															+ "</dd>";
													html += "<dd>"
															+ v.reg_update5
															+ "</dd>";
												}
												if (v.comment) {
													html += "<dt>기타사항</dt>";
													html += "<dd>";
													html += v.comment;
													html += "</dd>";
												}
												if (v.reg_reason) {
													html += "<dt>반려</dt>";
													html += "<dd>";
													html += v.reg_reason;
												}
												$("#reportDetail").html(html);

												$('#myModal3').modal();
											} else {
												alert("서류를 가지고 오는데 실패하였습니다")
											}
										},
										error : function(e) {
											alert(e.responseText);
										}
									});
						});

		/*///////////////////////////////////////  */

		$("a[href='#']").click(function(e) {

			e.preventDefault();

		});

		$("a[id^='LabelSequencePlus']").click(function(e) {
			e.preventDefault();
		});

		$(".disableLabel").click(function() {

			if ($("a[id^='LabelSequencePlus']").hasClass("checked")) {

				$(".disableLabel").removeClass("checked");

				$(this).toggleClass("checked");

			} else {

				$(this).toggleClass("checked");
			}

		});

		$("#checkAll").click(function() {

			if ($("input:checkbox[id='checkAll']").is(":checked")) {
				$("input[name=box]:checkbox").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("input[name=box]:checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}

		});
		$("#labelConnect")
				.click(
						function() {

							if ($("input[name=box]:checked").length == 0) {

								alert("문서를 선택해주세요.");

							}

							$("input[name=box]:checked")
									.each(
											function(i) {

												var repno = $(this).val();
												var index = i+1;
												
												$('#myModalPlus').modal();

												$("#savePlus").click(function() {
												var parentnum = 0;
/* 
												if ($(".disableLabel").hasClass("checked")) {
												//highname =$(".checked").text().trim();
												parentnum = $(".disableLabel.checked").attr("href");
												
												$.ajax({'url' : '${pageContext.request.contextPath}/report/updatelabelnum',
														'type' : 'post',
														'data' : {
														'label_num' : parentnum,
														'report_no' : repno
														},
														'success' : function(data) {
														
															reLoad();
														
														},

															'dataType' : 'json'

													})

													$(this).attr("data-dismiss","modal");
												
													} else {
															alert("반드시 라벨을 선택해야 합니다");
													$(this).attr("data-dismiss","modal");
													}
 */
												$("input[name$=box]:checkbox").each(function() {
													$(this).attr("checked",false);
													
													
												});
											});
												
									});

						});

		$("#labelDisConnect").click(function() {

			if ($("input[name=box]:checked").length == 0) {

				alert("문서를 선택해주세요.");

			}
			
				
			
			
			
			
			$("input[name=box]:checked").each(function(i) {
				var repno = $(this).val();
				var index = i+1;
			
				$.ajax({'url' : '${pageContext.request.contextPath}/report/updatelabelnum22',
					'type' : 'post',
					'data' : {
					
					'report_no' : repno
					},
					'success' : function(data) {
						
						reLoad();
					
						
					},

						'dataType' : 'json'

				})
						
				
				
				
				
				
			});

			
			
			$("input[name$=box]:checkbox").each(function() {
				$(this).attr("checked",false);
				
				
			});
			
			
			
			
		});

		$('[data-dismiss=modal]').on(
				'click',
				function(e) {
					
					
					$(".disableLabel").removeClass("checked");

					var $t = $(this), target = $t[0].href || $t.data("target")
							|| $t.parents('.modal') || [];

					$(target).find("input,textarea,select").val('').end().find(
							"input[type=checkbox], input[type=radio]").prop(
							"checked", "").end();

				})

		if ($("#LabelSequencePlus13").length > 0) {
			$(".modalscroll").css("height", "43em")

		}

		/*///////////////////////////////////////  */
	
		
	});
	
	/*  window.onload=function(){
		 window.location.reload(true);
		
		} */
	
	
	function reLoad(){
		//window.locaion.reload();
		window.location=location.pathname;
	}
	
	function changModal() {
		$('#myModal3').modal('toggle');
		$('#myModal4').modal();
	}
	function rollback() {
		var datas = {
			"reg_reason" : $("#inputError").val(),
			"report_no" : $("#modal3No").text()
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
		var reg_cont = $("#reg_cont").val();
		window.open('', 'payviewer', 'top=0,left=0,width='
				+ (screen.availWidth) + ',height=' + (screen.availHeight));
		frm.action = '${pageContext.request.contextPath}/report/convertHTML';
		frm.target = "payviewer";
		frm.method = "post";
		frm.reg_cont.value = reg_cont;
		frm.submit();
	}
	
</script>
</html>