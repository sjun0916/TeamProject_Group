package com.group.calendar.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

public interface Calendar_Service {
	public int insertCalendar(Map<String, Object> map);
	public Calendar_Vo selectCalendar(Calendar_Vo vo);
	public int deleteCalendar(Calendar_Vo vo) throws SQLException;
	public int updateCalendar(Calendar_Vo vo) throws SQLException;
	public List<Calendar_Vo> selectCalendarAll(int id);
	public List<Calendar_Vo> selectCalendarKind(UserVO user);
	public List<Calendar_Vo> dayCalendarList(UserVO user, Date date);
}
