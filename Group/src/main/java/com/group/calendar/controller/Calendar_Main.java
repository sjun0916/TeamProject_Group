package com.group.calendar.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.calendar.service.Calendar_Service;
import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

@Controller
public class Calendar_Main {
	@Resource(name = "calendar_Service")
	Calendar_Service service;
	@RequestMapping(value = "/calendar/main")
	public String calendar(HttpServletRequest request) {
		System.out.println("calendar");
		return "content_calendar/calendar";
	}
	@RequestMapping(value = "/calendar/main",method=RequestMethod.POST)
	public String savecalendar(HttpServletRequest request,
			String[] calendar_kind,
			Date[] calendar_start,	
			Date[] calendar_end,
			String[] calendar_title,
			String[] calendar_cont,	
			String[] calendar_remark){ 
		System.out.println("saveCalendar");
		List<Calendar_Vo> list =new ArrayList<Calendar_Vo>();
		int id = 0;
		UserVO user = null;
		System.out.println("calendarMain kind : "+calendar_kind);
		System.out.println("calendarMain kind.length : "+calendar_kind.length); //confirm
		for (int i=0;i<calendar_title.length;i++) {
			Calendar_Vo vo = new Calendar_Vo();
			String color = null;
			if(calendar_start.length!=0){
				vo.setCalendar_start(calendar_start[i]);
			}
			if(calendar_end.length!=0){
				vo.setCalendar_end(calendar_end[i]);
			}
			if(calendar_title.length!=0){
				vo.setCalendar_title(calendar_title[i]);
			}
			if(calendar_cont.length!=0){
				vo.setCalendar_cont(calendar_cont[i]);
			}
			if(calendar_remark.length!=0){
				vo.setCalendar_remark(calendar_remark[i]);
			}
			if(calendar_kind.length!=0){
				vo.setCalendar_kind(calendar_kind[i]);
				System.out.println("calendarMain kind : "+calendar_kind[i]); //confirm
			}
			vo.setCalendar_color(getKindColor(calendar_kind[i]));
			list.add(vo);
			
			HttpSession session = request.getSession();
			try {
				user = (UserVO) session.getAttribute("authUser");
				
				id = user.getEmployeeNo();
				System.out.println("Calendar_main id : "+id);	//confirm
				list.get(i).setCalendar_regid(id);
				list.get(i).setCalendar_team(user.getTeamName());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		service.insertCalender(map);
		request.setAttribute("calendarList",service.selectCalenderKind(user, calendar_kind));
		return "content_calendar/calendar";
	}
	public String getKindColor(String kind) {
		String color = null;
		
		switch(kind) {
		case "person" : color = "#2377ff";break;
		case "team" : color = "#efa110";break;
		case "compony" : color = "#259613";break;
		}
		return color;
	}
	@RequestMapping(value = "/calendar/update",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object>   modify
		 (int calendar_no,Date calendar_start,Date calendar_end,
		  String calendar_title,String calendar_cont,
		  String calendar_remark,String calendar_color, String calendar_kind) {
		System.out.println("main : modify");
		Calendar_Vo vo = new Calendar_Vo();
		vo.setCalendar_no(calendar_no);
		vo.setCalendar_start(calendar_start);
		vo.setCalendar_end(calendar_end);
		vo.setCalendar_cont(calendar_cont);
		vo.setCalendar_remark(calendar_remark);
		vo.setCalendar_kind(calendar_kind);
		vo.setCalendar_color(getKindColor(calendar_kind));
		
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.updateCalender(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calendar/delete",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object>   remove(int calendar_no) {
		System.out.println("main : remove");
		///int calendar_no,Date calendar_start,Date calendar_end,String calendar_title,String calendar_cont,String calendar_remark,String calendar_color
		Calendar_Vo vo = new Calendar_Vo();
		vo.setCalendar_no(calendar_no);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.deleteCalender(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/select",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(HttpServletRequest request,Calendar_Vo vo) {
		System.out.println("main : selectOne");
		System.out.println(vo.getCalendar_no());
		System.out.println("CalendarMain vo : "+vo);
		Calendar_Vo selectVo = service.selectCalender(vo);
		System.out.println("CalendarMain selectCalendar : "+selectVo);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		if(selectVo!=null){
			jsonObject.put("state", "success");
		}else{
			jsonObject.put("state", "fail");
		}
		try {
			UserVO user = (UserVO) session.getAttribute("authUser");
			System.out.println("CalendarMain user : "+user);
			if(selectVo.getCalendar_regid()!= user.getEmployeeNo())
				jsonObject.put("admin", "true");
			
			jsonObject.put("select", selectVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/daylist",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(HttpServletRequest request, String date) {
		System.out.println("main : selectDay");
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		String[] spDate = date.split(" ");
		spDate[0] =spDate[0].substring(0, 3);
		date =spDate[2]+"-"+spDate[0]+"-"+spDate[1];

		HttpSession session = request.getSession();
		SimpleDateFormat formet = new SimpleDateFormat("dd-MMM-yyyy",Locale.ENGLISH);
		Calendar_Vo vo =new Calendar_Vo();
		Date result =null;
		try {
			result = formet.parse(date);
			vo.setCalendar_regdate(result);
			UserVO user = (UserVO) session.getAttribute("authUser");
			vo.setCalendar_regid(user.getEmployeeNo());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Calendar_Vo>list = service.dayCalendarList(vo);
		jsonObject.put("data", list);
		return jsonObject;
	}
}
