package com.group.home.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.group.user.service.UserService;

@Controller
public class EmailController {

 
  // 비밀번호 찾기 매핑
  @RequestMapping(value = "/search/searchpassword")
  public String mailForm() {
   
    return "searchpassword";
  }
  
  //사원번호 찾기 매핑
  @RequestMapping(value = "/search/searchemployeeno")
  public String mailForm2() {
  
	  return "searchemployeeno";
  }  

  
  @Autowired
  private EmailSender emailSender;
  
  @Autowired
  UserService userService;
  
  @Autowired
  private Email email;
  
  /*
   * 비밀번호 메일 전송위한 Action
   * 이름과 메일을 매칭시켜
   * 메일로 비밀번호 전송
   */
  @RequestMapping(value = "/mail/mailSendPw")
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
   
  /*
   * 비밀번호 메일 전송위한 Action
   * 이름과 메일을 매칭시켜
   * 메일로 사원번호 전송
   */
  @RequestMapping(value = "/mail/mailSendNo")
  public ModelAndView sendNoEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
      ModelAndView mav;
      String name= (String) paramMap.get("employeeName");
      String e_mail=(String) paramMap.get("email");
      System.out.println(name);
      System.out.println(e_mail);
      String no = userService.getNo(paramMap);
      System.out.println(no);
      if(no!=null) {
          email.setContent("사원번호는 "+no+" 입니다.");
          email.setReceiver(e_mail);
          email.setSubject(name+"님 사원번호 확인 메일입니다.");           
          emailSender.SendEmail(email);
          mav= new ModelAndView("redirect:/");
         return mav;
      }else {
          mav=new ModelAndView("redirect:/");
          return mav;
      }
  }
} 