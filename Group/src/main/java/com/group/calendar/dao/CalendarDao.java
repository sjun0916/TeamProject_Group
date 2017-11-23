package com.group.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import com.group.calendar.vo.CalendarVO;
import com.group.user.vo.UserVO;


public interface CalendarDao {
	// select : all schedule
	public abstract List<CalendarVO> viewList() throws SQLException;
	// select : selected schedule
	public abstract CalendarVO viewSelected(CalendarVO cal) throws SQLException;
	// select : kind schedule
	public abstract List<CalendarVO> kindList(int[] num, UserVO user) throws SQLException;
	// select : day
	public abstract List<CalendarVO> dayList(String day) throws SQLException;
	// insert : schedule
	public abstract int insert(CalendarVO cal) throws SQLException;
	// delete : schedule
	public abstract int delete(CalendarVO cal) throws SQLException;
	// update : schedule
	public abstract int update(CalendarVO cal) throws SQLException;
	//monthCalendar
	public String getLunar(String sDate); 
	public String zeroNumber(int num);
}