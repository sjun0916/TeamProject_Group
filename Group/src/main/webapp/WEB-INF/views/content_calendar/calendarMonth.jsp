<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>


<%@ include file ="/WEB-INF/views/include/header.jsp" %>

<script src="calendar.js"></script>
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
		
		<div class="row">

			<div class="col-md-3">

				<div class="box box-solid">
					<form id="list" name="calendarList" method="post"
						onsubmit="return loadHtml(this, this.action, 'result')">
						<input type="submit" id="oksign" style="display: none;">
					</form>
					<div class="box-header with-border">
						<h3 class="box-title">일정추가</h3>
					</div>
					<div class="form-group">
						<label>색상 선택:</label> <input type="text" id="bgcolor"
							class="form-control my-colorpicker1 colorpicker-element">
					</div>
					<!-- /btn-group -->
					<label>제목</label>
					<div class="input-group input-group-sm">

						<input id="new-event" type="text" class="form-control"
							placeholder="Event Title">
						<div class="input-group-btn">
							<button id="add-new-event" type="button"
								class="btn btn-info btn-flat">일정추가</button>
						</div>

						<!-- /btn-group -->
					</div>
					<div class="form-group">
						<label>날짜 선택</label>

						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="reservationtime">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea id="cont" class="form-control" rows="3"
								placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label>기타사항</label>
							<textarea id="etc" class="form-control" rows="3"
								placeholder="Enter ..."></textarea>
						</div>
						<!-- /input-group -->
					</div>
				</div>
				<button type="button" class="btn btn-block btn-info btn-lg"
					onclick="submit();">일정 등록</button>
			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<div class="example-modal">
        <div class="modal" id="myModal3" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="disable()">
                  <span aria-hidden="true" onclick="disable()" >&times;</span></button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body" style="min-height: 300px; max-height: 763px;">
              	<div class="form-group">
              	<div class="form-group">
                <label>색상</label>

                <div class="input-group my-colorpicker2 colorpicker-element">
                  <input type="text" id="settingcolor" class="form-control" disabled="">

                  <div class="input-group-addon">
                    <i id="settingbg" style="background-color: rgb(222, 2, 2);" disabled=""></i>
                  </div>
                </div>
                <!-- /.input group -->
                <div class="form-group">
                <label>기간</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-clock-o"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="reservationtime2" disabled="">
                </div>
                <!-- /.input group -->
              </div>
              </div>
                  <label>내용</label>
                  <textarea id="cont" class="form-control" rows="3" placeholder="Enter ..." disabled=""></textarea>
                </div>
                <div class="form-group">
                  <label>기타사항</label>
                  <textarea id="etc" class="form-control" rows="3" placeholder="Enter ..." disabled=""></textarea>
                  <input type="hidden" id="seq" >
                  <input type="hidden" id="title" >
                </div>
              </div>
              <div class="modal-footer"> 
                <input type="button" style="width: 25%" id="modify" class="btn btn-primary" onclick="edit()" value="수정">
                <input type="button" style="width: 25%" id="delte" class="btn btn-primary" onclick="remove()" value="삭제" />
                <button type="button" style="width: 25%" class="btn btn-secondary" data-dismiss="modal" onclick="disable()" >닫기</button>
             
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>
</div>
	
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>