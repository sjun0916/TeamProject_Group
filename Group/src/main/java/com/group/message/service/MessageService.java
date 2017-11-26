package com.group.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.message.dao.MessageDao;
import com.group.message.vo.MessageVO;

@Service
public class MessageService {

	@Autowired
	private MessageDao messageDao;
	
	public MessageVO getDetailMessage(MessageVO messageVo) {
		return messageDao.getDetailMessage(messageVo);
		
	}
	public int sendMessage(MessageVO messageVo) {
		int result = messageDao.sendMessage(messageVo);
		
		return result;
	}
	
	public int answerMessage(MessageVO messageVo) {
		int result = messageDao.answerMessage(messageVo);
		
		return result;
	}
	
	public int deleteMessage(MessageVO messageVo) {
		int result = messageDao.deleteMessage(messageVo);
		return result;
	}
	
	
	public List<MessageVO> getMessage(MessageVO messageVo) {
		List<MessageVO> list = messageDao.getMessage(messageVo);
		return list;
	}
}