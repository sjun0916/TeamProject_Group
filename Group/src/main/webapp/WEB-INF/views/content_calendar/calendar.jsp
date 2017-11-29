<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file ="/WEB-INF/views/include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Calendar <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
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
						<label>분류 선택:</label>
						<select name="kind">
							<option value="person" selected>개인</option>
							<option value="team">부서</option>
							<option value="compony">회사</option>
						</select>
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label>색상 선택:</label> <input type="text" id="bgcolor" -->
<!-- 							class="form-control my-colorpicker1 colorpicker-element"> -->
<!-- 					</div> -->
					<!-- /btn-group -->
					<label>제목</label>
					<div class="input-group input-group-sm">

						<input id="new-event" type="text" class="form-control"
							placeholder="제목을 입력하세요">
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
								placeholder="내용을 입력하세요"></textarea>
						</div>
						<div class="form-group">
							<label>기타사항</label>
							<textarea id="etc" class="form-control" rows="3"
								placeholder="그 외 사항을 입력하세요"></textarea>
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
<!--                 <label>색상</label> -->

<!--                 <div class="input-group my-colorpicker2 colorpicker-element"> -->
<!--                   <input type="text" id="settingcolor" class="form-control" disabled=""> -->

<!--                   <div class="input-group-addon"> -->
<!--                     <i id="settingbg" style="background-color: rgb(222, 2, 2);" disabled=""></i> -->
<!--                   </div> -->
<!--                 </div> -->

					<label>분류 선택:</label>
					<div class="form-group">
						<select name="kind" id="kind" disabled="">
							<option value="person">개인</option>
							<option value="team">부서</option>
							<option value="compony">회사</option>
						</select>
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
                  <textarea id="cont" class="form-control" rows="3" placeholder="내용을 입력하세요" disabled=""></textarea>
                </div>
                <div class="form-group">
                  <label>기타사항</label>
                  <textarea id="etc" class="form-control" rows="3" placeholder="그 외 사항을 입력하세요" disabled=""></textarea>
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

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<%@ include file="/WEB-INF/views/content_calendar/calendarScript.jsp" %>
<script>
function calView(desc){
	$('#calendar').fullCalendar(
			{
				header : {
					left : 'today',
					center : 'prev, title, next',
					right : ''
				},
				buttonText : {
					today : 'today'
				},
				//Random default events
				events : "${pageContext.request.contextPath}/calendar/data",
				editable : false,
				droppable : false, // this allows things to be dropped onto the calendar !!!
				eventClick : function(calEvent, jsEvent, view) {
// 					alert("fullcalendar.eventClick 실행");
			    	$.ajax({    
//				    		alert("fullcalendar.eventClick.ajax 실행");	//2
			        	type:"POST",  
			        	url:'${pageContext.request.contextPath}/calender/select',      
			        	data:{"calendar_no":calEvent.description},
			        	dataType : 'json',
			        	success:function(data){   
			            	var state =data.state;
			             	var datainfo = data.select;
			             	if(data.admin=="true"){
		            			$('#myModal3 #delete').attr("type","hidden");
			            		$('#myModal3 #modify').attr("type","hidden");
				             }else{
				            	 $('#myModal3 #delte').attr("type","button");
				               	 $('#myModal3 #modify').attr("type","button");
			             	}
			             	if(state="success"){
				           		 var dt1 = new Date(datainfo.calendar_start).format("MM/dd/yyyy hh:mm a/p");
						     	var dt2 = new Date(datainfo.calendar_end).format("MM/dd/yyyy hh:mm a/p");
								$('#myModal3 h4').text(datainfo.calendar_title); 
								$('#myModal3 #title').val(datainfo.calendar_title);
								$('#myModal3 #kind').val(datainfo.calendar_kind);
								$('#myModal3 #settingcolor').val(datainfo.calendar_color); 
								$('#myModal3 #settingbg').attr("style",'background-color:'+datainfo.calendar_color+';'); 
								$('#myModal3 #reservationtime2').val(dt1+"-"+dt2); 
								$('#myModal3 #cont').val(datainfo.calendar_cont); 
								$('#myModal3 #etc').val(datainfo.calendar_remark);
								$('#myModal3 #seq').val(datainfo.calendar_no); 
								$('#myModal3').modal();
				        	}else{
				          		alert("일정 불러오기를 실패하였습니다");
				        	}
			                
				             
				        }, 
				        error:function(e){  
				            alert(e.responseText);  
				        }  
				    });
					},
					
				});
//					eventRender : function(calEvent, jsEvent, view){
					
//					}
			
}
	$(function() {

		/* initialize the external events
		 -----------------------------------------------------------------*/
		function ini_events(ele) {
			ele.each(function() {
				alert("ele.each 실행");
				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text()),
					value : $.trim($(this).html())
				// use the element's text as the event title
				};

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);
				
				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 1070,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});

			});
		}

		ini_events($('#external-events div.external-event'));

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//Date for the calendar events (dummy data)
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
		
		calView();
		//continue : title에 checkbox 삽입 
