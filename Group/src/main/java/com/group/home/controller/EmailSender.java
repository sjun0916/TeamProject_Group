package com.group.home.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

/*
 * 메일 발송 기능을 위한 Sender 작성
 * Java Mail API의 MimeMessage를 이용해서 메일을 발송
 */
public class EmailSender {
	
	 @Autowired
     private JavaMailSender  mailSender;
	 
     public void SendEmail(Email email) throws Exception {
          
         MimeMessage msg = mailSender.createMimeMessage();
         try {
             msg.setSubject(email.getSubject());
             msg.setText(email.getContent());
             msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            
         }catch(MessagingException e) {
             System.out.println("MessagingException");
             e.printStackTrace();
         }
         try {
             mailSender.send(msg);
         }catch(MailException e) {
             System.out.println("MailException발생");
             e.printStackTrace();
         }
     }
}
