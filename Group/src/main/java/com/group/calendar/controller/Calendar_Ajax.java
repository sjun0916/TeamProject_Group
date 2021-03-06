package com.group.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

	/*----------------------------------------------------------------------------------
	 * 캘린더 메인 화면
	 * 회원의 모든 분류에 해당하는 일정 정보 가져오기
	 -----------------------------------------------------------------------------------*/
	@RequestMapping(value = "/calendar/data")
	public @ResponseBody List<Map<String, String>> calendar(HttpServletRequest request) {
		System.out.println("calendar_ajax start");
		List<Map<String, String>> list = new ArrayList<>();
		HttpSession session = request.getSession();
		int id = 0;
		UserVO user = null;
		try {
			user= (UserVO) session.getAttribute("authUser");
			id = user.getEmployeeNo();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String[] kind = request.getParameterValues("monthKind");
		System.out.println("kindList value : ");
		if(kind == null) {
			System.out.println("kind is null");
		}else {
			for(int i=0;i<kind.length;i++) {
				System.out.println(kind[i]);
			}
		}
		List<Calendar_Vo> listVo = service.selectCalendarKind(user);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = null;
		String endDate = null;
		if(!(listVo==null)){
			for (Calendar_Vo vo : listVo) {
				Map<String, String> map = new HashMap<>();
				startDate = dateFormat.format(vo.getCalendar_start());
				endDate = dateFormat.format(vo.getCalendar_end());
				map.put("title",vo.getCalendar_title());
				map.put("start",startDate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(vo.getCalendar_end());
				cal.add(Calendar.DATE, 1);
				endDate = dateFormat.format(cal.getTime());
				map.put("end", endDate);
				map.put("backgroundColor",vo.getCalendar_color());
				map.put("borderColor",vo.getCalendar_color());
				map.put("allDay", "false");
				map.put("no",Integer.toString(vo.getCalendar_no()));
				list.add(map);
			}
			System.out.println("ajax return list size : "+list.size());
			request.setAttribute("monthKind", kind);
			return list;
		}else
			return null;
	}
}
