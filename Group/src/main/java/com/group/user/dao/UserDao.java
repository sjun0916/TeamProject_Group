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
	
	// 사원등록
	public int insert( UserVO vo ) {
		int count = sqlSession.insert("user.insert", vo);
		return count;
	}	
	
	// pk_사원번호 받아오기
	public UserVO get( int employeeNo ) {
		return sqlSession.selectOne( "user.getByNo", employeeNo );
	}
	
	// 세션에 등록하기 위한 사원번호와 비밀번호 받아오기
	public UserVO get( int employeeNo, String password ){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeNo", employeeNo);
		map.put("password", password);
		UserVO vo = sqlSession.selectOne("user.getByemployeeNoAndPassword", map);
		
		return vo;
	}
	
	// 비밀번호 이메일 인증
	public String getPw(Map<String, Object> paramMap) {
		System.out.println("test");
		return sqlSession.selectOne("user.getPw",paramMap);
	}

	// 사원번호 찾기
	public String getNo(Map<String, Object> paramMap) {
		System.out.println("test");
		return sqlSession.selectOne("user.getNo",paramMap);
	}

	// 팀목록
	public List<UserVO> getTeamList(){
		return sqlSession.selectList("user.getTeamList");
	}
	
	// 직급목록
	public List<UserVO> getPositionList(){
		return sqlSession.selectList("user.getPositionList");
	}
	
	// 가입승인되지 않은 목록
	public List<UserVO> getNotApproved(){
		return sqlSession.selectList("user.getnotapproved");
	}
	
	// 가입승인된 회원
	public int approveJoin( UserVO userVo) {
		return sqlSession.update("user.approvejoin", userVo );
		
	}
	
}
