package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group.auth.Auth;
import com.group.common.JSONResult;
import com.group.service.FileUploadService;
import com.group.service.UserService;
import com.group.vo.UserVO;


@Controller
@RequestMapping( "/user" )
public class UserController {
	

	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private UserService userService;
	

	
	@RequestMapping( value="/join", method=RequestMethod.GET )
	public String join() {
		return "user/join";
	}

	@RequestMapping( value="/join", method=RequestMethod.POST )
	public String join( @ModelAttribute UserVO userVo,
			@RequestParam( "file" ) MultipartFile file) {
		
		userVo.setImageUrl(fileUploadService.restore(file));
		userService.join(userVo);
		
		return "redirect:/user/joinsuccess";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	
	@RequestMapping( "/wrongaccess" )
	public String wrongAccess() {
		return "user/wrongaccess";
	}
	
	@RequestMapping( "/notapproval" )
	public String notApproval() {
		return "user/notapproval";
	}
	
	@RequestMapping( "/joinsuccess" )
	public String joinSuccess() {
		return "user/joinsuccess";
	}
	
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping( "/admin" )
	public String adminPage() {
		return "user/admin";
	}
	
	@ResponseBody
	@RequestMapping( value="/searchnotapproved", method=RequestMethod.POST )
	public JSONResult view(@ModelAttribute UserVO userVo) {
		List<UserVO> list = userService.getNotApproved();
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping( value="/approve", method=RequestMethod.POST )
	public JSONResult approveJoin(@ModelAttribute UserVO userVo) {
		int count = userService.approveJoin(userVo);
		return JSONResult.success(count);
	}
}
