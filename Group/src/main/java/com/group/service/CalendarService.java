package com.group.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group.vo.CalendarVO;

public interface CalendarService {
	
	// select : all schedule
	public abstract List<CalendarVO> viewList();
	// select : selected schedule
	public abstract List<CalendarVO> viewSelected(CalendarVO cal);
	//select : list of kind
	public List<CalendarVO> kindList(int num);
	// insert : schedule
	public abstract void insert(CalendarVO cal);
	// delete : schedule
	public abstract void delete(CalendarVO cal);
	// update : schedule
	public abstract void update(CalendarVO cal);
		
	
	// 01. 달력표시
	public abstract boolean monthView(
			HttpServletRequest request, HttpServletResponse response, String year, String month);
	
	// 02. 공휴일 지정
	
	
	// 03. 오늘 날짜로 전환
	
	
}
