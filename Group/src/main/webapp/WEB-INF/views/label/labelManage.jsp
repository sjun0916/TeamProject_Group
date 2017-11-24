<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.modalscroll {
     width: 41em; 
     height: auto; 
    line-height: 2em;
    /* border: 1px solid #ccc; */
    padding: 0;
    margin: 0;
    overflow: auto;
    overflow-x: hidden;
    
    
}


.no-padding {
    padding: 0 !important;
}
.box-footer {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top: 1px solid #f4f4f4;
    padding: 10px;
    background-color: #fff;
}

.label{
    font-weight: 700;
    line-height: 1;
    white-space: nowrap;
    vertical-align: baseline;
    text-align: center;
}
.btn-group-sm>.btn, .btn-sm {
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
 .btn-main2 {
    background-color: #3bc1c5;
    color: #fff;
    border-color: #3bc1c5; 
}
 .btn-o2 { 
     background: 0 0!important; 
 } 
.disable {
  

box-shadow:none;
  
}

a[disabled="disabled"] {
    pointer-events: none;
    opacity: .6;
 	cursor: default !important;
}
.checked {
    color: #3bc1c5!important;
    border: 2px solid #3bc1c5!important;
    font-weight: 700;
}

</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 841px;">

	<!-- Content Header (Page header) -->
	<section class="content-header">
	
		<h1>
			Label <small>State panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> report</a></li>
			<li class="active">state</li>
		</ol>
	</section>
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">${title}</h3>

					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<button type="button" id="createLabel" data-toggle="modal" data-target="#myModal" class="btn btn-block btn-info">라벨만들기</button>
							
							<div class="input-group-btn">
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
				
					<table class="table table-hover" id="labeltable">
						<tbody>
							<tr>
								<th>색</th>
								<th>라벨명</th>
								<th>문서 수</th>
								<th>작업</th>
								
							</tr>
							
							<c:forEach items="${list}" var="vo">
							
							<tr>
								<td>
								<span class="label" style="background-color:${vo.label_color}; vertical-align: middle; margin-right: 10px;">
              					</span>
              					</td>
              					<c:if test="${vo.label_onum==0}">
              					<td>${vo.label_name}</td>
								</c:if>
								<c:if test="${vo.label_onum ne 0}">
								<td>&nbsp;&nbsp;-&nbsp;${vo.label_name}</td>
								</c:if>
								<td>${vo.label_document}</td>
								<td>
								<button class="btn btn-main2 btn-sm disable displayBtn"  data-name="${vo.label_name}" data-listnum="${fn:length(highlist)}" data-gnum="${vo.label_gnum}" data-onum="${vo.label_onum}" data-num="${vo.label_num}" data-toggle="modal" data-target="#myModalModify" style="height:27px;">수정</button>
								<button class="btn btn-o2 btn-default  btn-sm displayBtn" data-docu="${vo.label_document}" data-name="${vo.label_name}" data-gnum="${vo.label_gnum}" data-onum="${vo.label_onum}" data-num="${vo.label_num}" data-color="${vo.label_color}" data-toggle="modal" data-target="#myModalDelete" style="height:27px; vertical-align: middle;">삭제</button>
								</td>
								
							<tr>
							</c:forEach>
							

						</tbody>
					</table>
				</div>

			</div>
			
		</div>
	
		
</div>
<!-- 라벨 삭제 모달 -->
<div class="example-modal">
        <div class="modal" id="myModalDelete" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" id="inputLabel" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">문서에서 라벨제거</h4>
              </div>
              <div class="modal-body" style="min-height: 200px; max-height: 763px;">
              	<div style="margin-top: 25px;" class="margin-top-30">
              		<strong>문서에서 지정된 아래의 라벨이 삭제됩니다.</strong>
              	</div>
<!--               	<input type="text" autofocus id="label_name" placeholder="라벨명" class="form-control"> -->
					<input type="hidden" id="labeldeletenum" value="">
					<input type="hidden" id="labeldeletegnum" value="">
					<input type="hidden" id=labeldeleteonum value="">
					<input type="hidden" id=labeldeletename value="">
					<input type="hidden" id=labeldeletedocu value="">
              		<div style="margin-top: 20px;">
              			
              		</div>
              <div style="margin-bottom: 30px; clear: both;">
              	<div class="box-footer no-padding" style="margin-top: 10px;">
              		<ul class="nav nav-stacked modalscroll" id="modalulDelete">
              		
              			<!--/////////////////////////////////////////////////  -->
              	
              			<!--//////////////////////////////////////////  -->
              			
              			
              		</ul>	
              	
                            	
              	</div>
                          
              
              </div>
                            
               
              </div>
              <div class="modal-footer">
                <button type="button" id="saveDelete" style="width: 22%;" class="btn btn-wide btn-o btn-info">삭제</button>
                <button type="button" style="width: 22%;" class="btn btn-wide btn-main" data-dismiss="modal">취소</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>















	<!-- 입력 모달 -->
		<div class="example-modal">
        <div class="modal" id="myModal" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" id="inputLabel" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">라벨 만들기</h4>
              </div>
              <div class="modal-body" style="min-height: 200px; max-height: 763px;">
              	<div style="margin-top: 25px;" class="margin-top-30">
              		<strong>라벨명</strong>
              	</div>
              	<input type="text" autofocus id="label_name" placeholder="라벨명" class="form-control">
              		<div style="margin-top: 20px;">
              			
              			<input type="checkbox" class="icheckbox_square-blue checked" value="true" id="labelcheck">
              			<label for="labelcheck">상위 라벨 선택</label>
              			<!--icheck checkbox꾸미기 부분. 나중에 시간나면 할것.  -->
              		</div>
              <div style="margin-bottom: 30px; clear: both;">
              	<div class="box-footer no-padding" style="margin-top: 10px;">
              		<ul class="nav nav-stacked modalscroll" id="modalul">
              		
              			<c:forEach items="${highlist}" var="x" varStatus="status">
              			<li>
              				
              				<a class="disableLabel"  id="LabelSequence${status.count}" href="${x.label_num}"  disabled="disabled">
              				
              				<span class="label" style="background-color: ${x.label_color}; vertical-align: middle; margin-right: 10px;">
              				</span>
              				<span class="highlabelName">${x.label_name}</span>
              				</a>
              			    		      			             				
              				
              				
              		
              			</li>
              			</c:forEach>
              			
              		</ul>	
              	
                            	
              	</div>
                          
              
              </div>
                            
               
              </div>
              <div class="modal-footer">
                <button type="button" id="saveInsert" style="width: 22%;" class="btn btn-wide btn-o btn-info">만들기</button>
                <button type="button" style="width: 22%;" class="btn btn-wide btn-main" data-dismiss="modal">취소</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>
      
      <!--라벨 수정 모달  -->
 <div class="example-modal">
        <div class="modal" id="myModalModify" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" id="inputLabel" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">라벨 수정</h4>
              </div>
              <div class="modal-body" style="min-height: 200px; max-height: 763px;">
              	<div style="margin-top: 25px;" class="margin-top-30">
              		<strong>라벨명</strong>
              	</div>
              	<input type="text" autofocus id="label_name2" placeholder="라벨명" class="form-control">
              	<input type="hidden" id="labelnum" value=""/>
              	<input type="hidden" id="labelgnum" value=""/>
              		<div style="margin-top: 20px;" id="checkDiv">
              			
              			<input type="checkbox" class="icheckbox_square-blue checked" value="true" checked id="labelcheckEdit">
              			<input type="checkbox" class="icheckbox_square-blue checked" value="true" id="labelcheckEdit2">
              			
              			<input type="hidden" id=labelhighnum value="">
              			<input type="hidden" id=labelhighgnum value="">
              			<input type="hidden" id=highlistnum value="">
              			
              			
              			<label for="labelcheckEdit" id="forlabel1">상위 라벨 선택</label>
              			<label for="labelcheckEdit2" id="forlabel2">상위 라벨 선택</label>
              			<!--icheck checkbox꾸미기 부분. 나중에 시간나면 할것.  -->
              		
              		</div>
              <div style="margin-bottom: 30px; clear: both;">
              	<div class="box-footer no-padding" style="margin-top: 10px;">
              	       <ul class="nav nav-stacked modalscroll" id="modalulEdit">
              		
              			  <c:forEach items="${highlist}" var="x" varStatus="status"> 
<%-- 							<c:if test="${x.label_num ne  }"></c:if> --%>
               			<li> 
              				
              				<a class="disableLabel" id="LabelSequenceSide${status.count}" href="${x.label_num}"  disabled="disabled"> 
              				
              				<span class="label" style="background-color: ${x.label_color}; vertical-align: middle; margin-right: 10px;"> 
               				</span> 
               				<span id="highlabelNameId" class="highlabelName">${x.label_name}</span>
               				<span id="lowgnum${status.count}" style="display:none;" >${x.label_gnum}</span> 
              				</a> 
              			    		      			             				
              				              		<!-- style="display:none;" -->	
              		
              			</li> 

              			 </c:forEach>  
              			 
              		</ul>
              		
              		
              		<ul class="nav nav-stacked modalscroll" id="modalulhighEdit">
              		
              			
              			  <c:forEach items="${highlist}" var="x" varStatus="status"> 
							
               			<li> 
              				
              				<a class="disableLabel"  id="LabelSequenceSide2${status.count}" href="${x.label_num}"  disabled="disabled"> 
              				
              				<span class="label" style="background-color: ${x.label_color}; vertical-align: middle; margin-right: 10px;"> 
               				</span> 
               				<span id="highlabelNameId2${status.count}" class="highlabelName">${x.label_name}</span>
               				<span id="lowgnum2${status.count}" style="display:none;" >${x.label_gnum}</span> 
              				</a> 
              			    		      			             				
              				              		<!-- style="display:none;" -->	
              		
              			</li> 

              			 </c:forEach>  
              		
              		
              		             		
              		</ul>
              		 	     	
                            	
              	</div>
                          
              
              </div>
                            
               
              </div>
              <div class="modal-footer">
                <button type="button" id="saveModify" style="width: 22%;" class="btn btn-wide btn-o btn-info">수정</button>
                <button type="button" style="width: 22%;" class="btn btn-wide btn-main" data-dismiss="modal">취소</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>     
<script>

// function refresh(){
//  	$("#labeltable").empty();
//  	$("#last").empty();

// 	jQuery('#labeltable').load("${pageContext.request.contextPath}/label/select3");
// }
function reLoad(){
	//window.locaion.reload();
	window.location=location.pathname;
}

function byteCheck(string){
	var stringLength = string.length;
	var stringByteLength = 0;
	
	stringByteLength = (function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b
	})(string);
	
	return stringByteLength;
	
}

