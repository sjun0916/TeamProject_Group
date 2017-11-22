package com.group.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.vo.UserVO;

@Repository
public class MyPageDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int modify( UserVO userVo) {
		return sqlSession.update("mypage.modify", userVo );
		
	}
	
}