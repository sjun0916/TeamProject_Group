package com.group.user.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.user.common.JSONResult;
import com.group.user.service.UserService;
import com.group.user.vo.UserVO;


@RequestMapping( "/api/user" )
@Controller("userAPIController")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/*
	 * 팀목록을 받아온다
	 * JSON에 객체로 저장
	 */
	@ResponseBody
	@RequestMapping( "/getTeamList" )
	public JSONResult getTeamList() {
		List<UserVO> teamList = 
				userService.getTeamList(  );
		return JSONResult.success( teamList );
	}
	
	/*
	 * 직급목록을 받아온다
	 * JSON에 객체로 저장
	 */
	@ResponseBody
	@RequestMapping( "/getPositionList" )
	public JSONResult getPositionList() {
		List<UserVO> getPositionList = 
				userService.getPositionList(  );
		return JSONResult.success( getPositionList );
	}
	
}