$(function(){
	
// 	$('a["title"]').on('mouseenter', function(e){
// 	    e.preventDefault();
// 	});
	//$('a["title"]').css("visibility","hidden");
	
// 	$('a').hover(function() {

//     $(this).attr('title', '');

// });
	
	$("#modalulhighEdit").css("display","none");
	$("#checkDiv").css("display","none");
	$("#labelcheckEdit2").hide();
	$("#forlabel2").hide();
	
	
	
	
 	$("a[id^='LabelSequence']").click(function(e){
 		e.preventDefault();
	});
	
	
	if($("#LabelSequence13").length > 0 ){
		$(".modalscroll").css("height","43em")
		
		
	}
	
	
	
	
	//고맙다 스택오버플로우!!
	//모달 닫을때.
	$('[data-dismiss=modal],#createLabel').on('click', function (e) {
// 		var flag = true;
// 		if(("#myModalModify").length){
// 			flag = false;
// 		}
		$(".disableLabel").attr("disabled",true);
		$(".disableLabel").removeClass("checked");
		
		
		var $t = $(this),
	        target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];

	  $(target)
	    .find("input,textarea,select")
	       .val('')
	       .end()
	    .find("input[type=checkbox], input[type=radio]")
	       .prop("checked", "")
	       .end();
	  
	  
	  $("#modalulhighEdit").css("display","none");
	  $("#checkDiv").css("display","none");
	
	  $("#labelcheckEdit").show();
	  $("#labelcheckEdit2").hide();
	  $("#forlabel1").show();
	  $("#forlabel2").hide();
	
	 
	  
	 
	    	
		$("a[id^='LabelSequenceSide2']").show();
		   		    	
		    
		    
	  
	  
	})
	
	
	$("#saveInsert").click(function(){
		
		
		var value = $('#label_name').val().trim();
		
		value = value.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		if(value == "") {
			alert("라벨명을 입력하세요");
			
			return false;
		}else if(byteCheck(value)>50){
			alert("입력 byte길이 : "+ byteCheck(value)+", 최대허용 byte:50, 글자 수가 너무 많습니다");
			return false;
		}
		//나중에 사이드메뉴는 길경우 끝에 ...으로 표시하자.
		
		var highname="";
		var highnum=0;
		var url = "${pageContext.request.contextPath}/label/insertlabel";
		
		 
		if($(".disableLabel").hasClass("checked") && $("#labelcheck").is(":checked")){
		 //highname =$(".checked").text().trim();
		 highnum = $(".disableLabel.checked").attr("href");
		 url = '${pageContext.request.contextPath}/label/insertlow/'+highnum;
		}
						
		$.ajax({
						
			'url' : url,
			'type' : 'post',
			'data' : {'label_name' : value},
			'success' : function(data){
								
				reLoad();
				//reList()
			},
			
			'dataType' : 'json'
					
		})
	
		$(this).attr("data-dismiss","modal");

		
	});
	
	
	/* 삭제모달 로직 */	
	$('#myModalDelete').on('show.bs.modal', function(e) {
		
		
	    //get data-id attribute of the clicked element
	    var mylabelnum = $(e.relatedTarget).data('num');
	    var mylabelonum = $(e.relatedTarget).data('onum');
	    var mylabelgnum = $(e.relatedTarget).data('gnum');
	    //var mulabelcolor = $(e.relatedTarget).data('color');
	    var mylabelname = $(e.relatedTarget).data('name');
	    var mylabeldocu = $(e.relatedTarget).data('docu');
	    
	    
	    //populate the textbox
	    $(e.currentTarget).find('.modal-body #labeldeletenum').val(mylabelnum);
	    $(e.currentTarget).find('.modal-body #labeldeleteonum').val(mylabelonum);
	    $(e.currentTarget).find('.modal-body #labeldeletegnum').val(mylabelgnum);
	    //$(e.currentTarget).find('.modal-body #highlistnum').val(mulabellistnum);
	    $(e.currentTarget).find('.modal-body #labeldeletename').val(mylabelname);
	    $(e.currentTarget).find('.modal-body #labeldeletedocu').val(mylabeldocu);
	
		var gnum = $("#labeldeletegnum").val();
	    
		var onum = $("#labeldeleteonum").val();
		
		var name = $("#labeldeletename").val();
		
		var docu = $("#labeldeletedocu").val();
		
	
		var url = "";
		if(onum == "0"){
			
			url = "${pageContext.request.contextPath}/label/deletelist";
			
				
			
			$.ajax({
			
			'url' : url,
			'type' : 'post',
			'data' : {'label_gnum' : gnum},
			'success' : function(data){
								
				var code = "";
				$.each(data,function(i,v){
				
					
						 
					 					
					if(v.label_onum ==0){
					code+='<li>';
					code+='<a class="disableLabel checked" title="'+v.label_num+'" id="">';	
					code+='<span class="label" id="wac" style="background-color:'+v.label_color+'; vertical-align: middle; margin-right: 10px;"></span>';
					code+='<span class="highlabelName">'+v.label_name+'</span><span>('+v.label_document+')</span>';	
					code+='</a></li>';
					}else{
					code+='<li>';
					code+='<a class="disableLabel checked" style="margin-left: 4%;" title="'+v.label_num+'" id="">';	
					code+='<span class="label" style="background-color: '+v.label_color+'; vertical-align: middle; margin-right: 10px;"></span>';
					code+='<span class="highlabelName">'+v.label_name+'</span><span>('+v.label_document+')</span>';	
					code+='</a></li>';
						
					} 
									
						
					
				})
				//$(data).find("#modalulDelete").append(code).trigger("create");
				
				$('#modalulDelete').html(code);
				//$('#modalulDelete').html(code).trigger("refresh");
				//$("#modalulDelete").
			
			},
			
			'dataType' : 'json'
					
		})
			
				
			
			
		}
		if(onum =="1"){
			
			url = "${pageContext.request.contextPath}/label/deletelist2";
			
			
			
			$.ajax({
			
			'url' : url,
			'type' : 'post',
			'data' : {'label_gnum' : gnum},
			'success' : function(v){
								
				var code = "";
				
				 
					 					
					
					code+='<li>';
					code+='<a class="disableLabel checked" href="'+v.label_num+'" id="">';	
					code+='<span class="label" style="background-color:'+v.label_color+'; vertical-align: middle; margin-right: 10px;"></span>';
					code+='<span class="highlabelName">'+v.label_name+' / '+name+'</span><span> ('+docu+') </span>';	
					code+='</a></li>';
					/* 
					code+='<li>';
					code+='<a class="disableLabel" style="margin-left: 4%;" title="'+v.label_num+'" id="">';	
					code+='<span class="label" style="background-color: '+v.label_color+'; vertical-align: middle; margin-right: 10px;"></span>';
					code+='<span class="highlabelName">'+v.label_name+'</span>';	
					code+='</a></li>'; */
										
					
					
					
			
				//$(data).find("#modalulDelete").append(code).trigger("create");
				
				$('#modalulDelete').html(code);
				//$('#modalulDelete').html(code).trigger("refresh");
				//$("#modalulDelete").
				
			},
			
			'dataType' : 'json'
					
		})
			
		}
		
					
	
	
	
	
	});
	
	
	$("#saveDelete").click(function(){
		
		var onum = $("#labeldeleteonum").val();
		var name = $("#labeldeletename").val();
		var gnum = $("#labeldeletegnum").val();
		var num = $("#labeldeletenum").val();
		var url = ""
		
		if(onum == "0"){
			
			url = "${pageContext.request.contextPath}/label/deletelabelGnum/"+gnum;
			
			
			
		}else{
			
		
			url = "${pageContext.request.contextPath}/label/deletelabel";
			
		}
		
		$.ajax({
			
			'url' : url,
			'type' : 'post',
			'data' : {'label_num' : num},
			'success' : function(data){
								
									
				reLoad();
				
				
			},
			
			'dataType' : 'json'
					
		})
		
		
		
		$(this).attr("data-dismiss","modal");
		
	});
	
	
	
	
	
	
	
	
	
	
	/* 모달 호출한 태그에서부터 모달로 데이터 전송하는 방법 */	
	$('#myModalModify').on('show.bs.modal', function(e) {
		
		
	    //get data-id attribute of the clicked element
	    var mylabelnum = $(e.relatedTarget).data('num');
	    var mylabelonum = $(e.relatedTarget).data('onum');
	    var mylabelgnum = $(e.relatedTarget).data('gnum');
	    var mulabellistnum = $(e.relatedTarget).data('listnum');
	    var mylabelname = $(e.relatedTarget).data('name');
	    //populate the textbox
	    $(e.currentTarget).find('.modal-body #labelnum').val(mylabelnum);
	    $(e.currentTarget).find('.modal-body #labelhighnum').val(mylabelonum);
	    $(e.currentTarget).find('.modal-body #labelhighgnum').val(mylabelgnum);
	    $(e.currentTarget).find('.modal-body #highlistnum').val(mulabellistnum);
	    $(e.currentTarget).find('.modal-body #label_name2').val(mylabelname);
	    
	    var labe_gnum = $("#labelhighgnum").val();
	    
// 	    if("#label_name2".val()== )
	    
			$.ajax({
			
			'url' : '${pageContext.request.contextPath}/label/highmodify',
			'type' : 'post',
			'data' : {'label_gnum' : labe_gnum},
			'success' : function(data){
								
				if(data == 1){
					$("#modalulhighEdit").css("display","block");
					$("#checkDiv").css("display","block");
					$("#labelcheckEdit").hide();
					$("#labelcheckEdit2").show();
					$("#forlabel1").hide();
					$("#forlabel2").show();
					
					
					 $(".disableLabel").attr("disabled",true);
						
					 
									   
					  				  
					  
					
				}
			},
			
			'dataType' : 'json'
					
		})
		
			
	 $("#labelcheckEdit2").change(function(){
					    	
	       if($(this).is(":checked")){
	       	$(".disableLabel").attr("disabled",false);
	       }else{
	       	$(".disableLabel").attr("disabled",true);
	       	$(".disableLabel").removeClass("checked");
	       }
					     
	    });
		
	        
	    
	    
	    var size= $("#highlistnum").val();
	    	    
		for(var i=1; i<=size; i++){
	    	
		    if($("#labelhighgnum").val()==$("#lowgnum"+[i]).text()){
		    		$("#LabelSequenceSide"+[i]).addClass("checked");
		    		//checkedgnum = $("#lowgnum"+[i]).text(); //중요!!
		    }
		    
		    if($("#labelnum").val()==$("#LabelSequenceSide2"+[i]).attr("href")){
		    	//$("#LabelSequenceSide2"+[i]).attr("title")
		    	$("#LabelSequenceSide2"+[i]).hide();
		    	
		    }
		    	
		    
		    }
	    
	    					
	    $("#labelcheckEdit").prop("checked",true);	
	    $(".disableLabel").attr("disabled",false);
	    
	    	
		    
	    
	    
	    $("#labelcheckEdit").change(function(){
	    	
	        if($(this).is(":checked")){
	        	$(".disableLabel").attr("disabled",false);
	        }else{
	        	$(".disableLabel").attr("disabled",true);
	        	//$(".disableLabel").removeClass("checked");
	        }
	        //$("#saveInsert").attr("data-dismiss","modal");
	    });
	    
	    
	    
 		if($("#labelhighnum").val()=="0"){
	    	
 			$("#modalulEdit").css("display","none");
 			$("#checkDiv").css("display","none");
 		}else{
 			$("#modalulEdit").css("display","block");
 			$("#checkDiv").css("display","block");
			
 		}
 
 
 
 		
	});
	
	
	
	
	
	
	
	$("#saveModify").click(function(){
		
		var value = $('#label_name2').val().trim();
		value = value.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		if(value == "") {
			alert("라벨명을 입력하세요");
			
			return false;
		}else if(byteCheck(value)>50){
			alert("입력 byte길이 : "+ byteCheck(value)+", 최대허용 byte:50, 글자 수가 너무 많습니다");
			return false;
		}
		
		var labelnum = $("#labelnum").val();
		var url = "${pageContext.request.contextPath}/label/modifylabel";
		
		var labelgnum ="";
		var highnum = 0;
		var checkedgnum =0;
		
		if($(".disableLabel").hasClass("checked") && $("#labelcheckEdit").is(":checked")){
									
			
			checkedgnum = $(".checked").children().eq(2).text();
			
			url = "${pageContext.request.contextPath}/label/modifylabel3/"+checkedgnum 
			
		}
		
		if($(".disableLabel").hasClass("checked") && $("#labelcheckEdit2").is(":checked")){
			
			highnum = $(".disableLabel.checked").attr("href");
			
			url = "${pageContext.request.contextPath}/label/modifyhighlabel/"+highnum;
			
		}
		
		
		
		$.ajax({
						
			'url' : url,
			'type' : 'post',
			'data' : {'label_name' : value,'label_num' : labelnum},
			'success' : function(data){
							
				reLoad();
				
			},
			
			'dataType' : 'json'
					
		})
		
		
		
		$(this).attr("data-dismiss","modal");
		
	
		
		
	});
	
	
	
	
	
	
// 	$('#myModal').on('hidden.bs.modal', function () {
// 		  window.alert('hidden event fired!');
// 		});
	
	
	
	$(".disable").on('click',this,function(){
		$(this).blur();
	})
	
	
	
	 $("#labelcheck").change(function(){
	        if($(this).is(":checked")){
	        	$(".disableLabel").attr("disabled",false);
	        }else{
	        	$(".disableLabel").attr("disabled",true);
	        	$(".disableLabel").removeClass("checked");
	        }
	        //$("#saveInsert").attr("data-dismiss","modal");
	    });
	
	
	
	
	
	
	
	$(".disableLabel").click(function(){
		
		
		
		if($("a[id^='LabelSequence']").hasClass("checked")){
			
			$(".disableLabel").removeClass("checked");
			
			$(this).toggleClass("checked");
			
		}else{
			
			$(this).toggleClass("checked");
		}

		
	});
	

	
	
	
	
});



</script>      
      
      
      
      
<style>

      .example-modal .modal { 
      background: transparent !important; 
    }  
  </style>

