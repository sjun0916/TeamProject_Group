package com.group.service;

import java.util.List;

import com.group.vo.MemberVO;

public interface MemberService {
	public abstract List<MemberVO> list();
	
	public abstract void insert(MemberVO memberVO);
	
	public abstract MemberVO select(int membernum);
}