// 		var checkboxContainer = $(
// 				"<div class='checkboxContainer'><input type='checkbox' value='compony' name='kind'>회사"+
// 				"<input type='checkbox' value='team' name='kind'>부서"+
// 				"<input type='checkbox' value='person' name='kind'>개인</div>");
		var checkboxContainer = "<div class='ds-event-categories'>"+    
			"<label><input name='monthKind' id='kindcom' type='checkbox' value='compony' checked>회사</label>&nbsp;"+
			"<label><input name='monthKind' id='kindteam' type='checkbox' value='team' checked>부서</label>&nbsp;"+
			"<label><input name='monthKind' id='kindperson' type='checkbox' value='person' checked>개인</label>&nbsp;"+
			"</div>";

			// Append it to FullCalendar.
			$(".fc-toolbar").after(checkboxContainer);

			$("[name='monthKind']").change(function() {
				var ch_list=Array();
				alert($('input:checkbox[name=monthKind]:checked'));
// 				$("input:checkbox[type=kindcom]:checked").each(function(){
// 					ch_list.push($(this).val());
// 					alert($(this).val());
// 				});
// 				alert(ch_list[0]);
// 				calView();
			});
			

// 			$("#team").change(function() {
// 			    if (this.checked) {
// 			        $('#calendar').fullCalendar('addEventSource', eventSource[1]);
// 			    } else {
// 			        $('#calendar').fullCalendar('removeEventSource', eventSource[1]);
// 			    }
// 			    $('#calendar').fullCalendar('rerenderEvents');
// 			});

// 			$("#person").change(function() {
// 			    if (this.checked) {
// 			        $('#calendar').fullCalendar('addEventSource', eventSource[2]);
// 			    } else {
// 			        $('#calendar').fullCalendar('removeEventSource', eventSource[2]);
// 			    }
			    
