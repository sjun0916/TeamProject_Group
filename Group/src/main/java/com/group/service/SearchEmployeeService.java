package com.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.dao.SearchEmployeeDao;
import com.group.vo.UserVO;

@Service
public class SearchEmployeeService {

	@Autowired
	private SearchEmployeeDao searchEmployeeDao;
	
//	@Autowired
//	private MailDao mailDao;
	
	public List<UserVO> getEmployeeList(UserVO userVo) {
		List<UserVO> list = searchEmployeeDao.getEmployeeList(userVo);
		
		return list;
	}
	
//	public List<MailVO> getMessage(MailVO mailVo) {
//		List<MailVO> list = mailDao.getMail(mailVo);
//		
//		return list;
//	}
	
}
