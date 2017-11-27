package com.group.calendar.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.calendar.dao.Calendar_Dao;
import com.group.calendar.vo.Calendar_Vo;

@Service("calendar_Service")
public class Calendar_ServiceImpl implements Calendar_Service {
	
	@Resource(name = "calendar_Dao")
	Calendar_Dao dao;
	@Override
	public int insertCalender(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.insertCalender(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Calendar_Vo selectCalender(Calendar_Vo vo) {
		// TODO Auto-generated method stub
		Calendar_Vo selectvo = null ;
		try {
			selectvo =dao.selectCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectvo;
	}

	@Override
	public int deleteCalender(Calendar_Vo vo) throws SQLException{
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.deleteCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateCalender(Calendar_Vo vo) throws SQLException {
	// TODO Auto-generated method stub
	
		return dao.updateCalender(vo);
	}

	@Override
	public List<Calendar_Vo> selectCalenderAll(int id) {
		// TODO Auto-generated method stub
		List<Calendar_Vo> list=null;
		try {
			list =dao.selectCalenderAll(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Calendar_Vo> dayCalendarList(Calendar_Vo vo) {
		// TODO Auto-generated method stub
		List<Calendar_Vo> list=null;
		try {
			list=dao.dayCalendarList(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
