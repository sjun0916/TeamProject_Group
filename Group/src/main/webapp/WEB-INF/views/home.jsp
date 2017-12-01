<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="include/headerScript.jsp"%>
</head>

<%@ include file="include/header.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/divCSS/div.css"/>'>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/mainNotice.css"/>'>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content 헤더 -->
	<section class="content-header">
		<h1>
			Home <small>메인페이지 입니다.</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Content 메인 -->
	<section class="content container-fluid">
		내용 <br> <br> <br>



		<div id="notice">
			<h2>공지사항</h2>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp; <a href="NoticeList">more</a>
			<form id="form1" name="form1" method="post">
				<table class="notice">
					<colgroup>
						<col width='8%' />
						<col width='*%' />
						<col width='20%' />
						<col width='20%' />
						<col width='10%' />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>첨부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listview" items="${listview2}" varStatus="loop">
							<c:url var="link" value="NoticeRead">
								<c:param name="noticenum" value="${listview.noticenum}" />
							</c:url>
							<tr>
								<td><img src="<c:url value="/resources/icon/star.png"/>"
									width="20" height="20" /></td>
								<td><a href="${link}"><b><c:out
												value="${listview.title}" /></b></a></td>
								<td><c:if test="${listview.writerpos!=null}">
							[<c:out value="${listview.writerpos}" />]
							</c:if> <c:out value="${listview.writer}" /></td>
								<td><c:out value="${listview.regdate}" /></td>
								<td><c:if test="${listview.filecnt>0}">
										<img src="<c:url value="/resources/icon/floppy-disk.png"/>"
											width="20" height="20" />
									</c:if></td>
							</tr>
						</c:forEach>
						<c:forEach var="listview" items="${listview3}" varStatus="loop">
							<c:url var="link" value="NoticeRead">
								<c:param name="noticenum" value="${listview.noticenum}" />
							</c:url>
							<tr>
								<td><c:out value="${listview.noticenum}" /></td>
								<td><a href="${link}"><c:out value="${listview.title}" /></a></td>
								<td><c:if test="${listview.writerpos!=null}">
							[<c:out value="${listview.writerpos}" />]
							</c:if> <c:out value="${listview.writer}" /></td>
								<td><c:out value="${listview.regdate}" /></td>
								<td><c:if test="${listview.filecnt>0}">
										<img src="<c:url value="/resources/icon/floppy-disk.png"/>"
											width="20" height="20" />
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>

		<div id=photo>
			<h2>사진첩</h2>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp; <a href="PhotoList">more</a>
			<form id="form2" name="form2" method="post">
				<table width="450">

					<c:forEach var="listview" items="${listview4}" varStatus="status">
						<c:url var="link" value="PhotoRead">
							<c:param name="photonum" value="${listview.photonum}" />
						</c:url>
						<tr>
							<td colspan="2"><img
								src="\group\imgUpload\2017\<c:out value="${listview.realname}"/>"
								width="400" height="300" /></td>
						</tr>
						<tr>
						<td>제목:&nbsp;<a href="${link}"><c:out value="${listview.title}" /></a>
						</td>
						<td>작성자:&nbsp;[<c:out value="${listview.departname}"/>]
						<c:out value="${listview.writer}"/></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>


	</section>
</div>

<%@ include file="include/footer.jsp"%>
<%@ include file="include/footerScript.jsp"%>
</body>
</html>