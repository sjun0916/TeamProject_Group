package com.group.calendar.dao;

import java.sql.SQLException;
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
		return client.selectOne("calendar.seletOne",vo);
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
	public List<Calendar_Vo> selectCalenderAll(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.seletList",id);
	}

	@Override
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.dayList",vo);
	}

}
