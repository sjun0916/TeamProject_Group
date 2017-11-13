package com.group.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.group.dao.MemberDao;
import com.group.vo.MemberVO;

@Service
//자동으로 스테레오 타입의 클래스를 탐지하고 대응
public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public List<MemberVO> list() {
		return memberDao.list();
	}

	@Override
	public void insert(MemberVO memberVO) {
		
	}

	@Override
	public MemberVO select(int membernum) {
		// TODO Auto-generated method stub
		return null;
	}

}
