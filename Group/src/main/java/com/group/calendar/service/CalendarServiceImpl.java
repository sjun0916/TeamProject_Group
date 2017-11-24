package com.group.calendar.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.calendar.dao.CalendarDao;
import com.group.calendar.vo.CalendarVO;
import com.group.user.vo.UserVO;

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
	/*
	 * input sunDate -> output lunarDate
	 * @param sDate 양력일자
	 * @return 행사이름
	 */
	@Override
	public String isLunar(String sDate) throws Exception{
		
		HashMap<String, String> lunar= new HashMap<String,String>();
		lunar.put("01-01", "설날");
		lunar.put("01-02", "설날");
		lunar.put("04-08", "부처님 오신 날");
		lunar.put("08-14", "추석");
		lunar.put("08-15", "추석");
		lunar.put("08-16", "추석");
		lunar.put("12-30", "설날");
		
		String lunarDate = null; //
		String confirm = null;
		String date = "";
		
		lunarDate = calendarDao.getLunar(sDate);
		confirm = lunarDate.substring(0,1);
		
		date += lunarDate.substring(5,7);
		date += "-";
		date += lunarDate.substring(7,lunarDate.length());
		
		if(confirm.equals("0"))
			return lunar.get(date);
		else
			return null;
	}
	@Override
	public String isSun(String sDate) throws Exception{
		String result = null;
		HashMap<String, String> sun = new HashMap<String, String>();
		sun.put("01-01", "새해");
		sun.put("03-01", "삼일절");
		sun.put("05-01", "근로자의 날");
		sun.put("05-05", "어린이날");
		sun.put("06-06", "현충일");
		sun.put("08-15", "광복절");
		sun.put("10-03", "개천절");
		sun.put("10-09", "한글날");
		sun.put("12-25", "크리스마스");
		
		int month = Integer.parseInt(sDate.substring(4,6))+1;
		int day = Integer.parseInt(sDate.substring(6,sDate.length()));
		
		String date = "";
		date += calendarDao.zeroNumber(month);
		date += "-";
		date += calendarDao.zeroNumber(day);
		
		result = sun.get(date);
		
		return result;
	}
	
}
