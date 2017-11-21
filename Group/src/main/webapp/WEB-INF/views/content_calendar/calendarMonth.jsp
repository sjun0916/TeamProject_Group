<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<%@ include file ="/WEB-INF/views/include/header.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- contents header -->
	<section class="content-header">
		<h1>
			일정 <small>Calendar</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>
	<script type="text/javascript" src="calendar.js"></script>
	<!-- inputGroup -->
	
	<section class="content container-fluid">
		<h2>Text</h2>
	</section>
	<table>	
		
		<form id="list" name="calendarList" method="post" onsubmit="return loadHtml(this, this.action, 'result')">
			<input type="submit" id="oksign" style="display: none;">
		</form>
		
		
			<tr>
				<h3 class="box-title">일정 추가</h3>
			</tr>
			<tr>
				<td>
					<label>분류 :</label>
					<select>
						<option value="3" selected>개인</option>
						<option value="2">부서</option>
						<option value="1">전체</option>
					</select>
				</td>
			</tr>
			<tr>
				<!-- /btn-group -->
				<td><label>제목</label></td>
			</tr>
			<tr>
				<td colspan="2">
				<input id="new-event" type="text" class="form-control"
					placeholder="제목을 입력하세요">
				</td>
			</tr>
<!-- 				<tr> -->
<!-- 							<button id="add-new-event" type="button" -->
<!-- 								class="btn btn-info btn-flat">일정추가</button> -->
<!-- 					</tr> -->
					
						<!-- /btn-group -->
			<tr>
				<td>
					<label>시작 날짜</label>
					<input type="date" name="startTime" max="2025-12-31" min="2015-01-01">
				</td>
			</tr>
			<tr>
				<td>
					<label>종료 날짜</label>
					<input type="date" name="endTime" max="2025-12-31" min="2015-01-01">
				</td>
			</tr>
			<tr>
				<td>
					<label>내용</label>
				</td>
			</tr>
			<tr>
				<td>
				<textarea id="cont" class="form-control" rows="3"
					placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr>
			<!-- /inputGroup -->
			<tr>
				<td>
				<button type="button" class="btn btn-block btn-info btn-lg"
					onclick="submit();">일정 등록</button>
				</td>
			</tr>
			<!-- /.col -->
			
	
			<!-- /.content -->
			<tr>
				<td>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="disable()">
			        <span aria-hidden="true" onclick="disable()" >&times;</span></button>
			        <h4 class="modal-title"></h4>
		       		<label>색상</label>
		        	<input type="text" id="settingcolor" class="form-control" disabled="">
					<i id="settingbg" style="background-color: rgb(222, 2, 2);" disabled=""></i>
				</td>
			</tr>
			<tr>
				<td>
		        	<label>기간</label>
					<input type="text" class="form-control pull-right" id="reservationtime2" disabled="">
				</td>
			</tr>
			<!-- /.input group -->
			<tr>
				<td>
					<label>내용</label>
		            <textarea id="cont" class="form-control" rows="3" placeholder="Enter ..." disabled=""></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" style="width: 25%" id="modify" class="btn btn-primary" onclick="edit()" value="수정">
					<input type="button" style="width: 25%" id="delte" class="btn btn-primary" onclick="remove()" value="삭제" />
		            <button type="button" style="width: 25%" class="btn btn-secondary" data-dismiss="modal" onclick="disable()" >닫기</button>
				</td>
			</tr>
	</table>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>