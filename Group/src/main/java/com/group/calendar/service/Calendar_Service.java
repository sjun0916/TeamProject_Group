package com.group.calendar.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

public interface Calendar_Service {
	public int insertCalender(Map<String, Object> map);
	public Calendar_Vo selectCalender(Calendar_Vo vo);
	public int deleteCalender(Calendar_Vo vo) throws SQLException;
	public int updateCalender(Calendar_Vo vo) throws SQLException;
	public List<Calendar_Vo> selectCalenderAll(int id);
	public List<Calendar_Vo> selectCalenderKind(UserVO user, String[] kind);
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo);
}
