package com.group.dao;

import java.sql.SQLException;
import java.util.List;

import com.group.vo.CalendarVO;
import com.group.vo.UserVO;


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
	public String zeroNumber(int num);
	public String getLunar(String sDate); 
	public String isLunar(String sDate) throws Exception;
	public String isSun(String sDate) throws Exception;
}
