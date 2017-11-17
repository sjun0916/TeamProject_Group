package com.group.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.group.vo.CalendarVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class CalendarServiceImpl implements CalendarService{
	
	
	
	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> kindList(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(CalendarVO cal) {
		// TODO Auto-generated method stub
		
	}
	


}
