package com.group.dao;

import java.util.List;

import com.group.vo.CalendarVO;

public interface CalendarDao {
	public abstract List<CalendarVO> viewList();
	public abstract List<CalendarVO> viewSelected(CalendarVO cal);
	public abstract void insert(CalendarVO cal);
	public abstract void delete(CalendarVO cal);
	public abstract void update(CalendarVO cal);
}
