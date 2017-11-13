package com.group.dao;

import java.util.List;

import com.group.vo.MemberVO;

public interface MemberDao {
	//sqlmap/sql_member.xml에 등록한 쿼리문 매핑 등록
	public abstract List<MemberVO> list();
	
	public abstract void insert(MemberVO memberVO);
	
	public abstract MemberVO select(int membernum);
}
