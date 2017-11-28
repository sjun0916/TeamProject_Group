package com.group.calendar.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.calendar.vo.Calendar_Vo;

@Repository(value = "calendar_Dao")
public class Calendar_DaoImpl implements Calendar_Dao {
	@Autowired
	SqlSessionTemplate client;

	@Override
	public int insertCalender(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("calendar.insert",map);
	}

	@Override
	public Calendar_Vo selectCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("calendarDao no : "+vo.getCalendar_no());
		Calendar_Vo tmp = client.selectOne("calendar.selectOne",vo.getCalendar_no());
		System.out.println("CalendarDao calendarVo : "+tmp);
		return client.selectOne("calendar.selectOne",vo.getCalendar_no());
	}

	@Override
	public int deleteCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("calendar.delete",vo);
	}

	@Override
	public int updateCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("calendar.update",vo);
	}
	@Override
	public List<Calendar_Vo> selectCalenderAll(int id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.selectList",id);
	}

	@Override
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.dayList",vo);
	}

}
