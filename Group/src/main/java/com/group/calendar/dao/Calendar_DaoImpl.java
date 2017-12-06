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

	/*----------------------------------------------------------------------
	 * 일정 추가
	 * @see com.group.calendar.dao.Calendar_Dao#insertCalender(java.util.Map)
	 ----------------------------------------------------------------------*/
	@Override
	public int insertCalender(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("calendar.insert",map);
	}

	/*-------------------------------------------------------------------------------------
	 * 일정 번호로 일정 확인
	 * @see com.group.calendar.dao.Calendar_Dao#selectCalender(com.group.calendar.vo.Calendar_Vo)
	 ------------------------------------------------------------------------------------------*/
	@Override
	public Calendar_Vo selectCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("calendarDao no : "+vo.getCalendar_no());
		Calendar_Vo tmp = client.selectOne("calendar.selectOne",vo.getCalendar_no());
		System.out.println("CalendarDao calendarVo : "+tmp);
		return client.selectOne("calendar.selectOne",vo.getCalendar_no());
	}

	/*----------------------------------------------------------------------------------------
	 * 일정 삭제
	 * @see com.group.calendar.dao.Calendar_Dao#deleteCalender(com.group.calendar.vo.Calendar_Vo)
	 ------------------------------------------------------------------------------------------*/
	@Override
	public int deleteCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("calendar.delete",vo);
	}

	/*------------------------------------------------------------------------------------------
	 * 일정 수정
	 * @see com.group.calendar.dao.Calendar_Dao#updateCalender(com.group.calendar.vo.Calendar_Vo)
	 -------------------------------------------------------------------------------------------*/
	@Override
	public int updateCalender(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("calendar.update",vo);
	}
	/*----------------------------------------------------------------
	 * 로그인된 유저의 일정 확인
	 * @see com.group.calendar.dao.Calendar_Dao#selectCalenderAll(int)
	 -------------------------------------------------------------------*/
	@Override
	public List<Calendar_Vo> selectCalenderAll(int id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.selectList",id);
	}

	/*-----------------------------------------------------------------------------------------
	 * 날짜별 일정 확인
	 * @see com.group.calendar.dao.Calendar_Dao#dayCalendarList(com.group.calendar.vo.Calendar_Vo)
	 -------------------------------------------------------------------------------------------*/
	@Override
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.dayList",vo);
	}

	/*------------------------------------------------------------------
	 * 모든 일정 확인
	 * @see com.group.calendar.dao.Calendar_Dao#selectCalenderT()
	 ------------------------------------------------------------------*/
	@Override
	public List<Calendar_Vo> selectCalenderT() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.selectAll");
	}

}
