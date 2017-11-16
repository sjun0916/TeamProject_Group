package com.group.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.service.CalendarService;

public class CalendarController {
	private CalendarService calendarService;
	
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	@RequestMapping(value="/calendar")
	public String list(Model model) {
		model.addAttribute("calendarList",calendarService.monthView(request, response, year, month));
		return "content_calendar/calendarMonth";
	}
}
