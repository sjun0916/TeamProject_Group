package com.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.group.auth.Auth;
import com.group.service.FileUploadService;
import com.group.service.MyPageService;
import com.group.vo.UserVO;

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
		return "mypage/index";
	}
	
	@RequestMapping( value="/modify", method=RequestMethod.POST )
	public String modify( @ModelAttribute UserVO userVo,
			@RequestParam( "file" ) MultipartFile file) {
		
		userVo.setImageUrl(fileUploadService.restore(file));
		myPageService.modify(userVo);
		
		return "redirect:/mypage";
	}
}