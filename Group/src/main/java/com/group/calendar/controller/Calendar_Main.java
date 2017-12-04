package com.group.calendar.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
		service.insertCalendar(map);
		request.setAttribute("calendarList",service.selectCalendarKind(user));
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
			service.updateCalendar(vo);
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
			service.deleteCalendar(vo);
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
		System.out.println("1"+vo.getCalendar_no());
		System.out.println("2"+vo.getCalendar_regid());
		System.out.println("3"+vo.getCalendar_cont());
		System.out.println("4"+vo.getCalendar_color());
		System.out.println("5"+vo.getCalendar_remark());
		System.out.println("6"+vo.getCalendar_kind());
		System.out.println("7"+vo.getCalendar_team());
		System.out.println("8"+vo.getCalendar_title());
		System.out.println("9"+vo.getCalendar_end());
		System.out.println("10"+vo.getCalendar_regdate());
		System.out.println("11"+vo.getCalendar_start());
		System.out.println("CalendarMain vo : "+vo);
		System.out.println("main vo_num"+vo.getCalendar_no());
		Calendar_Vo selectVo = service.selectCalendar(vo);
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
	public @ResponseBody List<Calendar_Vo> select(HttpServletRequest request, Date date) {
		System.out.println("main : selectDay");
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
		List<Calendar_Vo> tmpList = new ArrayList<Calendar_Vo>();
		HttpSession session = request.getSession();	
		try {
			UserVO user = (UserVO) session.getAttribute("authUser");
			System.out.println("User : "+user);	//confrim
			System.out.println("Date : "+date);	//confirm
			
			List<Calendar_Vo> list = service.selectCalendarKind(user);
			System.out.println("list empty? :"+list.isEmpty());
			System.out.println("list size : "+list.size()); 	//confirm
			if(!list.isEmpty()) {
				Iterator<Calendar_Vo> it = list.iterator();
				while(it.hasNext()) {
					Calendar_Vo temp = it.next();
					if(temp.getCalendar_start().compareTo(date)<=0)
						if(temp.getCalendar_end().compareTo(date)>=0)
							tmpList.add(temp);
				}
			}
			System.out.println("list size : "+tmpList.size()); 	//confirm
			
//			jsonObject.put("data", list);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		return jsonObject;
		request.setAttribute("dayList", tmpList);
		return tmpList;
	}
}
