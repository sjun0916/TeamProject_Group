package com.group.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.message.dao.MessageDao;
import com.group.message.vo.MessageVO;
import com.group.user.dao.SearchEmployeeDao;
import com.group.user.vo.UserVO;

@Service
public class SearchEmployeeService {

	@Autowired
	private SearchEmployeeDao searchEmployeeDao;
	
	@Autowired
	private MessageDao messageDao;
	
	public List<UserVO> getEmployeeList(UserVO userVo) {
		List<UserVO> list = searchEmployeeDao.getEmployeeList(userVo);
		
		return list;
	}
	
	public List<MessageVO> getMessage(MessageVO messageVo) {
	List<MessageVO> list = messageDao.getMessage(messageVo);
	
	return list;
}
	
}
