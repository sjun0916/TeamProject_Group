<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script type="text/javascript">
$(function(){
   // 받는 사람 검색하기 !!
   $("#searchBtn").click(function(){
      var location = "${pageContext.request.contextPath}/mail/search";
      window.open(location,'window_name','width=600,height=500,location=no,status=no,scrollbars=yes');
   });
   
//    $("#mailSend").click(function(){
// 	   var mailContent2 = $("#mailForm2").serialize();
// 	   alert("asfdsaf");
// 	   $.ajax({
// 		   'url' : '${pageContext.request.contextPath}/mail/send',
// 			'type' : 'post',
// 			'data' : mailContent2,
// 			'dataType' : 'json',
// 			'success' : function(data){
// 				alert('success');
// 			},
// 			'error' : function(){
// 				alert('error');
// 			}
// 	   })
//    });
   
})
</script>
<div class="content-wrapper" style="min-height: 901px;">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>Mail</h1>
   </section>  
   <section class="content">
      <div class="row">
         <div class="col-md-12">
            <!-- 메일 쓰기 폼 -->
            <div class="box">  
               <div class="box-header with-border">
                  <h3 class="box-title">Send Mail</h3>
               </div>
               <form name="mailForm" method="post" id="mailForm"
                   	 enctype="multipart/form-data" action="${pageContext.request.contextPath}/mail/send"> 
				<%-- <form name="mailForm" id='mailForm'> --%>
                  <div class="box-body">
                     <div class="form-group">
                     <div class="input-group input-group-sm">
                        <c:if test="${ not empty getEmail }">
                           <input type="text"  name="toInput" id="toInput" class="form-control" value="${ getEmail }" >
                        </c:if>
                        <c:if test="${ empty getEmail }">
<!--                            선택안하고 메일보내기 눌렀을때  -->
                           <input type="text"  name="toInput" id="toInput" class="form-control" placeholder="To:" >
                        </c:if>
                        <span class="input-group-btn">
                           <input type="button" name="searchBtn" id="searchBtn" class="btn btn-info btn-flat" value="검색"/>
                        </span>
                     </div>
                     </div>
                     <div class="form-group">
                        <input type="text" id="titleInput" name="titleInput" class="form-control" placeholder="제목:">
                     </div>
<!--                      메일아이디 -->
                     <div class="form-group">
                        <input type="text" id="mailID" name="mailID" class="form-control" placeholder="내 구글 ID 입력">
                     </div>
<!--                      메일비밀번호 -->
                     <div class="form-group">
                        <input type="password" id="mailPW" name="mailPW" class="form-control" placeholder="내 구글 PW 입력 (본인확인을 위해 쓰이며 어떠한 경우에도 저장되지 않습니다.)">
                     </div>                     
                                          
                     <div class="form-group">
                        <textarea id="compose-textarea" class="textarea" name="mailContent"
                           style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                      
                             </textarea>
                     </div>
                     <div class="pull-right">
                        <button type="submit" class="btn btn-primary">
                           <i class="fa fa-envelope-o"></i> 보내기
                        </button>
<!-- 						<input type="button" id="mailSend" class="btn btn-primary"> -->
                     </div>
                     
                  </div>
                  <div class="box-footer">
                     <span></span>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </section>
</div>
</body>
</html>