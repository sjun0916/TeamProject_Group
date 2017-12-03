<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel='stylesheet' type='text/css'
	href='<c:url value="/resources/boardCSS/NoticeList.css"/>'>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/photo-camera.png"/>" width="50" height="50"/>
			사진첩 <small>photo</small>
		</h1>
		
	</section>



	<section class="content container-fluid">
	<div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Read Photo</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h5>[<c:out value="${photoInfo.departname}" />사진글]</h5><br><h3><c:out value="${photoInfo.title}" />
                <span class="mailbox-read-time pull-right"><c:forEach var="listview" items="${listview}" varStatus="status">
								<a
									href="fileDownload2?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
									<c:out value="${listview.filename}" />
								</a>
								<c:out value="${listview.size2String()}" />
								<br />
							</c:forEach></span></h3>
                <h5><small>작성자 : [<c:out value="${photoInfo.writerpos}" />]<c:out value="${photoInfo.writer}" /></small>
                  <span class="mailbox-read-time pull-right"><c:out value="${photoInfo.regdate}" /></span></h5>
                  <img src="\group\imgUpload\2017\<c:out value="${photoInfo.realname}"/>"/>
              </div>

              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
            
            
            
            <div class="box-footer">
              <div class="pull-right">
              	<c:if test="${authUser.role == 'ADMIN'}">
                <button type="button" class="btn btn-default" onClick="location.href='PhotoForm?photonum=<c:out value="${photoInfo.photonum}"/>'">Update</button>
                <button type="button" class="btn btn-default" onClick="location.href='PhotoDelete?photonum=<c:out value="${photoInfo.photonum}"/>'"><i class="fa fa-trash-o"></i> Delete</button>
              </c:if>
              </div>
              <button type="button" class="btn btn-default" onClick="location.href='PhotoList'">돌아가기</button>
            </div>

            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
          
        </div>

	</section>
	<!-- /.content -->

</div>
<!-- /.content-wrapper -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>
