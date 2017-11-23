<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



		<form  name="loginform" method="post" action="${pageContext.servletContext.contextPath }/mypage/modify" enctype="multipart/form-data" >

			<p>
			</p>
			<div id="menu2">
				<hr>
				<p>사번 : <input type="text" name="employeeNo1" value="${authUser.employeeNo}" disabled> 
					<input type="hidden" name="employeeNo" value="${authUser.employeeNo}" ></p>
				<hr>
				<p>비밀번호 : <input type="password" name="password" /> </p>
				<hr>
				<p>사진업로드 : <input type="file" name="file" value="${authUser.imageUrl}"></p>
				<hr>
				<p>이름 : <input type="text" name="employeeName" value="${authUser.employeeName}"/></p>
				<hr>
				<p>소속 : <input type="text" name="teamName" value="${authUser.teamName}"  disabled></p>
				<hr>
				<p>이메일 : <input type="text" name="email" value="${authUser.email}" /></p>
				<hr>
				<p>직급 : <input type="text" name="positionName" value="${authUser.positionName}" disabled > </p>
				<hr>
				<hr><hr><hr>
				<button id="submit" style="width:160.8px; HEIGHT:22PX">변경하기</button>
				<hr><hr><hr>
				<hr><hr><hr>
				<hr><hr>
			</div>
		</form>

