package com.group.home.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.calendar.controller.Calendar_Main;
import com.group.calendar.service.Calendar_Service;
import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

@Controller
public class CalendarCtl {
	@Resource(name = "calendar_Service")
	Calendar_Service service;
	
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
	@RequestMapping(value = "/home/calendar")
	public String calendar(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("into /home/calendar");
		response.setContentType("text/html;charset=UTF-8");
		int iYear=nullIntconv(request.getParameter("iYear"));
		int iMonth=nullIntconv(request.getParameter("iMonth"))-1;
		int iDay = nullIntconv(request.getParameter("iDay"));
		
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
			  iDay = iTDay;
		}
		
		Date date = new Date(iYear-1900,iMonth,iDay);
		GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 
		
		int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("view info\n days : "+days+"\n WeekStartDay : "+weekStartDay); // confirm 
		
		cal = new GregorianCalendar (iYear, iMonth, days);
		int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
		
		List<Calendar_Vo> tmpList = new ArrayList<Calendar_Vo>();
		HttpSession session = request.getSession();	
		try {
			UserVO user = (UserVO) session.getAttribute("authUser");
			System.out.println("User : "+user);	//confrim
			System.out.println("Date : "+date);	//confirm
				
			List<Calendar_Vo> list = service.selectCalendarKind(user);
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
			System.out.println("dayList size : "+tmpList.size()); 	//confirm
			
//			jsonObject.put("data", list);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		return jsonObject;
		//comfirm
		Iterator<Calendar_Vo> it = tmpList.iterator();
		while(it.hasNext()) {
			Calendar_Vo temp = it.next();
			System.out.println(temp.getCalendar_title());
			System.out.println(temp.getCalendar_start());
		}
	    request.setAttribute("weekStartDay", weekStartDay);
	    request.setAttribute("iTotalweeks", iTotalweeks);
	    request.setAttribute("days", days);
	    request.setAttribute("iTYear", iTYear);
	    request.setAttribute("iYear", iYear);
	    request.setAttribute("iMonth", iMonth+1);
	    request.setAttribute("iDay", iDay);
	    request.setAttribute("calList", tmpList);
	    
		return "content_calendar/mainCalendar";
	}
}
