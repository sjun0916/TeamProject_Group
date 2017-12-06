package com.group.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group.user.auth.Auth;
import com.group.user.common.JSONResult;
import com.group.user.service.FileUploadService;
import com.group.user.service.UserService;
import com.group.user.vo.UserVO;


@Controller
@RequestMapping( "/user" )
public class UserController {
	

	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private UserService userService;
	
	// 회원가입 페이지 매핑
	@RequestMapping( value="/join", method=RequestMethod.GET )
	public String join() {
		return "user/join";
	}

	/*
	 * 회원가입
	 * 프로필사진을 파일업로드
	 * 사용자의 정보입력
	 * 
	 * 가입승인대기 상태
	 */
	@RequestMapping( value="/join", method=RequestMethod.POST )
	public String join( @ModelAttribute UserVO userVo,
			@RequestParam( "file" ) MultipartFile file, HttpServletRequest request) {
		fileUploadService.setSavePath(
				request.getServletContext().getRealPath("/profileImg"));
		userVo.setImageUrl(fileUploadService.restore(file));
		userService.join(userVo);
		
		return "redirect:/user/joinsuccess";
	}
	
	// 로그인 페이지 매핑
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	// 접근권한이 없을 경우 해당 페이지 출력
	@RequestMapping( "/wrongaccess" )
	public String wrongAccess() {
		return "user/wrongaccess";
	}
	
	// 승인이 되지 않았을 경우 해당 페이지 출력
	@RequestMapping( "/notapproval" )
	public String notApproval() {
		return "user/notapproval";
	}
	
	// 가입요청후 해당 페이지 출력
	@RequestMapping( "/joinsuccess" )
	public String joinSuccess() {
		return "user/joinsuccess";
	}
	
	// 로그인한 계정이 관리자일 경우 관리자 페이지 출력
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping( "/admin" )
	public String adminPage() {
		return "user/admin";
	}
	
	// 가입 승인되지 않은 사원목록을 출력
	@ResponseBody
	@RequestMapping( value="/searchnotapproved", method=RequestMethod.POST )
	public JSONResult view(@ModelAttribute UserVO userVo) {
		List<UserVO> list = userService.getNotApproved();
		return JSONResult.success(list);
	}
	
	// 가입 승인이 된 사원목록 출력
	@ResponseBody
	@RequestMapping( value="/approve", method=RequestMethod.POST )
	public JSONResult approveJoin(@ModelAttribute UserVO userVo) {
		int count = userService.approveJoin(userVo);
		return JSONResult.success(count);
	}
}
