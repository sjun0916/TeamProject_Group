package com.group.mail.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.mail.dao.MailDao;
import com.group.user.vo.UserVO;

@Service
public class MailService {
	
	@Resource
	MailDao mailDao;
	
	public List<UserVO> listAll() {
		
		List<UserVO> list = null;
		try {
			list = mailDao.listAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}

	public String getEmail(String member_enum) {
	
		String email = "";

		try {
			email = mailDao.getEmail(member_enum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return email;
	}
	
	public List<String> getEmails(Map<String, Object> array) {
		
		List<String> emailList = null;
		
		try {
			emailList  =  mailDao.getEmails(array);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return emailList;
	}

}
