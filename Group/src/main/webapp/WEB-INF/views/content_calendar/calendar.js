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