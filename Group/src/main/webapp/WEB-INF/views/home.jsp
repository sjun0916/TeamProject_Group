<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="include/headerScript.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<link rel='stylesheet' type='text/css'
	href='<c:url value="assets/css/calendar.css"/>'>
</head>

<%@ include file="include/header.jsp"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->

	<section class="content-header">



		<section class="content">
			<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
		<!--페이지-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		
		<!--페이지-->
		<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="http://cdn.acus.kr/pyungkang/menu/1439799254929458.jpg" style="width:100%; height:250px;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://samoeng.co.kr/introduction/img/banner.jpg" style="width:100%; height:250px;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<div class="item"> 
			<img src="http://www.woosunginc.biz/default/img/pintbox/images/subimg_01.jpg" style="width:100%; height:250px;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://seeqlive.com/image/C_banner_1.png" style="width:100%; height:250px;" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
	</div>
<hr>
		
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Document Approval</h3>
							&emsp;&emsp;<a href="/group/report/waiting"><span class="label label-danger">결재대기: <c:out value="${waitCount}"/></span></a>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									onclick="location.href='/group/report/state'">
									more<i class="fa fa-chevron-circle-right"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
							<table class="table table-hover">
					<tbody>
						<tr>
							<th width="10%">서류번호</th>
							<th width="35%">제목</th>
							<th width="20%">작성일</th>
							<th width="15%">현황</th>
							<th width="20%">사유</th>
						</tr>
						<c:forEach items="${list2}" var="vo">
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
														src="<c:url value="/resources/icon/star.png"/>" width="15"
														height="15" /></td>
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
						<div class="col-md-12">
							<!-- DIRECT CHAT -->
							<div class="box box-warning direct-chat direct-chat-warning">
								<div class="box-header with-border">
									<h3 class="box-title">Board</h3>

									<div class="box-tools pull-right">

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

						<div class="col-md-12">
							<!-- USERS LIST -->
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">Message</h3>

									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											onclick="location.href='/group/message'">
											more<i class="fa fa-chevron-circle-right"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">
									<table class="table table-hover">

										<tr align="center">
											<th width="20%">발신자(사원번호)</th>
											<th width="50%">메세지 내용</th>
											<th width="30%">수신시간</th>

										</tr>
										<c:choose>
											<c:when test="${fn:length(list) > 0}">
												<c:forEach items="${list}" var="row">
													<tr>
														<td>${row.sender }</td>
														<td><a
															href="${pageContext.request.contextPath }/message/view?messageId=${row.messageId}">

																<c:choose>
																	<c:when test="${fn:length(row.message) > 23}">
																		<c:out value="${fn:substring(row.message,0,23)}" />....
							           </c:when>
																	<c:otherwise>
																		<c:out value="${row.message}" />
																	</c:otherwise>
																</c:choose>
														</a></td>
														<td>${row.writeDate }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="3">수신한 쪽지가 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>

									</table>
								</div>
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



					<div class="box box-fault">
						<div class="box-header with-border">
							<h3 class="box-title">Today Schedule</h3>

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
						<div class="box-body">
							
							<table class="table table-hover">
							<tbody>
							<tr>
							    <td><table>
							      <tr bgcolor="#FAF4C0">
							      <td width="10%" align="center"><h4><label>${iTYear}년 ${iTMonth}월 ${iTDay}일</label></h4></td>
							      </tr>
					    		</table></td>
					  		</tr>
					  		<tr>
					  			<td>
					  			<table class="table table-hover">
					  			<tbody>
					  				<c:choose>
												<c:when test="${calList==null}">오늘 일정이 없습니다.</c:when>
												<c:otherwise>
					  					<tr>
											<th width="15%">분류</th>
											<th width="35%">제목</th>
											<th width="25%">시작일</th>
											<th width="25%">종료일</th>
										</tr>
											<c:forEach var="calList" items="${calList}" varStatus="status">
													<tr>
														<td><c:out value="${calList.calendar_kind}"/></td>
														<td><c:out value="${calList.calendar_title}"/></td>
														<td><fmt:formatDate value="${calList.calendar_start}" pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${calList.calendar_end}" pattern="yyyy-MM-dd" /></td>
													</tr>
												</c:forEach>
											
										</c:otherwise>
										</c:choose>
									</tbody>
					  			</table>
					  			</td>
					  		</tr>
					  		</tbody>
							</table>
							</div>
						<!-- /.box-body -->

					</div>


					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Calendar</h3>

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
						<div class="box-body">
							<div class="row">
								<form id="monthView" name="monthView" action="home" method="post">
									<input type="hidden" name="year" value="${iYear}">
									<input type="hidden" name="month" value="${iMonth}">
									<table class="tTable">
										<tr>
											<td><table class="tTable">
													<tr>
														<c:url value="/home" var="prevMonth">
															<c:param name="iYear" value="${iYear}"/>
															<c:param name="iMonth" value="${iMonth }"/>
															<c:param name="option" value="prev"/>
														</c:url>
														<td><a href="${prevMonth}" ><input type="button" class="btn btn-primary btn-xs" value="이전달" ></a></td>
														<td class="tMonth"><h3>&nbsp;${iYear}년
																${iMonth}월&nbsp;</h3></td>
															<c:url value="/home" var="nextMonth">
																<c:param name="iYear" value="${iYear}"/>
																<c:param name="iMonth" value="${iMonth }"/>
																<c:param name="option" value="next"/>
															</c:url>
														<td><a href="${nextMonth}" ><input type="button" class="btn btn-primary btn-xs" value="다음달"></a></td>
														
													</tr>
												</table></td>
										<tr>
											<td><table class="table table-hover">
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
					</div>
					</div>
					<!-- /.box -->
					</div>

		</section>


	</section>
</div>

<%@ include file="include/footer.jsp"%>
<%@ include file="include/footerScript.jsp"%>
</body>
</html>