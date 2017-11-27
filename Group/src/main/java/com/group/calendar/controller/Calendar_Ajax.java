package com.group.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.calendar.service.Calendar_Service;
import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

@Controller
public class Calendar_Ajax {
	@Resource(name = "calendar_Service")
	Calendar_Service service;

	@RequestMapping(value = "/calendar/data")
	public @ResponseBody List<Map<String, String>> calendar(HttpServletRequest request) {
		List<Map<String, String>> list = new ArrayList<>();
		HttpSession session = request.getSession();
		int id = 0;
		try {
			UserVO user= (UserVO) session.getAttribute("authUser");
			id = user.getEmployeeNo();
			System.out.println("calendar_ajax user : "+user); 	//confirm
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("calendar_ajax id : "+id);		//confirm
		List<Calendar_Vo> listVo = service.selectCalenderAll(id);
		System.out.println("calendar_ajax listVo length : "+listVo.size()); //confirm
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = null;
		String endDate = null;
		for (Calendar_Vo vo : listVo) {
			Map<String, String> map = new HashMap<>();
			startDate = dateFormat.format(vo.getCalendar_start());
			endDate = dateFormat.format(vo.getCalendar_end());
			map.put("title",vo.getCalendar_title());
			map.put("start",startDate);
			map.put("end", endDate);
			map.put("backgroundColor",vo.getCalendar_color());
			map.put("borderColor",vo.getCalendar_color());
			map.put("allDay", "false");
			map.put("description",Integer.toString(vo.getCalendar_no()));
			list.add(map);
		}
		return list;
	}
}
