package com.group.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dao.UserDao;
import com.group.service.CalendarService;
import com.group.vo.CalendarVO;
import com.group.vo.UserVO;


@Controller
public class CalendarController {
	@Resource(name = "calendarService")
	CalendarService service;
	@RequestMapping(value = "/calendar/main")
	public String calendar(HttpServletRequest request) {
		return "content_calendar/calendarMonth";
	}
	@RequestMapping(value = "/calendar/main",method=RequestMethod.POST)
	public String savecalendar(HttpServletRequest request,
			String calendar_memberId, int calendar_kind,
			String calendar_start, String calendar_end,
			String calendar_title, String calendar_content){ 
		
		CalendarVO vo = new CalendarVO();
		UserDao userDao = new UserDao();
		UserVO user = null;
		String employee_no=null;
		if(calendar_kind!=0){
			vo.setKind(calendar_kind);
		}
		if(calendar_start!=null){
			vo.setStartDate(calendar_start);
		}
		if(calendar_end!=null){
			vo.setEndDate(calendar_end);
		}
		if(calendar_title!=null){
			vo.setTitle(calendar_title);
		}
		if(calendar_content!=null){
			vo.setContent(calendar_content);
		}
		try {
			//kind 별 schedule 추가
			employee_no= (String) SessionUtil.getAttribute("id");
			userDao.get(employee_no);
			vo.setEmployee_no(employee_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insert(vo);
		int[] num = (int[]) request.getAttribute("calendar_kind");
		
		request.setAttribute("calendarList",service.kindList(num, user));
		return "content_calendar/calendarMonth";
	}
	@RequestMapping(value = "/calendar/update",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> modify
		 (int calendar_id, String employee_no, int calendar_kind,
				 String calendar_start,String calendar_end,
				 String calendar_title,String calendar_content) {
		CalendarVO vo = new CalendarVO();
		vo.setCalNum(calendar_id);
		vo.setEmployee_no(employee_no);
		vo.setKind(calendar_kind);
		vo.setStartDate(calendar_start);
		vo.setEndDate(calendar_end);
		vo.setTitle(calendar_title);
		vo.setContent(calendar_content);
		
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.update(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calendar/delete",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> remove(int calendar_id) {
		///int calendar_no,Date calendar_start,Date calendar_end,String calendar_title,String calendar_cont,String calendar_remark,String calendar_color
		CalendarVO vo = new CalendarVO();
		vo.setCalNum(calendar_id);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.delete(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/select",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(CalendarVO vo) {
		System.out.println(vo.getCalNum());
		CalendarVO selectVo = service.viewSelected(vo);
		Map<String, Object> jsonObject = new HashMap<String, Object>();

		if(selectVo!=null){
			jsonObject.put("state", "success");
		}else{
			jsonObject.put("state", "fail");
		}
		try {
			if(selectVo.getEmployee_no().equals((String)SessionUtil.getAttribute("id")))
				jsonObject.put("admin", "true");
			
			jsonObject.put("select", selectVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/daylist",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(String date) {
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		
		CalendarVO vo =new CalendarVO();
		try {
			vo.setStartDate(date);
			vo.setEmployee_no((String)SessionUtil.getAttribute("id"));
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<CalendarVO>list = service.viewDay(vo);
		jsonObject.put("data", list);
		return jsonObject;
	}
}