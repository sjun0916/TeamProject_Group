package com.group.service;

import java.sql.SQLException;
import java.util.List;

import com.group.vo.CalendarVO;

public interface CalendarService {
	
	// select : all schedule
	public abstract List<CalendarVO> viewList();
	// select : selected schedule
	public abstract CalendarVO viewSelected(CalendarVO cal);
	// select : selected day
	public abstract List<CalendarVO> viewDay(CalendarVO cal);
	//select : list of kind
	public List<CalendarVO> kindList(int[] num, MemberVO member);
	// insert : schedule
	public abstract int insert(CalendarVO cal);
	// delete : schedule
	public abstract int delete(CalendarVO cal) throws SQLException;
	// update : schedule
	public abstract int update(CalendarVO cal) throws SQLException;
		
	
	
	
	// 02. 공휴일 지정
	
	
	// 03. 오늘 날짜로 전환
	
	
}
