<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table tr th {
   text-align: center;
}
</style>
<script>
   $(function() {
       $("#example1").DataTable();
       $('#example2').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": false,
            "autoWidth": false
      });
      
      $("#Submit").click(function(){
         var emails = "";
         $("input[name=checkbox]:checked").each(function(){
            emails += $(this).val() +", ";
         })
         
         emails = emails.substring(0, emails.lastIndexOf(","));
         var original = $.trim($('#toInput', opener.document).val());
         
         if(original==null || original=="") {   
            $('#toInput', opener.document).val(emails);
         } else {   
            $('#toInput', opener.document).val(original+","+emails);            
         }
         
         $('#titleInput', opener.document).focus();
         self.close();
      });
   })
   
</script>
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <div class="row">
      <div class="col-xs-12">
         <div class="box">
         
         <div class="box-body">
            <div id="searchDiv" class="box-body table-responsive no-padding">
               <table id="example2" class="table table-bordered table-striped">
               <thead>
                  <tr>
                     <th>선택</th>
                     <th>부서</th>
                     <th>직급</th>
                     <th>이름</th>
                     <th>이메일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="vo" items="${ member }">
                     <tr class="memberTr">
                        <td style="text-align: center;">
                        <input type="checkbox" name="checkbox" class="flat-red" value="${ vo.member_email }">
                        </td>
                        <td>${ vo.dep_name }</td>
                        <td>${ vo.rank_name}</td>
                        <td>${ vo.member_name }</td>
                        <td>${ vo.member_email }</td>
                     </tr>
                  </c:forEach>
               </tbody>
               </table>
               <c:if test="${ not empty member }">
               <div class="box-footer">
                  <input type="button" id="Submit" value="Submit" class="btn btn-default btn-block">
               </div>
               </c:if>
            </div>
         </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>