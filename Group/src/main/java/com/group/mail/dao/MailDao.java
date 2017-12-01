package com.group.mail.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.mail.vo.MailVo;

@Repository
public class MailDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	받은메일함
	public List<MailVo> getMail(MailVo mailVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mail.getEmail", mailVo);
	}
	
//	보낸메일함
	public List<MailVo> getMail2(MailVo mailVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mail.getEmail2", mailVo);
	}
	
//	메일 DB입력
	public int insert( MailVo mailVo ) {
		System.out.println("333333");
		int count = sqlSession.insert("mail.insert", mailVo);
		return count;
	}
	
//	내용
	public MailVo getDetailMail(MailVo mailVo ) {
		return sqlSession.selectOne("mail.getDetailMail", mailVo);
		
	}
	
}
