package com.group.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.user.dao.UserDao;
import com.group.user.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public boolean join( UserVO userVo ) {
		return userDao.insert( userVo ) == 1;
	}
	
	public UserVO getUser(int no) {
		return userDao.get(no);
	}
	
	public UserVO getUser(int no,String password) {
		return userDao.get(no,password);
	}
	
	
	public List<UserVO> getTeamList(){
		return userDao.getTeamList();
		
	}	
	public List<UserVO> getPositionList(){
		return userDao.getPositionList();
		
	}
	public List<UserVO> getNotApproved(){
		return userDao.getNotApproved();
		
	}
	
	public int approveJoin(UserVO userVo) {
		return userDao.approveJoin(userVo);
	}
}
