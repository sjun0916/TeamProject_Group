package com.group.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.service.CalendarService;
import com.group.vo.MonthVO;

public class CalendarController {
	private CalendarService calendarService;
	
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	@RequestMapping(value="/calendar")
	public String month(Model model, MonthVO monthVO) {
		model.addAttribute("monthInfo",calendarService.monthView());
		return "content_calendar/calendarMonth";
	}
}
