package com.group.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group.service.MemberService;
import com.group.vo.MemberVO;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
public class MemberController {
	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	//01. 로그인 화면
	@RequestMapping("/content_login/login")
	public String login() {
		return "/content_login/login";
	}
	
	//02. 로그인 처리
	@RequestMapping("/content_login/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {//로그인 성공
			//메인페이지 이동
			mav.setViewName("home");
			mav.addObject("msg", "success");
		} else { //로그인 실패
			//로그인페이지 이동
			mav.setViewName("/content_login/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	// 03. 로그아웃 처리
	@RequestMapping("/content_login/logout")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/content_login/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
}
