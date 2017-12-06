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
	
	//쪽지 상세보기
	public MessageVO getDetailMessage(MessageVO messageVo) {
		return messageDao.getDetailMessage(messageVo);
		
	}
	
	//쪽지보내기
	public int sendMessage(MessageVO messageVo) {
		int result = messageDao.sendMessage(messageVo);
		
		return result;
	}
	
	//답장
	public int answerMessage(MessageVO messageVo) {
		int result = messageDao.answerMessage(messageVo);
		
		return result;
	}
	
	//삭제
	public int deleteMessage(MessageVO messageVo) {
		int result = messageDao.deleteMessage(messageVo);
		return result;
	}
	
	//쪽지리스트
	public List<MessageVO> getMessage(MessageVO messageVo) {
		List<MessageVO> list = messageDao.getMessage(messageVo);
		return list;
	}
	
	/*
	 * 메인 뷰
	 * 쪽지 리스트
	 */
	public List<MessageVO> getMessage2(MessageVO messageVo) {
		List<MessageVO> list = messageDao.getMessage2(messageVo);
		return list;
	}
}