package com.group.dao;

import java.util.List;

import com.group.vo.CalendarVO;

public interface CalendarDao {
	// select : all schedule
	public abstract List<CalendarVO> viewList();
	// select : selected schedule
	public abstract List<CalendarVO> viewSelected(CalendarVO cal);
	// select : kind schedule
	public List<CalendarVO> kindList(int num, List<CalendarVO> listTemp);
	// insert : schedule
	public abstract void insert(CalendarVO cal);
	// delete : schedule
	public abstract void delete(CalendarVO cal);
	// update : schedule
	public abstract void update(CalendarVO cal);
}
