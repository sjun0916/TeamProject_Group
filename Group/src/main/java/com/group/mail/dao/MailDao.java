package com.group.mail.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.mail.vo.MailVo;

@Repository
public class MailDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<MailVo> getMail(MailVo mailVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mail.getEmail", mailVo);
	}
//	
//	public String getEmail(String employeeEmail) throws SQLException {
//		return client.selectOne("mail.getEmail", employeeEmail);
//	}
//	
//	public List<String> getEmails(Map<String, Object> array) throws SQLException {
//		return client.selectList("mail.getEmails", array);
//	}
	
	public int insert( MailVo mailVo ) {
		System.out.println("333333");
		int count = sqlSession.insert("mail.insert", mailVo);
		return count;
	}
}
