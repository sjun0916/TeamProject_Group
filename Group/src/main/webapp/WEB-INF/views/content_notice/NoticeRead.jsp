<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/megaphone.png"/>" width="50" height="50"/>
			공지사항 <small>notice content</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Content 메인 -->

	
	<section class="content container-fluid">
	<div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Read Notice</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h5>[<c:out value="${noticeInfo.departname}" />게시글]</h5><br><h3><c:out value="${noticeInfo.title}" />
                <span class="mailbox-read-time pull-right"><c:forEach var="listview" items="${listview}" varStatus="status">
								<a
									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach></span></h3>
                <h5><small>작성자 : [<c:out value="${noticeInfo.writerpos}" />]<c:out value="${noticeInfo.writer}" /></small>
                  <span class="mailbox-read-time pull-right"><c:out value="${noticeInfo.regdate}" /></span></h5>
              </div>

              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            	<table style="height: 400px">
            		<tr>
            			<td><c:out value="${noticeInfo.content}" escapeXml="false" /></td>
            		</tr>
            	</table>
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <div class="pull-right">
              	<c:if test="${authUser.role == 'ADMIN'}">
                <button type="button" class="btn btn-default" onClick="location.href='NoticeForm?noticenum=<c:out value="${noticeInfo.noticenum}"/>'">Update</button>
                <button type="button" class="btn btn-default" onClick="location.href='NoticeDelete?noticenum=<c:out value="${noticeInfo.noticenum}"/>'"><i class="fa fa-trash-o"></i> Delete</button>
                </c:if>
              </div>
              <button type="button" class="btn btn-default" onClick="location.href='NoticeList'">Back List</button>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>

	</section>
	<!-- /.content -->

<!-- 	<section class="content container-fluid"> -->
<!-- 		<table border="1" style="width: 600px"> -->
<%-- 			<caption>게시판</caption> --%>
<%-- 			<colgroup> --%>
<%-- 				<col width='20%'/> --%>
<%-- 				<col width='*%'/> --%>
<%-- 				<col width='20%'/> --%>
<%-- 			</colgroup> --%>
<!-- 			<tbody> -->
<!-- 				<tr> -->
<%-- 					<td>[<c:out value="${noticeInfo.departname}" />게시글] --%>
<!-- 					</td> -->
<%-- 					<td><c:out value="${noticeInfo.title}" /></td> --%>
<%-- 					<td><c:out value="${noticeInfo.regdate}" /></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td colspan="2">작성자:[<c:out value="${noticeInfo.writerpos}" />]<c:out --%>
<%-- 							value="${noticeInfo.writer}" /></td> --%>
<!-- 					<td> -->
<%-- 							<c:forEach var="listview" items="${listview}" varStatus="status"> --%>
<!-- 								<a -->
<%-- 									href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> --%>
<%-- 									<c:out value="${listview.filename}" /> --%>
<!-- 								</a> -->
<%-- 								<c:out value="${listview.size2String()}" /> --%>
<!-- 								<br /> -->
<%-- 							</c:forEach> --%>
<!-- 						</td> -->
<!-- 				</tr> -->

<!-- 				<tr> -->
<%-- 					<td colspan="3" height="200"><c:out value="${noticeInfo.content}" --%>
<%-- 							escapeXml="false" /></td> --%>
<!-- 				</tr> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 		<a href="NoticeList">돌아가기</a>  -->
<%--  		<c:if test="${authUser.role == 'ADMIN'}"> --%>
<%-- 		<a href="NoticeDelete?noticenum=<c:out value="${noticeInfo.noticenum}"/>">삭제</a> --%>
<%-- 		<a href="NoticeForm?noticenum=<c:out value="${noticeInfo.noticenum}"/>">수정</a> --%>
<%-- 		</c:if> --%>

<!-- 	</section> -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>
