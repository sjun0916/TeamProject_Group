package com.group.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.group.dao.CalendarDao;
import com.group.vo.CalendarVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class CalendarServiceImpl implements CalendarService{
	
	@Inject
	CalendarDao calendarDao;
	
	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		return calendarDao.viewList();
	}

	@Override
	public List<CalendarVO> viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		return calendarDao.viewSelected(cal);
	}

	@Override
	public List<CalendarVO> kindList(int num) {
		// TODO Auto-generated method stub
		List<CalendarVO> temp = null;
		return calendarDao.kindList(num, temp);
	}
	public List<CalendarVO> kindList(int num, int num2){
		List<CalendarVO> temp = kindList(num);
		return temp = calendarDao.kindList(num2, temp);		
	}

	@Override
	public void insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		calendarDao.insert(cal);
	}

	@Override
	public void delete(CalendarVO cal) {
		// TODO Auto-generated method stub
		calendarDao.delete(cal);
	}

	@Override
	public void update(CalendarVO cal) {
		// TODO Auto-generated method stub
		calendarDao.update(cal);
	}

}
