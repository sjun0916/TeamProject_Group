package com.group.mail.dao;

//import java.sql.SQLException;
//import java.util.List;
//import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.mail.vo.MailVo;
//import com.group.user.vo.UserVO;

@Repository
public class MailDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	public List<UserVO> listAll() throws SQLException {
//		// TODO Auto-generated method stub
//		return client.selectList("searchEmployee.getEmployeeList");
//	}
//	
//	public String getEmail(String employeeEmail) throws SQLException {
//		return client.selectOne("mail.getEmail", employeeEmail);
//	}
//	
//	public List<String> getEmails(Map<String, Object> array) throws SQLException {
//		return client.selectList("mail.getEmails", array);
//	}
	
//	public int insert( MailVo mailvo ) {
//		int count = sqlSession.insert("mail.insert", mailvo);
//		return count;
//	}
}
