<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/header.jsp" %>

	
	
	
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- ì»¨íí¸ í¤ë -->
	<section class="content-header">
		<h1>
			Page Header <small>Optional description</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ì»¨íí¸ ë©ì¸ -->
	<section class="content container-fluid">
		
		<table>
			<c:forEach ${monthInfo}
			<tr>
				<td>
					<input type="button" value="회사" name="company">&nbsp;
				</td>
				<td>
					<input type="button" value="부서" name="class">&nbsp;
				</td>
				<td>
					<input type="button" value="개인" name="personal">
				</td>
				<td>
				
				</td>
			</tr>
		
		</table>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>