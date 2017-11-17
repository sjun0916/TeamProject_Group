package com.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.service.CalendarService;

@Controller
public class CalendarController {
	private CalendarService calendarService;
	
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	@RequestMapping(value="/calendar")
	public String month(Model model) {
		
		return "content_calendar/calendarMonth";
	}
}
