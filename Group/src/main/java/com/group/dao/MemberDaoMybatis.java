package com.group.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.group.vo.MemberVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberDaoMybatis implements MemberDao {
	//SqlSession 객체를 스프링에서 생성하여 주입
	//의존관계 주입(Dependency Injection)
	@Inject
	SqlSession sqlSession; // Mybatis 실행 객체
	
	// 01. 로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo) {
		String name = sqlSession.selectOne("member.loginCheck", vo);
		return (name == null) ? false : true;
	}

	// 02. 로그인 정보
	@Override
	public MemberVO veiwMember(MemberVO vo) {
		return sqlSession.selectOne("member.veiwMember", vo);
	}
	
	// 03. 로그아웃
	@Override
	public void logout(HttpSession session) {
	}
}
