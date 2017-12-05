package com.group.user.auth;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.group.user.service.UserService;
import com.group.user.vo.UserVO;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(
		HttpServletRequest request, 
		HttpServletResponse response, 
		Object handler)
		throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printwriter = response.getWriter();

		int employeeNo = Integer.parseInt(request.getParameter( "employeeNo" ));
		String password = request.getParameter( "password" );
		
		UserVO userVo = userService.getUser(employeeNo, password);
		
		if( userVo == null ) {
			
			printwriter.print("<script>alert('사원번호와 비밀번호를 확인해주세요.'); history.go(-1);</script>");
			printwriter.flush();
			printwriter.close();
			
			return false;
		}
		
		//승인받지 않은 회원일경우
		if( userVo.getIsAuthority().equals("N")) {
			
			printwriter.print("<script>alert('승인 대기중입니다. 관리자에게 문의하세요.'); history.go(-1);</script>");
			printwriter.flush();
			printwriter.close();
			
			return false;
		}
		
		// session 처리
		HttpSession session = request.getSession( true );
		session.setAttribute( "authUser", userVo );
		response.sendRedirect( request.getContextPath()+"/home" );
		
		System.out.println(userVo.getRole());
		System.out.println(session.getAttribute("authUser"));
		return true;
		
	}

}
