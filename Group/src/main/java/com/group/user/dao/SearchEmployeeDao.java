package com.group.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.user.vo.UserVO;

@Repository
public class SearchEmployeeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVO> getEmployeeList(UserVO userVo ) {
		return sqlSession.selectList( "searchEmployee.getEmployeeList",userVo );
	}
}