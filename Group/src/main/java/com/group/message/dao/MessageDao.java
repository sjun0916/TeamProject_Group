package com.group.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.message.vo.MessageVO;

@Repository
public class MessageDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public MessageVO getDetailMessage(MessageVO messageVo ) {
		return sqlSession.selectOne("message.getDetailMessage", messageVo);
		
	}
	
	public int sendMessage(MessageVO messageVo ) {
		int count = sqlSession.insert("message.sendMessage", messageVo);
		return count;
	}
	public int answerMessage(MessageVO messageVo ) {
		int count = sqlSession.insert("message.answerMessage", messageVo);
		return count;
	}
	
	public int deleteMessage(MessageVO messageVo ) {
		int count = sqlSession.delete("message.deleteMessage", messageVo);
		return count;
	}
	
	public List<MessageVO> getMessage(MessageVO messageVo) {
		return sqlSession.selectList("message.getMessage", messageVo);
	}
}