package com.group.vo;

import java.util.Calendar;

public class monthVO {
	private int year;
	private int month;
	private int day;
	private int startDay;
	private int endDay;
	private int week;
	
	Calendar cal = Calendar.getInstance();
	
	public monthVO() {
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH);
		otherSet();
	}
	public monthVO(String year, String month) {
		this.year = Integer.parseInt(year);
		this.month = Integer.parseInt(month);
		otherSet();
	}
	private void otherSet() {
		startDay = 1;
		day = cal.get(Calendar.DAY_OF_MONTH);
		cal.set(year, month-1, day);
		
		endDay = cal.getMaximum(Calendar.DAY_OF_MONTH);
		week = cal.get(Calendar.DAY_OF_WEEK);	
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getStartDay() {
		return startDay;
	}
	public void setStartDay(int startDay) {
		this.startDay = startDay;
	}
	public int getEndDay() {
		return endDay;
	}
	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public Calendar getCal() {
		return cal;
	}
	public void setCal(Calendar cal) {
		this.cal = cal;
	}
}
