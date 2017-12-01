package com.group.mail.controller;

import java.util.List;
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
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.group.mail.dao.MailDao;
import com.group.mail.service.MailService;
import com.group.mail.vo.MailVo;
import com.group.message.vo.MessageVO;
import com.group.user.auth.AuthUser;
import com.group.user.common.JSONResult;
import com.group.user.vo.UserVO;


@Controller
@RequestMapping( "/mail" )
public class MailController {
	
	@Resource
	MailDao dao;
	@Resource
	MailService service;	
	
	@RequestMapping( "")
	public String email(@AuthUser UserVO authUser, 
											Model model) {
		MailVo mailVo= new MailVo();
		mailVo.setSenderMail(authUser.getEmail());
		
/*		int count = service.insert(mailVo);
		
		List<MailVo> list = 
				service.getMail( mailVo );
		
		model.addAttribute( "list", list );*/
		
		System.out.println("메일함 열기 성공");
		return "content_mail/mailForm";
	}
	
	//받은 메일함
	@RequestMapping("/receivelist")
	public String receivemail(@AuthUser UserVO authUser, Model model) {
		MailVo mailVo = new MailVo();
		mailVo.setSenderMail(authUser.getEmail());

		List<MailVo> list = service.getMail(mailVo);

		model.addAttribute("list", list);

		System.out.println("보낸메일함 성공");
		return "content_mail/receivelist";
	}
	
	//보낸 메일함
	@RequestMapping("/sendlist")
	public String sendmail(@AuthUser UserVO authUser, Model model) {
		MailVo mailVo = new MailVo();
		mailVo.setSenderMail(authUser.getEmail());

		List<MailVo> list = service.getMail2(mailVo);

		model.addAttribute("list", list);

		System.out.println("00000");
		return "content_mail/sendlist";
	}
	
	
	// mailForm
/*	@RequestMapping(value = "/mailsend")
	public JSONResult sendMailForm(@ModelAttribute MailVo mailVo) {
		System.out.println("11111111111");
		int count = service.insert(mailVo);
		
	    return JSONResult.success(count);
	  } */
	
	
	
	
	/** 메일 보내기 */
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String sendMail(
						  @RequestParam("receiverMail") String receiverMail
						  ,@RequestParam("title") String title
						  ,@RequestParam("content") String content
						  
						  ,@RequestParam("mailPW") String mailPW
						  , Model model
						  ,@AuthUser UserVO authUser){
		
		MailVo vo = new MailVo();
		
		vo.setMailID(authUser.getEmail());
		vo.setMailPW(mailPW);
		vo.setSenderMail(authUser.getEmail());
		vo.setReceiverMail(receiverMail);
		vo.setTitle(title);
		vo.setContent(content);		
		
		int count = service.insert(vo);
		JSONResult.success(count);
		
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
			String[] toList = receiverMail.trim().split(",");
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
			mex.printStackTrace();
			
			model.addAttribute("result","fail");
			return "content_mail/result";
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
	
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(@RequestParam(value = "mailNum", required = true) int mailNum,
			Model model) {
		
		MailVo mailVo = new MailVo();
		mailVo.setMailNum(mailNum);
		MailVo resVo = service.getDetailMail(mailVo);
		
		model.addAttribute("sender", resVo.getSenderMail());
		model.addAttribute("receiver", resVo.getReceiverMail());
		model.addAttribute("content", resVo.getContent());
		model.addAttribute("title", resVo.getTitle());
		
		return "content_mail/view";
	}

}
