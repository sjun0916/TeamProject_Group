package com.group.home.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.calendar.controller.Calendar_Main;
import com.group.calendar.vo.Calendar_Vo;

@Controller
public class CalendarCtl {
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
		Calendar_Main main = new Calendar_Main();
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
		
		Map<String, Object> tmpMap = main.select(request, date);
		List<Calendar_Vo> tmpList =(List<Calendar_Vo>) tmpMap.get("data");
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
