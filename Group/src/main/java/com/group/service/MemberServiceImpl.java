package com.group.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.group.dao.MemberDao;
import com.group.vo.MemberVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDao memberDao;
	
	// 01. 로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if(result) { // true이면 세션에 등록
			MemberVO vo2 = veiwMember(vo);
			//세션 변수 등록
			session.setAttribute("id", vo2.getId());
			session.setAttribute("name", vo2.getName());
		}
		return result;
	}
	
	// 02. 로그인 정보
	@Override
	public MemberVO veiwMember(MemberVO vo) {
		return memberDao.veiwMember(vo);
	}
	
	// 03. 로그아웃
	@Override
	public void logout(HttpSession session) {
		//세션 초기화
		session.invalidate();
	}


}
