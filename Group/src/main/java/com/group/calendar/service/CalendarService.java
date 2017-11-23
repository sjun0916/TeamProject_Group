package com.group.calendar.service;

import java.sql.SQLException;
import java.util.List;

import com.group.calendar.vo.CalendarVO;
import com.group.user.vo.UserVO;


public interface CalendarService {
	
	// select : all schedule
	public abstract List<CalendarVO> viewList();
	// select : selected schedule
	public abstract CalendarVO viewSelected(CalendarVO cal);
	// select : selected day
	public abstract List<CalendarVO> viewDay(CalendarVO cal);
	//select : list of kind
	public List<CalendarVO> kindList(int[] num, UserVO user);
	// insert : schedule
	public abstract int insert(CalendarVO cal);
	// delete : schedule
	public abstract int delete(CalendarVO cal) throws SQLException;
	// update : schedule
	public abstract int update(CalendarVO cal) throws SQLException;
	
	//Holiday
	public String isLunar(String sDate) throws Exception;
	public String isSun(String sDate) throws Exception;
	
	// 03. 오늘 날짜로 전환
	
	
}