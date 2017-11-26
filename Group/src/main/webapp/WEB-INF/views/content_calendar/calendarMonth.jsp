<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<%@ include file ="/WEB-INF/views/include/header.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- contents header -->
	<section class="content-header">
		<h1>
			Calendar <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/home"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>
	
	<!-- inputGroup -->
	
<!-- 	<section class="content container-fluid"> -->
<!-- 		<h2>Text</h2> -->
<!-- 	</section> -->

	<!-- Main content -->
	<section class="content">
		<div class="row">

			<div class="col-md-3">

				<div class="box box-solid">
					<form id="list" name="calendarList" method="post"
						onsubmit="return loadHtml(this, this.action, 'result')">
						<input type="submit" id="oksign" style="display: none;">
					</form>
					
			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
					
						<!-- THE CALENDAR -->
						<div id="calendar">
						<form name="monthView" method="post">
							<table border="0" >
								<tr>
									<td>
										<input type="checkbox" name=kind value="1" checked="checked">회사&nbsp;
										<input type="checkbox" name=kind value="2" checked="checked">부서&nbsp;
										<input type="checkbox" name=kind value="3" checked="checked">개인
									</td>
								</tr>
								  <tr>
								    <td><table border="0">
								      <tr>
								        
								        <td width="6%">Year&nbsp;</td>
								        <td width="7%">
										<!-- start year and end year in combo box to change year in calendar -->
										<select name="iYear" onchange="submit()">
								        <c:forEach var="iy" begin="${iTYear-5}" end="${iTYear+10}" step="1" varStatus="loop">
								        	<c:choose>
										    	<c:when test="${loop.index == iYear}">
										    		<option value="${loop.index}" selected>${loop.index}</option>
										    	</c:when>
										    	<c:otherwise>
										    		<option value="${loop.index}">${loop.index}</option>
										    	</c:otherwise>
									    	</c:choose>
										</c:forEach>
									   </select>&nbsp;&nbsp;</td>
								       
								        <td width="73%" align="center"><h3>&nbsp;${iYear}-${iMonth}&nbsp;</h3></td>
								        
								        <td width="6%">Month&nbsp;</td>
								        <td width="8%">
										
										<!-- print month in combo box to change month in calendar -->
										<select name="iMonth" onchange="submit()">
										<c:forEach var="im" begin="1" end="12" step="1" varStatus="loop">
											<c:choose>
										    	<c:when test="${loop.index == iMonth}">
										    		<option value="${loop.index}" selected>${loop.index}</option>
										    	</c:when>
										    	<c:otherwise>
										    		<option value="${loop.index}">${loop.index}</option>
										    	</c:otherwise>
									    	</c:choose>
										</c:forEach>
										</select></td>
								      </tr>
     								</table></td>
  								</tr>
  								
								  <tr>
								    <td><!-- ? --><table border="1">
								      <tbody>
								      	<tr>
								          <th>Sun</th>								          
								          <th>Mon</th>
								          <th>Tue</th>
								          <th>Wed</th>
								          <th>Thu</th>
								          <th>Fri</th>
								          <th>Sat</th>
								        </tr>
								        <c:set var="cnt" value="1"/>
								        <c:forEach var="i" begin="1" end="${iTotalweeks}" step="1" varStatus="loop">
								        	<tr>
								        	<c:forEach var="j" begin="1" end="7" step="1" varStatus="loop2">
								        		<c:choose>
								        			<c:when test="${cnt<weekStartDay || (cnt-weekStartDay+1)>days}">
								        				<td align='center' height='35'>&nbsp;</td>
								        			</c:when>
								        			<c:otherwise>
								        				<td align="center" height="35" id="day_${cnt-weekStartDay+1}">
<!-- 								        				a link : daylist -->
															<a href="<c:url value="daylist">
																<c:param name="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"></c:param>
															</c:url>" onclick="submit()">
															<c:import url="daylist"/>
