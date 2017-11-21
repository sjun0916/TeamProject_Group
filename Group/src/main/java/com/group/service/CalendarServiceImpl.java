package com.group.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.dao.CalendarDao;
import com.group.vo.CalendarVO;
import com.group.vo.UserVO;

@Service("calendarService") // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class CalendarServiceImpl implements CalendarService{
	//..
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		List<CalendarVO> tmp = null;
		try {
			tmp = calendarDao.viewList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}

	@Override
	public CalendarVO viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		CalendarVO temp = null;
		try {
			temp = calendarDao.viewSelected(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}
	
	@Override
	public List<CalendarVO> viewDay(CalendarVO cal) {
		// TODO Auto-generated method stub
		List<CalendarVO> tmp = null;
		try {
			tmp = calendarDao.dayList(cal.getStartDate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	@Override
	public List<CalendarVO> kindList(int[] num, UserVO user) {
		// TODO Auto-generated method stub
		List<CalendarVO> tmp = null;
		try {
			tmp = calendarDao.kindList(num, user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	

	@Override
	public int insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = calendarDao.insert(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int delete(CalendarVO cal) throws SQLException{
		int result = 0;
		// TODO Auto-generated method stub
		try {
			result = calendarDao.delete(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		int result =0;
		try {
			result = calendarDao.update(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
