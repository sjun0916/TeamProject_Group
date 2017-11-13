package com.group.dao;

import javax.servlet.http.HttpSession;

import com.group.vo.MemberVO;


//sqlmap/sql_member.xml에 등록한 쿼리문 매핑 등록
public interface MemberDao {
	// 01. 로그인 체크
	public boolean loginCheck(MemberVO vo);
	
	// 02. 로그인 정보
	public MemberVO veiwMember(MemberVO vo);
	
	// 03. 로그아웃
	public void logout(HttpSession session);
	
	

}
