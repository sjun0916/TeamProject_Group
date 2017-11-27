package com.group.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.user.vo.UserVO;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert( UserVO vo ) {
		int count = sqlSession.insert("user.insert", vo);
		return count;
	}	
	
	public UserVO get( int employeeNo ) {
		return sqlSession.selectOne( "user.getByNo", employeeNo );
	}
	
	
	public UserVO get( int employeeNo, String password ){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeNo", employeeNo);
		map.put("password", password);
		UserVO vo = sqlSession.selectOne("user.getByemployeeNoAndPassword", map);
		
		return vo;
	}
	
//	비밀번호 이메일 인증
	public String getPw(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (String) sqlSession.selectOne("user.getPw",paramMap);
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
