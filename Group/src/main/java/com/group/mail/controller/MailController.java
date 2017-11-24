package com.group.mail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.group.mail.dao.MailDao;
import com.group.mail.service.MailService;
import com.group.mail.vo.MailVo;
import com.group.user.vo.UserVO;


@Controller
public class MailController {
	
	@Resource
	MailDao dao;
	@Resource
	MailService service;
	
	/*** 메일 폼으로 이동 ***/
/*	@RequestMapping("/mail/mailForm") //받는사람없을때
	public String mailForm(@PathVariable String employee_No, Model model){
		
		String email = "";
		if(employee_No.equals("0")){ } 
		else {
			email = service.getEmail(employee_No);		// 멤버리스트서비스에서 이메일 받아옴
		}
		try {
//			model.addAttribute("sessionId", SessionUtil.getSessionId());
			model.addAttribute("getEmail", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "content_mail/mailForm";
	}*/
	
	
	@RequestMapping("/mail/mailForm/{email}")//받는사람있을때
	public String mailForm(@PathVariable String[] emails, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("email", emails);
		
		List<String> emailList = service.getEmails(map);
		
		String mail = "";
		for (String string : emailList) {					// 받는 사람 목록
			mail += string + ",";
		}
		mail = mail.substring(0, mail.lastIndexOf(","));
		try {
//			model.addAttribute("sessionId", SessionUtil.getSessionId());
			model.addAttribute("getEmail", mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "content_mail/mailForm";
	}
	
	
	/** 메일 보내기 */
	@RequestMapping(value="/mail/send", method=RequestMethod.POST)
	public String sendMail(@RequestParam("toInput") String toSomeone
						  ,@RequestParam("titleInput") String title
						  ,@RequestParam("mailContent") String content
						  ,@RequestParam("mailID") String mailID
						  ,@RequestParam("mailPW") String mailPW
						  , Model model){
		
		MailVo vo = new MailVo();
		
		vo.setMailID(mailID);
		vo.setMailPW(mailPW);
		
		SMTPAuthenticator smtp = new SMTPAuthenticator();
		System.out.println(vo.getMailID().toString());
		smtp.mailsend(vo);

		Properties p = new Properties();
		p.put("mail.smtp.user", vo.getMailID()); // Google계정@gmail.com ! 
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.transport.protocol","smtp" );
		// debug
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.fallback", "false");
		System.out.println(vo.getMailID().toString()+"1");
		try {
			Authenticator auth = smtp;
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
			System.out.println(vo.getMailID().toString()+"2");
			MimeMessage msg = new MimeMessage(session);
			String message = content;	// 보낼 내용
			msg.setSubject(title);		// 보낼 메일제목
			
			// 보내는사람 메일주소 
			Address fromAddr = new InternetAddress(vo.getMailID()); 
			msg.setFrom(fromAddr);
			System.out.println(vo.getMailID().toString()+"3");
			// 받는사람 메일주소
			String[] toList = toSomeone.trim().split(",");
			System.out.println(vo.getMailID().toString()+"4");
			for(int i=0; i<toList.length; i++){
				msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toList[i]));
				System.out.println(vo.getMailPW().toString()+"5");
			}
			System.out.println();
			msg.setContent(message, "text/html;charset=UTF-8");
			Transport.send(msg);
			System.out.println("Message: " + msg.getContent());
			System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
			
		} catch (Exception mex) { 
			System.out.println("로그인오류");
			System.out.println("이메일 에러났다2");
			mex.printStackTrace();
			
			model.addAttribute("result","fail");
			return "mail/result";
		}
		
		model.addAttribute("result","success");
		
		return "content_mail/result";
	}
	
	private class SMTPAuthenticator extends javax.mail.Authenticator {

		private MailVo vo = new MailVo();
		
		public SMTPAuthenticator(){
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			System.out.println("아이디 :: " + vo.getMailID()+ vo.getMailPW());
			
			return new PasswordAuthentication(vo.getMailID(),vo.getMailPW()); // Google
																
		}
		public PasswordAuthentication mailsend(MailVo vo){
			this.vo = vo;
			return this.getPasswordAuthentication();
			
		}
		
	}

	/** 받는 사람 검색 폼 */
	@RequestMapping("/mail/search")
	public String mailSearch(Model model) {
		
		List<UserVO> memList = service.listAll();
		model.addAttribute("member", memList);
		
		return "content_mail/mailToSearch";
	}

}
