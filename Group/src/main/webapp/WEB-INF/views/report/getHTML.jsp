<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://files.codepedia.info/uploads/iScripts/html2canvas.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var element = $("#previewImage");	
	var imageData ; 					
	
	html2canvas(element, {				
		onrendered : function(canvas) {	
			imageData = canvas.toDataURL("image/png");	
		}
	});
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/image/upload",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data : { "imageData" : imageData},
		success : function(json) {
			
		}
	})
	
	$("#imageDown").click(function(){	// 이미지로 저장 !
		var newData = imageData.replace(/^data:image\/png/,"data:application/octet-stream");
		$("#imageDown").attr("download", "결재서류.png").attr("href", newData);
	});	
});

</script>
<div style="height: 50px;" align="center">
	<a href="#" id="imageDown">
	<img src="${pageContext.request.contextPath}/resources/img/down.png" 
		alt="이미지로 저장하기">
	</a>
</div>
<div id="previewImage" style="margin: 0 auto;" align="center">
${regCont}
</div>

