package com.group.mail.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.mail.dao.MailDao;
import com.group.mail.vo.MailVo;

@Service
public class MailService {
	
	@Resource
	MailDao mailDao;
	
	public List<MailVo> getMail(MailVo mailVo) {
		List<MailVo> list = mailDao.getMail(mailVo);
		return list;
	}
//
//	public String getEmail(String employeeEmail) {
//	
//		String email = "";
//
//		try {
//			email = mailDao.getEmail(employeeEmail);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	
//		return email;
//	}
//	
//	public List<String> getEmails(Map<String, Object> array) {
//		
//		List<String> emailList = null;
//		
//		try {
//			emailList  =  mailDao.getEmails(array);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return emailList;
//	}
	
	public int insert( MailVo mailvo ) {
		System.out.println("222222222222");
		int result = mailDao.insert( mailvo );
		System.out.println("444444444");
		return result;
	}
	
}
