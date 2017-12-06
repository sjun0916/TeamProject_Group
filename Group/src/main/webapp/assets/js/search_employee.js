 var dialog, form;
function initGrid() {
     
    $("#list").jqGrid({
        //로컬그리드이용
        datatype: "local",
        //그리드 높이
        height: 500,
        //컬럼명들
        colNames:['사번','이름', '소속', '직급','이메일','메세지'],
        //컬럼모델
        colModel:[
            {name:'employeeNo',align:"center"},
            {name:'employeeName',align:"center",width:100},
            {name:'teamName',align:"center"},
            {name:'positionName',align:"center"},
            {name:'email',align:"center",width:200},
            {name:'IDX', index:'IDX',align:"center", width:100,formatter:sendmessageButton },
        ],
        autowidth:true,
        //그리드타이틀
        caption: "사원목록"
    });
    $(window).resize(function(){
		$("#list").setGridWidth($(this).width() * .825);
	});
}

// 버튼 생성
function sendmessageButton (cellvalue, options, rowObject) {

  return '<input type="button" id="sendMessageButton" onclick="openForm(\''+rowObject.email+'\')" value="쪽지보내기"/>';
}


function openForm(email){
	$('#selectedEmail').val(email);
	dialog.dialog( "open" );
}

function imageFormatter(cellvalue, options, rowObject)
{
    return '<img src="' +getContextPath()+ rowObject.imageUrl + '" />';
}

function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
function loadEmployeeData() {
	
	var gridData;
	//그리드의 데이터를 비우고
	var trf = $("#list tbody:first tr:first")[0];
	$("#list tbody:first").empty().append(trf);
	
	
	var params = jQuery("#searchEmployeeForm").serialize();
	$.ajax({
		
		 url:'/group/searchemployee',
		type:'POST',
		data:params,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        dataType: 'json',
		success:function(responseData,status) {
			console.log(responseData);
			
		    for(var i=0;i<=responseData.data.length;i++){
	            $("#list").jqGrid('addRowData',i+1,responseData.data[i]);
	    }
		    
		},
		complete: function() {			
		}
	});
	
	
}

function initSendMessageForm(){
    // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
	   var name = $( "#name" ),
	      email = $( "#email" ),
	      password = $( "#password" ),
	      allFields = $( [] ).add( name ).add( email ).add( password ),
	      tips = $( ".validateTips" );
	 
	    function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    }
	 
    function sendMessage() {
			
			
			var data = new Object();
			
			data.senderemployeeNo= $('#senderemployeeNo').val();
			data.receiverEmail= $('#selectedEmail').val();
			data.message= $('#messageArea').val();
			
			JSON.stringify(data);
			
			$.ajax({
				
				 url:'/group/message/sendMessage',
				type:'POST',
				data:data,
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		        dataType: 'json',
				success:function(responseData,status) {
				    
				},
				complete: function() {			
					dialog.dialog( "close" );
					alert("메세지 전송을 완료하였습니다.");
					window.location.reload();
				}
			});
	    }
	 
	    dialog = $( "#sendForm" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      buttons: {
	        "전송": sendMessage,
	        "취소": function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
	        form[ 0 ].reset();
	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	 
	    form = dialog.find( "form" ).on( "submit", function( event ) {
	      event.preventDefault();
	      sendMessage();
	    });
	 
	    $( "#answer" ).button().on( "click", function() {
	      dialog.dialog( "open" );
	    });
	 
}

 $(function(){

	 	initSendMessageForm();
	  
		changeActiveGnb(1);
		initGrid();
		
		$('#teamId').append("<option value=''>전체</option>");
		makeTeamList('teamId');
		loadEmployeeData();
		
		$("#searchEmployeeButton").click(function(){  
			loadEmployeeData();
		});  
		
})