<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Smart-Groupware</title>
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
 <%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			<img src="<c:url value="/resources/icon/email_3.png"/>" width="50" height="50"/>
			메일 <small>content</small>
		</h1>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		<div class="box">  
               <div class="box-header with-border">
                  <h3 class="box-title">Mail Content</h3>
               </div>
               <form name="boardWriteForm" method="post" action="${pageContext.servletContext.contextPath }/board/write"> 
                  <div class="box-body">
                     <div class="form-group">
                        <label>제목<input type="text" id="contentTitle" name="contentTitle" class="form-control" value="${title}" readonly style="border:0px;"></label>
                     </div>                    
                                          
                     <div class="form-group">
                     	<b>내용</b>
                        <textarea id="contentContent" class="textarea" name="contentContent"
                           style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" readonly>${content}</textarea>

                     </div>
                	    <input type="hidden" id="employeeNo" name="employeeNo" value=${authUser.employeeNo }>
				    	<input type="hidden" id="teamId" name="teamId" value=${authUser.teamId }>
						<input type="hidden" id="boardId" name="boardId" value=${boardId }>
                     <div class="pull-right">
                        <button type="button" class="btn btn-primary btn-sm" onClick="history.back();">
                 	       돌아가기
                        </button>
                     </div>
                     
                  </div>
             	    
                  <div class="box-footer">
                     <span></span>
                  </div>
                  
               </form>
            </div>

	</section>
	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>
</html>