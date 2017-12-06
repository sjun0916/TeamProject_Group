package com.group.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.user.dao.MyPageDao;
import com.group.user.vo.UserVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	// 회원정보 수정
	public int modify(UserVO userVo) {
		int result = myPageDao.modify(userVo);
		
		return result;
	}
	
}

