package com.group.calendar.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.group.calendar.vo.Calendar_Vo;

public interface Calendar_Dao {
	public int insertCalender(Map<String, Object> map) throws SQLException;
	public Calendar_Vo selectCalender(Calendar_Vo vo) throws SQLException;
	public List<Calendar_Vo> selectCalenderAll(int id) throws SQLException;
	public int deleteCalender(Calendar_Vo vo) throws SQLException;
	public int updateCalender(Calendar_Vo vo) throws SQLException;
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo) throws SQLException;
}
