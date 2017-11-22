package com.group.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dao.UserDao;
import com.group.service.CalendarService;
import com.group.vo.CalendarVO;
import com.group.vo.UserVO;


@Controller
public class CalendarAjax {
	@Resource(name = "calendarService")
	CalendarService service;

	@RequestMapping(value = "/calendar/data")
	public @ResponseBody List<Map<String, String>> calendar() {
		List<Map<String, String>> list = new ArrayList<>();

		int[] num = null;
		UserVO user = null;
		UserDao userDao = new UserDao();
		try {
			num = (int[])SessionUtil.getAttribute("kind");
			int employee_no = (int)SessionUtil.getAttribute("id");
			user = userDao.get(employee_no);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<CalendarVO> listVo = service.kindList(num, user);
		
		for (CalendarVO vo : listVo) {
			Map<String, String> map = new HashMap<>();
			
			map.put("title",vo.getTitle());
			map.put("start",vo.getStartDate());
			map.put("end", vo.getEndDate());
			map.put("kind",Integer.toString(vo.getKind()));
			map.put("content",vo.getContent());
			map.put("description",Integer.toString(vo.getCalNum()));
			list.add(map);
		}
		return list;
	}
}

