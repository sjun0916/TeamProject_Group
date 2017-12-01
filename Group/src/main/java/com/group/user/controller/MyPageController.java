package com.group.user.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.group.user.auth.Auth;
import com.group.user.service.FileUploadService;
import com.group.user.service.MyPageService;
import com.group.user.vo.UserVO;

@Auth
@Controller
@RequestMapping( "/mypage" )
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping( "")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping( value="/modify", method=RequestMethod.POST )
	public String modify( @ModelAttribute UserVO userVo,
			@RequestParam( "file" ) MultipartFile file, HttpServletRequest request) {
		fileUploadService.setSavePath(
				request.getServletContext().getRealPath("/profileImg"));
		
		userVo.setImageUrl(fileUploadService.restore(file));
		myPageService.modify(userVo);
		
		return "redirect:/";
	}
}