// 			    $('#calendar').fullCalendar('rerenderEvents');
// 			});

		/* ADDING EVENTS */
		$(document).on("click", "#calenders", function() {
			alert("document.on 실행");
			$(this).parents("#mark").remove("");
		});
		
		var i = 0;
		$("#add-new-event").click(
						function(e) {
							alert("add-new-event 실행");
							// 			e.preventDefault();
							// 			Get value and make sure it is not null
							var kind = $("select[name=kind]").val();
// 							var bgcode = $("#bgcolor").val();
							var dateCode = $("#reservationtime").val();
							var title = $("#new-event").val();
							var cont = $("#cont").val();
							var etc = $("#etc").val();
							var date = $("#reservationtime").val().split("-");
							var htmlcode = '';
// 							var dateResult=/^(1\d{3}|201[0-9]|202[0-9])\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2]\d|30)\/ (1[0-2]|[0-9])(:[0-5][0-9]){1} ([(A)|(P)][M])$/;
							if(kind==""){
								alert("일정 분류를 선택하세요");
								return false;
							}else if(date.length!=2){
								alert("날짜를 입력하세요");
								return false;
// 							}else if(!dateResult.test(date[0].trim())||!dateResult.test(date[1].trim())){
// 								alert("날짜를 올바르게");
// 								alert(date[0].trim());
// 								alert(date[1].trim());
// 								return false;
							}else if(title==""){
								alert("제목을 입력하세요");
								return false;
							}
							else{
							
							htmlcode += '<div id="mark" class="box box-default box-solid collapsed-box">';
							htmlcode += '<div class="box-header with-border">';
							htmlcode += '<h3 class="box-title">' + title
									+ '</h3>';
							htmlcode += '<div class="box-tools pull-right">';
							htmlcode += '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>';
							htmlcode += '</button>';
							htmlcode += '</div>';
							htmlcode += '</div>';
							htmlcode += '<div class="box-body" style="display: none;">';
							htmlcode += '<div> 분류:'+ kind;
							htmlcode += '</div><div> 기간:' + dateCode;
							htmlcode += '</div><div> 내용:' + cont;
							htmlcode += '</div><div> 기타사항:' + etc;
							htmlcode += ' </div><div>';
							htmlcode += '<input type="hidden" name="calendar_kind" value="'+kind+'"/>';
							htmlcode += '<input type="hidden" name="calendar_start" value="'+date[0]+'"/>';
							htmlcode += '<input type="hidden" name="calendar_end" value="'+date[1]+'"/>';
							htmlcode += '<input type="hidden" name="calendar_title" value="'+title+'"/>';
							htmlcode += '<input type="hidden" name="calendar_cont" value="'+cont+'"/>';
							htmlcode += '<input type="hidden" name="calendar_remark" value="'+etc+'"/>';
							htmlcode += '<input type="button" id="calenders" class="btn btn-block btn-default" value="삭제"/></div></div>';
							htmlcode += ' </div>';
							$("#list").first().prepend(htmlcode);
							i++;
							}
						});
		//Date range picker
		$('#reservation').daterangepicker();
		//Date range picker with time picker
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			format : 'YYYY/MM/DD/ h:mm A'
		});
		$('#reservationtime2').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			format : 'YYYY/MM/DD/ h:mm A'
		});
		//Date range as a button
		
		//Colorpicker
		$(".my-colorpicker1").colorpicker();		
		$(".my-colorpicker2").colorpicker();
		$('#datepicker').datepicker({
			autoclose : true
		});

	});
	window.onload = function() {
// 		alert("window.onload 실행");
		$(".datepicker.datepicker-inline").hide();
	};
	function submit() {
		alert("submit 실행");
		oksign.click();
	}
	function loadHtml(form, action, targetid) {
		alert("loadHtml 실행");
		// 파라미터의 취득
		var fm = $(form);
		var param = {};
		if(fm.contents().size()>3){
		// 폼 내용을 배열로 변환
		$(fm.serializeArray()).each(function(i, v) {
			alert(v.value);
			param[v.name] = v.value;
			var test = $("#param[v.name]").text();
			alert(test);
		});

		//jquery로 전송후 html형식의 리턴값을 target-url에 삽입
		$(targetid).load(target, param); //단지 배열로 던지고자 할때는 이렇게 보내면 된다.
		}else{
			return false;
		}
		
	}
	
	Date.prototype.format = function(f) {
		alert("date.prototype.format 실행");
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;

	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	    	alert("date.prototype.format.return 실행");
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "AM" : "PM";
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	function edit(){
// 		$('#myModal3 h4').attr("disabled"); 
		$('#myModal3 #settingcolor').removeAttr("disabled");
		$('#myModal3 #kind').removeAttr("disabled");
		$('#myModal3 #settingbg').removeAttr("disabled"); 
		$('#myModal3 #reservationtime2').removeAttr("disabled");
		$('#myModal3 #cont').removeAttr("disabled");
		$('#myModal3 #etc').removeAttr("disabled");
		$('#myModal3 #modify').attr("onclick",'cummitEdit()');
		$('#myModal3 #delete').attr("type","hidden");
		$('#myModal3 #modify').val("수정완료");
	}
	
	function cummitEdit(){
		//커밋 ajax구현 부분
		alert("cummitEdit 실행");
		 var date = $(".example-modal #reservationtime2").val().split("-");
		  var url='${pageContext.request.contextPath}/calendar/update';
		  var calendar_no1=$(".example-modal #seq").val();
		  var calendar_start1=date[0];
		  var calendar_end1=date[1];
		  var calendar_title1=$(".example-modal #title").val();
		  var calendar_cont1=$(".example-modal #cont").val();
		  var calendar_remark1=$(".example-modal #etc").val();
		  var calendar_color1=$(".example-modal #settingcolor").val();
		  var calendar_kind1=$(".example-modal #kind").val();
		  var data ={
	        		calendar_no:calendar_no1,
	                calendar_start: calendar_start1,
	    			calendar_end:calendar_end1,
	    			calendar_title:calendar_title1,
	    			calendar_cont:calendar_cont1,
	    			calendar_remark:calendar_remark1,
	    			calendar_color:calendar_color1,
	    			calendar_kind:calendar_kind1};
		  $.ajax({
			  
	        	type:"POST",  
	        	url:'${pageContext.request.contextPath}/calendar/update',      
	        	data:data,
	        	dataType : 'json',
	        	success:function(data){   
	             var state =data.state;
	             var datainfo = data.select;
	             if(state="success"){
	            	 alert("수정성공");
	            	 location.replace("${pageContext.request.contextPath}/calendar/main"); 
	             }else{
	            	 alert("수정실패");
	             }
	        }, 
	        error:function(e){  
	        	alert("수정실패");  
	        }  
	    });
    	
	}
	function disable(){
		alert("disable 실행");
		$('#myModal3 .modal-footer #modify').text("수정");
		$('#myModal3 #kind').attr("disabled","");
		$('#myModal3 #settingcolor').attr("disabled","");
		$('#myModal3 #settingbg').attr("disabled",""); 
		$('#myModal3 #reservationtime2').attr("disabled","");
		$('#myModal3 #cont').attr("disabled","");
		$('#myModal3 #etc').attr("disabled","");
		$('#myModal3 #delete').attr("type","button");
		$('#myModal3 #modify').attr("onclick",'edit()');
	}
// 	삭제
	function remove(){
		alert("remove 실행");
		  var url='${pageContext.request.contextPath}/calendar/delete';  
    	  var calendar_no=$(".example-modal #seq").val();
		$.ajax({
        	type:"POST",  
        	url:url,      
        	data:{"calendar_no":calendar_no},
        	dataType : 'json',
        	success:function(data){
        		if(data.state=="success"){
        			alert("삭제에 성공하였습니다");
        			window.location.reload();
        		}else{
        			alert("삭제에 실패하였습니다");
        		}
        }, 
        error:function(e){  
            alert(e.responseText);  
        }  
    });  
	}
</script>