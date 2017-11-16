package com.group.service;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.group.vo.CalendarVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class CalendarServiceImpl implements CalendarService{
	
	//month calendar view
	@Override
	public void monthView(
			HttpServletRequest request, HttpServletResponse response, String y, String m) {
		if(y != null && m != null) {
			
		}
		
		cal.set(year, month-1, 1);
		
		endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		week = cal.get(Calendar.DAY_OF_WEEK);
		startDay = 1;
		
		request.setAttribute("day", day);
		request.setAttribute("month", month);
		request.setAttribute("year", year);
		request.setAttribute("endDay", endDay);
		request.setAttribute("week", week);
		request.setAttribute("startDay", startDay);
		
		addr = "content_calendar/calendarMonth";
	}

	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> kindList(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}


}
