<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="include/headerScript.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<link rel='stylesheet' type='text/css'
	href='<c:url value="assets/css/calendar.css"/>'>
<script>
	// 	calendar submit()
	function goTo() {
		document.getElementbyId("monthView").submit();
	}
</script>
</head>

<%@ include file="include/header.jsp"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->

	<section class="content-header">


		<%-- 		<img src="${pageContext.request.contextPath}/resources/icon/rian.jpg" width="100%" height="300px"> --%>


		<section class="content">

			<div
				style="background-image: url('${pageContext.request.contextPath}/resources/icon/rian.jpg'); width:100%; height:300px;">
				회사이미지 / 설명 등등</div>
			<hr>

			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Document Approval</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">내용</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<div class="col-md-8">
					<!-- MAP & BOX PANE -->
					<div class="box box-success">
						<div class="box-header with-border">
							<h3 class="box-title">Notice</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/NoticeList'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<div class="row">

								<div id="notice">
									
										<table class="table table-hover">
											<tbody>
												<tr>
													<th width="10%">번호</th>
													<th width="35%">제목</th>
													<th width="15%">작성자</th>
													<th width="15%">작성일</th>
													<th width="10%">첨부</th>
												</tr>
												<c:forEach var="listview" items="${listview2}"
													varStatus="loop">
													<c:url var="link" value="NoticeRead">
														<c:param name="noticenum" value="${listview.noticenum}" />
													</c:url>
													<tr>
														<td><img
															src="<c:url value="/resources/icon/star.png"/>"
															width="15" height="15" /></td>
														<td><a href="${link}"><b><c:out
																		value="${listview.title}" /></b></a></td>
														<td><c:if test="${listview.writerpos!=null}">
									[<c:out value="${listview.writerpos}" />]
									</c:if> <c:out value="${listview.writer}" /></td>
														<td><c:out value="${listview.regdate}" /></td>
														<td><c:if test="${listview.filecnt>0}">
																<img
																	src="<c:url value="/resources/icon/floppy-disk.png"/>"
																	width="15" height="15" />
															</c:if></td>
													</tr>
												</c:forEach>
												<c:forEach var="listview" items="${listview3}"
													varStatus="loop">
													<c:url var="link" value="NoticeRead">
														<c:param name="noticenum" value="${listview.noticenum}" />
													</c:url>
													<tr>
														<td><c:out value="${listview.noticenum}" /></td>
														<td><a href="${link}"><c:out
																	value="${listview.title}" /></a></td>
														<td><c:if test="${listview.writerpos!=null}">
									[<c:out value="${listview.writerpos}" />]
									</c:if> <c:out value="${listview.writer}" /></td>
														<td><c:out value="${listview.regdate}" /></td>
														<td><c:if test="${listview.filecnt>0}">
																<img
																	src="<c:url value="/resources/icon/floppy-disk.png"/>"
																	width="15" height="15" />
															</c:if></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<br>
	
								</div>


								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->


					<div class="row">
						<div class="col-md-6">
							<!-- DIRECT CHAT -->
							<div class="box box-warning direct-chat direct-chat-warning">
								<div class="box-header with-border">
									<h3 class="box-title">Board</h3>

									<div class="box-tools pull-right">
										<span data-toggle="tooltip" title="" class="badge bg-yellow"
											data-original-title="3 New Messages">3</span>

										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											onclick="location.href='/group/BoardList'">
											more<i class="fa fa-chevron-circle-right"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->

								<table class="table table-hover">
									<tr>
										<th width="10%">번호</th>
										<th width="35%">제목</th>
										<th width="15%">작성자</th>
										<th width="15%">작성일</th>
										<th width="10%">첨부</th>
									</tr>
									<c:forEach var="listview" items="${listview5}" varStatus="loop">
										<c:url var="link" value="BoardRead">
											<c:param name="boardnum" value="${listview.boardnum}" />
										</c:url>
										<tr>
											<td><c:out value="${listview.boardnum}" /></td>
											<td><a href="${link}"><c:out
														value="${listview.title}" /></a> <c:if
													test="${listview.replycnt>0}">(<c:out
														value="${listview.replycnt}" />)</c:if></td>
											<td><c:if test="${listview.writerpos!=null}">
									[<c:out value="${listview.writerpos}" />]
									</c:if> <c:out value="${listview.writer}" /></td>
											<td><c:out value="${listview.regdate}" /></td>
											<td><c:if test="${listview.filecnt>0}">
													<img src="<c:url value="/resources/icon/floppy-disk.png"/>"
														width="15" height="15" />
												</c:if></td>
										</tr>
									</c:forEach>
								</table>

								<!-- /.box-body -->

							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->

						<div class="col-md-6">
							<!-- USERS LIST -->
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">Message</h3>

									<div class="box-tools pull-right">
										<span class="label label-danger">8 </span>
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											onclick="location.href='/group/'">
											more<i class="fa fa-chevron-circle-right"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">쪽지 3개출력</div>
								<!-- /.box-body -->

							</div>
							<!--/.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- TABLE: LATEST ORDERS -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">Photograph Album</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/PhotoList'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<form id="form2" name="form2" method="post">
									<table>
										<tr>
											<c:forEach var="listview" items="${listview4}"
												varStatus="status">
												<c:url var="link" value="PhotoRead">
													<c:param name="photonum" value="${listview.photonum}" />
												</c:url>

												<td width="150"><img
													src="\group\imgUpload\2017\<c:out value="${listview.realname}"/>"
													width="100" height="90" /><br> <small>제목:&nbsp;<a
														href="${link}"><c:out value="${listview.title}" /></a></small> <br>
													<small>[<c:out value="${listview.departname}" />]
														<c:out value="${listview.writer}" /></small></td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


											</c:forEach>
										</tr>
									</table>
								</form>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->

				<div class="col-md-4">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Calendar</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
								<form id="monthView" name="monthView">
									<table class="tTable" width="100%">
										<tr>
											<td><table class="tTable">
													<tr>
														<td class="tMonth"><h3>&nbsp;${iYear}년
																${iMonth}월&nbsp;</h3></td>
													</tr>
												</table></td>
										<tr>
											<td><table class="tTable">
													<tbody>
														<tr>
															<th>Sun</th>
															<th>Mon</th>
															<th>Tue</th>
															<th>Wed</th>
															<th>Thu</th>
															<th>Fri</th>
															<th>Sat</th>
														</tr>
														<c:set var="cnt" value="1" />
														<c:forEach var="i" begin="1" end="${iTotalweeks}" step="1"
															varStatus="loop">
															<tr>
																<c:forEach var="j" begin="1" end="7" step="1"
																	varStatus="loop2">
																	<c:choose>
																		<c:when
																			test="${cnt<weekStartDay || (cnt-weekStartDay+1)>days}">
																			<td align="center" height="35">&nbsp;</td>
																		</c:when>
																		<c:otherwise>
																			<td align="center" height="35"
																				id="day_${cnt-weekStartDay+1}"><span>${cnt-weekStartDay+1}</span><br>
																			</td>
																		</c:otherwise>
																	</c:choose>
																	<input type="hidden" value="${cnt=cnt+1}">
																</c:forEach>
															</tr>
														</c:forEach>
													</tbody>
												</table></td>
										</tr>
									</table>
								</form>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.box-body -->



						<!-- /.footer -->
					</div>
					<!-- /.box -->


					<div class="box box-warning direct-chat direct-chat-warning">
						<div class="box-header with-border">
							<h3 class="box-title">Weather</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/calendar/main'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">날씨api</div>
						<!-- /.box-body -->


					</div>


					<div class="box box-fault">
						<div class="box-header with-border">
							<h3 class="box-title">?</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">?</div>
						<!-- /.box-body -->

					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->




			</div>
			<!-- /.row -->

		</section>



	</section>
</div>

<%@ include file="include/footer.jsp"%>
<%@ include file="include/footerScript.jsp"%>
</body>
</html>