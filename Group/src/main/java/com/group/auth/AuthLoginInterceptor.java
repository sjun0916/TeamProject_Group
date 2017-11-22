package com.group.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.group.service.UserService;
import com.group.vo.UserVO;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(
		HttpServletRequest request, 
		HttpServletResponse response, 
		Object handler)
		throws Exception {

		int employeeNo = Integer.parseInt(request.getParameter( "employeeNo" ));
		String password = request.getParameter( "password" );
		System.out.println(employeeNo);
		
		UserVO userVo = userService.getUser(employeeNo, password);

		
		if( userVo == null ) {
			response.sendRedirect( request.getContextPath() + "/user/login" );
			return false;
		}
		System.out.println(userVo.getIsAuthority());		
		//승인받지 않은 회원일경우
		if( userVo.getIsAuthority().equals("N")) {
			response.sendRedirect( request.getContextPath() + "/user/notapproval" );
			return false;
			
		}
		
		// session 처리
		HttpSession session = request.getSession( true );
		session.setAttribute( "authUser", userVo );
		response.sendRedirect( request.getContextPath()+"/home" );

		return true;
	}

}
