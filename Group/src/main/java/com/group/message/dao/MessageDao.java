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
	
	// 쪽지 상세보기
	public MessageVO getDetailMessage(MessageVO messageVo ) {
		return sqlSession.selectOne("message.getDetailMessage", messageVo);
		
	}
	
	// 쪽지 보내기
	public int sendMessage(MessageVO messageVo ) {
		int count = sqlSession.insert("message.sendMessage", messageVo);
		return count;
	}
	
	// 답장
	public int answerMessage(MessageVO messageVo ) {
		int count = sqlSession.insert("message.answerMessage", messageVo);
		return count;
	}
	
	// 삭제
	public int deleteMessage(MessageVO messageVo ) {
		int count = sqlSession.delete("message.deleteMessage", messageVo);
		return count;
	}
	
	// 쪽지 리스트
	public List<MessageVO> getMessage(MessageVO messageVo) {
		return sqlSession.selectList("message.getMessage", messageVo);
	}
	
	/*
	 * 메인 뷰
	 * 쪽지 리스트
	 */
	public List<MessageVO> getMessage2(MessageVO messageVo) {
		return sqlSession.selectList("message.getMessage2", messageVo);
	}
}