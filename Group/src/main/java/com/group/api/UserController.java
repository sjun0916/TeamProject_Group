package com.group.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.common.JSONResult;
import com.group.service.UserService;
import com.group.vo.UserVO;


@RequestMapping( "/api/user" )
@Controller("userAPIController")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping( "/getTeamList" )
	public JSONResult getTeamList() {
		List<UserVO> teamList = 
				userService.getTeamList(  );
		return JSONResult.success( teamList );
	}
	
	@ResponseBody
	@RequestMapping( "/getPositionList" )
	public JSONResult getPositionList() {
		List<UserVO> getPositionList = 
				userService.getPositionList(  );
		return JSONResult.success( getPositionList );
	}
	
}