<%-- 															<c:set var="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"/> --%>
<%-- 															<input type="hidden" name="date" value="${iYear}${iMonth}${cnt-weekStartDay+1}"> --%>
<%-- 															<c:out value="${date}"/> --%>
<%-- 															<% session.setAttribute("date", "${iYear}${iMonth}${cnt-weekStartDay+1}"); %> --%>
															
									        				<span>${cnt-weekStartDay+1}</span><br>
									        				<c:if test="${event != 'null'}">
										        				<c:forEach var="map" items="${event}" varStatus="event">
										        					<c:set var="number" value="${cnt-weekStartDay+1}"/>
										        					<c:if test="${map.key == number}">
											        					<span><small>${map.value}</small></span><br>
											        				</c:if>
										        				</c:forEach>
									        				</c:if>
									        				kind:1 / kind:2 / kind:3
								        				</a>
								        				
								        				</td>
								        			</c:otherwise>
								        		</c:choose>
								        		${cnt=cnt+1 }
								        	</c:forEach>
								        	</tr>
								        </c:forEach>
								      </tbody>
								    </table></td>
								  </tr>
							</table>
							</form>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				/. box
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
              	    <label>분류:</label>
						<select disabled="">
							<option value="1">전체</option>
							<option value="2">부서</option>
							<option value="3" selected>개인</option>
						</select>

                </div>
                <!-- /.input group -->
                <div class="form-group">
                <label>기간</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-clock-o"></i>
                  </div> 
					<!-- id="reservationtime2" -->
					시작 날짜<br>
					<input type="date" class="form-control pull-right" id="startDate" disabled=""><br>
					종료 날짜<br>
					<input type="date" class="form-control pull-right" id="endDate" disabled=""><br>
                </div>
                <!-- /.input group -->
              </div>
                  <label>내용</label>
                  <textarea id="cont" class="form-control" rows="3" placeholder="내용 입력" disabled=""></textarea>
              </div>
              <div class="modal-footer"> 
                <input type="button" style="width: 25%" id="modify" class="btn btn-primary" onclick="edit()" value="수정">
                <input type="button" style="width: 25%" id="delte" class="btn btn-primary" onclick="remove()" value="삭제" />
                <button type="button" style="width: 25%" class="btn btn-secondary" data-dismiss="modal" onclick="disable()" >닫기</button>
             
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
<!--           /.modal-dialog -->
        </div>
<!--         /.modal -->
      </div>

	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
    </body>
    
