<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>GroupWare_Home</title>
<head>
	<%@ include file="include/headerScript.jsp" %>
</head>

    <%@ include file="include/header.jsp" %>

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
    		내용
    		
    		공지사항 <a href="NoticeList">게시판</a>		
    		<form id="form1" name="form1" method="post">
			<table >			
				<colgroup>
					<col width='8%' />
					<col width='*%' />
					<col width='15%' />
					<col width='15%' />
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
							<td><img src="<c:url value="/resources/icon/star.png"/>" width="25" height="25"/></td>
							<td><a href="${link}"><b><c:out
										value="${listview.title}" /></b></a></td>
							<td>
							<c:if test="${listview.writerpos!=null}">
							[<c:out value="${listview.writerpos}"/>]
							</c:if>
							<c:out value="${listview.writer}" /></td>
							<td><c:out value="${listview.regdate}" /></td>
							<td>
							<c:if test="${listview.filecnt>0}">
							<img src="<c:url value="/resources/icon/floppy-disk.png"/>" width="25" height="25"/>					
							</c:if>
							</td>
						</tr>
					</c:forEach>
						<c:forEach var="listview" items="${listview3}" varStatus="loop">
						<c:url var="link" value="NoticeRead">
							<c:param name="noticenum" value="${listview.noticenum}" />
						</c:url>
						<tr>
							<td><img src="<c:url value="/resources/icon/star.png"/>" width="25" height="25"/></td>
							<td><a href="${link}"><b><c:out
										value="${listview.title}" /></b></a></td>
							<td>
							<c:if test="${listview.writerpos!=null}">
							[<c:out value="${listview.writerpos}"/>]
							</c:if>
							<c:out value="${listview.writer}" /></td>
							<td><c:out value="${listview.regdate}" /></td>
							<td>
							<c:if test="${listview.filecnt>0}">
							<img src="<c:url value="/resources/icon/floppy-disk.png"/>" width="25" height="25"/>					
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
    	</section>
    </div>
    
    <%@ include file="include/footer.jsp" %>
    <%@ include file="include/footerScript.jsp" %>
</body>
</html>