package com.group.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.user.dao.UserDao;
import com.group.user.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	// 회원가입
	public boolean join( UserVO userVo ) {
		return userDao.insert( userVo ) == 1;
	}
	
	// 유저 정보 받아옴
	public UserVO getUser(int no) {
		return userDao.get(no);
	}
	
	// 세션에 등록하기위한 사원번호, 비밀번호
	public UserVO getUser(int no,String password) {
		return userDao.get(no,password);
	}
	
	// 비밀번호 이메일 인증
	public String getPw(Map<String, Object> paramMap) {
		System.out.println("test");
		return userDao.getPw(paramMap);
	}
	
	// 사원번호 찾기
	public String getNo(Map<String, Object> paramMap) {
		System.out.println("test");
		return userDao.getNo(paramMap);
	}

	// 팀목록 받아오기
	public List<UserVO> getTeamList(){
		return userDao.getTeamList();
	}
	
	// 직급목록 받아오기
	public List<UserVO> getPositionList(){
		return userDao.getPositionList();
	}
	
	// 승인되지 않은 목록
	public List<UserVO> getNotApproved(){
		return userDao.getNotApproved();
	}
	
	// 승인된 사원
	public int approveJoin(UserVO userVo) {
		return userDao.approveJoin(userVo);
	}
}
