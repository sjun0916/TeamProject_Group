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
	
	// 사원목록 출력
	public List<UserVO> getEmployeeList(UserVO userVo) {
		List<UserVO> list = searchEmployeeDao.getEmployeeList(userVo);
		return list;
	}
	
	// 리스트에서 쪽지 보내기위해 받아오는 messagevo 
	public List<MessageVO> getMessage(MessageVO messageVo) {
	List<MessageVO> list = messageDao.getMessage(messageVo);
	return list;
	}
}
