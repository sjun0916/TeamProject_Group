package com.group.home.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.group.user.service.UserService;

@Controller
public class EmailController {
 
//  @Autowired
//  private JavaMailSender mailSender;
 
  // mailForm
  @RequestMapping(value = "/search/searchpassword")
  public String mailForm() {
   
    return "searchpassword";
  }  
 
  // mailSending 코드
//  @RequestMapping(value = "/mail/mailSending")
//  public String mailSending(HttpServletRequest request) {
//   
//    String setfrom = "sjun0916@gmail.com";     
//    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
//    String title   = request.getParameter("title");      // 제목
//    String content = request.getParameter("content");    // 내용
//   
//    try {
//      MimeMessage message = mailSender.createMimeMessage();
//      MimeMessageHelper messageHelper 
//                        = new MimeMessageHelper(message, true, "UTF-8");
// 
//      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
//      messageHelper.setTo(tomail);     // 받는사람 이메일
//      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//      messageHelper.setText(content);  // 메일 내용
//     
//      mailSender.send(message);
//    } catch(Exception e){
//      System.out.println(e);
//    }
//   
//    return "redirect:/mail/mailForm";
//  }
//  
  
  
  @Autowired
  private EmailSender emailSender;
  
  @Autowired
  UserService userService;
  
  @Autowired
  private Email email;
  
   @RequestMapping(value = "/mail/mailSending")
   public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
       ModelAndView mav;
       String name= (String) paramMap.get("employeeName");
       String e_mail=(String) paramMap.get("email");
       System.out.println(name);
       System.out.println(e_mail);
       String password=userService.getPw(paramMap);
       System.out.println(password);
       if(password!=null) {
           email.setContent("비밀번호는 "+password+" 입니다.");
           email.setReceiver(e_mail);
           email.setSubject(name+"님 비밀번호 찾기 메일입니다.");           
           emailSender.SendEmail(email);
           mav= new ModelAndView("redirect:/");
           return mav;
       }else {
           mav=new ModelAndView("redirect:/");
           return mav;
       }
   }
} 