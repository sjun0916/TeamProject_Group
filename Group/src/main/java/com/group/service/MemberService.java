package com.group.service;


import javax.servlet.http.HttpSession;

import com.group.vo.MemberVO;

public interface MemberService {
	// 01. 로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session);
	
	// 02. 로그인 정보
	public MemberVO veiwMember(MemberVO vo);
	
	// 03. 로그아웃
	public void logout(HttpSession session);
	
}
