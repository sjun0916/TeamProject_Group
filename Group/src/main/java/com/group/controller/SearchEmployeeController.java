package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.auth.Auth;
import com.group.common.JSONResult;
import com.group.service.SearchEmployeeService;
import com.group.vo.UserVO;

@Auth
@Controller
@RequestMapping( "/searchemployee" )
public class SearchEmployeeController {
	
	@Autowired
	private SearchEmployeeService searchEmployeeService;
	
	
	@RequestMapping( "")
	public String mypage() {
		return "searchemployee/index";
	}
	
	@ResponseBody
	@RequestMapping( value="", method=RequestMethod.POST )
	public JSONResult view(@ModelAttribute UserVO userVo) {
		
		List<UserVO> list = searchEmployeeService.getEmployeeList(userVo);
		
		return JSONResult.success(list);
	}
}