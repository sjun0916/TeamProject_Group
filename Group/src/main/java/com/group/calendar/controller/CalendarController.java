package com.group.calendar.controller;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.calendar.service.CalendarService;
import com.group.calendar.vo.CalendarVO;
import com.group.user.dao.UserDao;
import com.group.user.vo.UserVO;


@Controller
public class CalendarController {
	@Resource(name = "calendarService")
	CalendarService service;
	
	
	public int nullIntconv(String inv)
	{   
		int conv=0;
			
		try{
			System.out.println("nullIntconv_inv : "+inv); //confirm
			conv=Integer.parseInt(inv);
		}
		catch(Exception e)
		{}
		return conv;
	}
	
	@RequestMapping(value = "/calendar/main")
	public String calendar(HttpServletRequest request, HttpServletResponse response) {
		//calendarMonth.jsp month view에 필요한 value -> request.setAttribute();
		
		response.setContentType("text/html;charset=UTF-8");
		
		int iYear=nullIntconv(request.getParameter("iYear"));
		int iMonth=nullIntconv(request.getParameter("iMonth"))-1;
		
		Calendar ca = new GregorianCalendar();
		
		//today
		int iTDay=ca.get(Calendar.DATE);
		int iTYear=ca.get(Calendar.YEAR);
		int iTMonth=ca.get(Calendar.MONTH);
		System.out.println("Today : "+iTYear+iTMonth+iTDay); //confirm
		if(iYear==0)
		{
			  iYear=iTYear;
			  iMonth=iTMonth;
		}

		GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

		int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("view info\n days : "+days+"\n WeekStartDay : "+weekStartDay); // confirm 
		
		cal = new GregorianCalendar (iYear, iMonth, days);
//		iMonth = iMonth+1;
		int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
		int cnt =1;
		String month = "";
		iMonth = iMonth+1;
		if(iMonth<10) {
			month+="0"+iMonth;
	    }else
	    	month+=iMonth;
		
		
		//날짜, 이벤트
		String date = "";
		HashMap<String, String> eventMap = new HashMap<String, String>();
	    String event = null;
		for(int day=1;day<=days;day++) {
			String sDay="";
			if(day<10)
				sDay +="0";
			sDay+=day;
			date = month+"-"+sDay;
			System.out.println("strDate : "+date);
			event = isHoliday(date);
			if(event!=null) {
		    	eventMap.put(Integer.toString(day), event);
		    }
		}
	    
        request.setAttribute("event", eventMap);
        request.setAttribute("weekStartDay", weekStartDay);
        request.setAttribute("iTotalweeks", iTotalweeks);
        request.setAttribute("days", days);
        request.setAttribute("iTYear", iTYear);
        request.setAttribute("iYear", iYear);
        request.setAttribute("iMonth", iMonth);
        Iterator<String> it = eventMap.keySet().iterator();
        while(it.hasNext()) {
        	System.out.println("Event : "+month+eventMap.get(it.next()));
        }
        System.out.println("end call calendar"); // confirm
        
		return "content_calendar/calendarMonth";
	}
	
	
	public String isHoliday(String date) {
		String tmp1 = null;
		String tmp2 = null;
		String result = null;
		try {
			tmp1 = service.isLunar(date);
			if(tmp1!=null)
				result = tmp1;
		
			tmp2 = service.isSun(date);
			if(tmp2!=null)
				result = tmp2;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping(value = "/calendar/save",method=RequestMethod.POST)
	public String savecalendar(HttpServletRequest request,
			String calendar_memberId, int calendar_kind,
			String calendar_start, String calendar_end,
			String calendar_title, String calendar_content){ 
		
		CalendarVO vo = new CalendarVO();
		UserDao userDao = new UserDao();
		UserVO user = null;
		int employee_no;
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
			employee_no= (int) SessionUtil.getAttribute("id");
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
		 (int calendar_id, int employee_no, int calendar_kind,
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
			if(selectVo.getEmployee_no() == ((int)SessionUtil.getAttribute("id")))
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
			vo.setEmployee_no((int)SessionUtil.getAttribute("id"));
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<CalendarVO>list = service.viewDay(vo);
		jsonObject.put("data", list);
		return jsonObject;
	}
	
}