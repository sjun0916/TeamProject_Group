<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="box-header with-border">
	<h3 class="box-title">일정추가</h3>
</div>
<div class="form-group">
	<label>분류:</label>
	<select>
		<option value="1">전체</option>
		<option value="2">부서</option>
		<option value="3" selected>개인</option>
	</select>
</div>
	
<!-- /btn-group -->
<label>제목</label>
<div class="input-group input-group-sm">
	<input id="new-event" type="text" class="form-control" placeholder="제목 입력">
</div>
<!-- /btn-group -->
<div class="form-group">
	<label>날짜 선택</label>
	<div class="input-group">
		<div class="input-group-addon">
			<i class="fa fa-clock-o"></i>
		</div>
		<!-- id="reservationtime" -->
		시작 날짜 : <input type="date" class="form-control pull-right" id="startDate"><br>
		종료 날짜 : <input type="date" class="form-control pull-right" id="endDate"><br>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea id="cont" class="form-control" rows="3" placeholder="내용 입력"></textarea>
	</div>
	<!-- /input-group -->
</div>
<button type="button" class="btn btn-block btn-info btn-lg" onclick="submit();">일정 등록</button>