<script>
$(function() {

		/* initialize the external events
		 -----------------------------------------------------------------*/
		function ini_events(ele) {
			ele.each(function() {
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
		$('#calendar').fullCalendar(
				{

					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay'
					},
					buttonText : {
						today : 'today',
						month : 'month',
						week : 'week',
						day : 'day'
					},
					//Random default events
					events : "${pageContext.request.contextPath}/calendar/data",
					editable : false,
					droppable : false, // this allows things to be dropped onto the calendar !!!
					eventClick : function(calEvent, jsEvent, view) {
				    	$.ajax({      
				        	type:"POST",  
				        	url:'${pageContext.request.contextPath}/calender/select',      
				        	data:{"calendar_no":calEvent.description},
				        	dataType : 'json',
				        	success:function(data){   
				             var state =data.state;
				             var datainfo = data.select;
				             if(data.admin=="true"){
				            		$('#myModal3 #delte').attr("type","hidden");
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
								$('#myModal3 #settingcolor').val(datainfo.calendar_color); 
								$('#myModal3 #settingbg').attr("style",'background-color:'+datainfo.calendar_color+';'); 
								$('#myModal3 #reservationtime2').val(dt1+"-"+dt2); 
								$('#myModal3 #cont').val(datainfo.calendar_cont); 
								$('#myModal3 #etc').val(datainfo.calendar_remark);
								$('#myModal3 #seq').val(datainfo.calendar_no); 
								$('#myModal3').modal();
				             }else{
				            	 alert("일정을 가지고 오는데 실패하였습니다")
				             }
				            
				             
				        }, 
				        error:function(e){  
				            alert(e.responseText);  
				        }  
				    });
					},
					
				});

		/* ADDING EVENTS */
		$(document).on("click", "#calenders", function() {
			$(this).parents("#mark").remove("");
		});
		var i = 0;
		$("#add-new-event")
				.click(

						function(e) {
							// 			e.preventDefault();
							// 			Get value and make sure it is not null
							var bgcode = $("#bgcolor").val();
							var dateCode = $("#reservationtime").val();
							var title = $("#new-event").val();
							var cont = $("#cont").val();
							var etc = $("#etc").val();
							var date = $("#reservationtime").val().split("-");
							var htmlcode = '';
							var dateResult=/^(1\d{3}|200[0-9]|201[0-6])\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2]\d|30)\/ (1[0-2]|[0-9])(:[0-5][0-9]){1} ([(A)|(P)][M])$/;
							if(bgcode==""){
								alert("배경색을 입력하세요");
								return false;
							}else if(date.length!=2){
								alert("날짜를 입력하세요");
								return false;
							}else if(!dateResult.test(date[0].trim())||!dateResult.test(date[1].trim())){
								alert("날짜를 올바르게");
								return false;
							}else if(title==""){
								alert("제목을 입력하세요");
								return false;
							}
							else{
							
							htmlcode += '<div id="mark" class="box box-default box-solid collapsed-box">';
							htmlcode += '<div class="box-header with-border" style="background-color:'+bgcode+';">';
							htmlcode += '<h3 class="box-title">' + title
									+ '</h3>';
							htmlcode += '<div class="box-tools pull-right">';
							htmlcode += '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>';
							htmlcode += '</button>';
							htmlcode += '</div>';
							htmlcode += '</div>';
							htmlcode += '<div class="box-body" style="display: none;">';
							htmlcode += '<div> 기간:' + dateCode;
							htmlcode += '</div><div> 내용:' + cont;
							htmlcode += '</div><div> 기타사항:' + etc;
							htmlcode += ' </div><div>';
							htmlcode += '<input type="hidden" name="calendar_color" value="'+bgcode+'"/>';
							htmlcode += '<input type="hidden" name="calendar_start" value="'+date[0]+'"/>';
							htmlcode += '<input type="hidden" name="calendar_end" value="'+date[1]+'"/>';
							htmlcode += '<input type="hidden" name="calendar_title" value="'+title+'"/>';
							htmlcode += '<input type="hidden" name="calendar_cont" value="'+cont+'"/>';
							htmlcode += '<input type="hidden" name="calendar_remark" value="'+cont+'"/>';
							htmlcode += '<input type="button" id="calenders"class="btn btn-block btn-default" value="삭제" style="background-color:'+bgcode+';"/></div></div>';
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
		$(".datepicker.datepicker-inline").hide();
	};
	function submit() {
		oksign.click();
	}
	function loadHtml(form, action, targetid) {
		// 파라미터의 취득
		var fm = $(form);
		var param = {};
		if(fm.contents().size()>3){
		// 폼 내용을 배열로 변환
		$(fm.serializeArray()).each(function(i, v) {
			param[v.name] = v.value;
		});

		//jquery로 전송후 html형식의 리턴값을 target-url에 삽입
		$(targetid).load(target, param); //단지 배열로 던지고자 할때는 이렇게 보내면 된다.
		}else{
			return false;
		}
	}
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;

	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
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
		//$('#myModal3 h4').attr("disabled"); 
		$('#myModal3 #settingcolor').removeAttr("disabled");
		$('#myModal3 #settingbg').removeAttr("disabled"); 
		$('#myModal3 #reservationtime2').removeAttr("disabled");
		$('#myModal3 #cont').removeAttr("disabled");
		$('#myModal3 #etc').removeAttr("disabled");
		$('#myModal3 #etc').removeAttr("disabled");
		$('#myModal3 #modify').attr("onclick",'cummitEdit()');
		$('#myModal3 #delte').attr("type","hidden");
		$('#myModal3 #modify').val("수정완료");
	}
	function cummitEdit(){
		//커밋 ajax구현 부분
		 var date = $(".example-modal #reservationtime2").val().split("-");
		  var url='${pageContext.request.contextPath}/calendar/update';
		  var calendar_no1=$(".example-modal #seq").val();
		  var calendar_start1=date[0];
		  var calendar_end1=date[1];
		  var calendar_title1=$(".example-modal #title").val();
		  var calendar_cont1=$(".example-modal #cont").val();
		  var calendar_remark1=$(".example-modal #etc").val();
		  var calendar_color1=$(".example-modal #settingcolor").val();
		  var data ={
	        		calendar_no:calendar_no1,
	                calendar_start: calendar_start1,
	    			calendar_end:calendar_end1,
	    			calendar_title:calendar_title1,
	    			calendar_cont:calendar_cont1,
	    			calendar_remark:calendar_remark1,
	    			calendar_color:calendar_color1};
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
		$('#myModal3 .modal-footer #modify').text("수정");
		$('#myModal3 #settingcolor').attr("disabled","");
		$('#myModal3 #settingbg').attr("disabled",""); 
		$('#myModal3 #reservationtime2').attr("disabled","");
		$('#myModal3 #cont').attr("disabled","");
		$('#myModal3 #etc').attr("disabled","");
		$('#myModal3 #etc').attr("disabled","");
		$('#myModal3 #delte').attr("type","button");
		$('#myModal3 #modify').attr("onclick",'edit()');
	}
	function remove(){
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
</html>