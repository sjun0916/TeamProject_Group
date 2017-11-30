<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>


<script>
	function categoryChange(value) {

		document.form1.submit();
	}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐츠 헤더 -->
	<section class="content-header">
	<h1>
			<img src="<c:url value="/resources/icon/email.png"/>" width="50" height="50"/>
			부서게시판 <small>board</small>
		</h1>
	<ol class="breadcrumb">
			<a href="BoardList"><i class="fa fa-dashboard"></i> 게시판</a>		
		</ol>
	</section>
	<!-- 컨텐츠 메인 -->
	<section class="content container-fluid">
		<form id="form1" name="form1" method="post">
			<table >			
				<colgroup>
					<col width='8%' />
					<col width='8%' />
					<col width='*%' />
					<col width='15%' />
					<col width='15%' />
					<col width='10%' />
					<col width='10%' />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th><select id="category1" name="category1"
							onchange="categoryChange(this.value);">
								<option value="">카테고리</option>
								<option value="">전체보기</option>
								<option value="영업부">[영업부]</option>
								<option value="인사부">[인사부]</option>
								<option value="행정부">[행정부]</option>
								<option value="개발부">[개발부]</option>
						</select></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>첨부</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<c:url var="link" value="BoardRead">
							<c:param name="boardnum" value="${listview.boardnum}" />
						</c:url>
						<tr>
							<td><c:out
									value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
							<td><c:out value="${listview.departname}" /></td>
							<td><a href="${link}"><c:out
										value="${listview.title}" /></a> <c:if
									test="${listview.replycnt>0}">
							(<c:out value="${listview.replycnt}" />)
						</c:if></td>
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
							<td><c:out value="${listview.hit}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
<table class="tmptable">
<tr>
<td>
			<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
			<a href="BoardForm"><p style="text-align: right">글작성</a>
</td>
</tr>
<tr>
<td>
			<div>
				<%-- <input type="hidden" name="category1" value="${searchVO.category1}"/>  --%>
				<input type="checkbox" name="searchType" value="title"
					<c:if test="${fn:indexOf(searchVO.searchType, 'title')!=-1}">checked="checked"</c:if> />
				<label class="chkselect" for="searchType1">제목</label> <input
					type="checkbox" name="searchType" value="writer"
					<c:if test="${fn:indexOf(searchVO.searchType, 'writer')!=-1}">checked="checked"</c:if> />
				<label class="chkselect" for="searchType2">작성자</label> <input
					type="text" name="searchKeyword" style="width: 150px;"
					maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
					onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"> <input
					name="btn_search" value="검색" class="btn_sch" type="button"
					onclick="fn_formSubmit()" />


			</div>
</td>
</tr>
</table>
		</form>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>