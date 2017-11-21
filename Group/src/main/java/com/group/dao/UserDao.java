package com.group.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.exception.UserDaoException;
import com.group.vo.UserVO;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert( UserVO vo ) {
		int count = sqlSession.insert("user.insert", vo);
		return count;
	}	
	
	public UserVO get( String employeeNo ) {
		return sqlSession.selectOne( "user.getByNo", employeeNo );
	}
	
	
	public UserVO get( String employeeNo, String password ) throws UserDaoException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeNo", employeeNo);
		map.put("password", password);
		UserVO vo = sqlSession.selectOne("user.getByemployeeNoAndPassword", map);
		
		return vo;
	}

	public List<UserVO> getTeamList(){
		return sqlSession.selectList("user.getTeamList");
		
	}
	public List<UserVO> getPositionList(){
		return sqlSession.selectList("user.getPositionList");
		
	}
	
	public List<UserVO> getNotApproved(){
		return sqlSession.selectList("user.getnotapproved");
		
	}
	public int approveJoin( UserVO userVo) {
		return sqlSession.update("user.approvejoin", userVo );
		
	}
	
}
