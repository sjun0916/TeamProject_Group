package com.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.dao.MyPageDao;
import com.group.vo.UserVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	public int modify(UserVO userVo) {
		int result = myPageDao.modify(userVo);
		
		return result;
	}
	
}

