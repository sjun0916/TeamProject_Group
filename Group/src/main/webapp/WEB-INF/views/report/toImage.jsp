<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://files.codepedia.info/uploads/iScripts/html2canvas.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var element = $("#previewImage");
	var imageData
	
	html2canvas(element, {
		onrendered : function(canvas) {
			imageData = canvas.toDataURL("image/png");
		}
	});
	
	$("#imageDown").click(function(){
		
		var newData = imageData.replace(/^data:image\/png/, "data:application/octet-stream");
		$("#imageDown").attr("download", "결재서류.png").attr("href", newData);
	});
	
});
 
</script>
</head>
<body>
<div id="previewImage">
${content}
</div>
<div>
	<a href="#" id="imageDown"><img src="" alt="이미지로 저장"></a>
</div>
</body>
</html>