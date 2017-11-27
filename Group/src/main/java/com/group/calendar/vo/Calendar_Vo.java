package com.group.calendar.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Calendar_Vo {
	int calendar_no;
	String calendar_regid;
	Date calendar_regdate;
	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	Date calendar_start;
	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	Date calendar_end;
	String calendar_title;
	String calendar_cont;
	String calendar_remark;
	String calendar_color;
	
	public Calendar_Vo(){
		
	}
	public Calendar_Vo(Date calendar_start, Date calendar_end, String calendar_title, String calendar_cont,
			String calendar_remark, String calendar_color) {
		super();
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_title = calendar_title;
		this.calendar_cont = calendar_cont;
		this.calendar_remark = calendar_remark;
		this.calendar_color = calendar_color;
	}
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public String getCalendar_regid() {
		return calendar_regid;
	}
	public void setCalendar_regid(String calendar_regid) {
		this.calendar_regid = calendar_regid;
	}
	public Date getCalendar_regdate() {
		return calendar_regdate;
	}
	public void setCalendar_regdate(Date calendar_regdate) {
		this.calendar_regdate = calendar_regdate;
	}
	public Date getCalendar_start() {
		return calendar_start;
	}
	public void setCalendar_start(Date calendar_start) {
		this.calendar_start = calendar_start;
	}
	public Date getCalendar_end() {
		return calendar_end;
	}
	public void setCalendar_end(Date calendar_end) {
		this.calendar_end = calendar_end;
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendar_cont() {
		return calendar_cont;
	}
	public void setCalendar_cont(String calendar_cont) {
		this.calendar_cont = calendar_cont;
	}
	public String getCalendar_remark() {
		return calendar_remark;
	}
	public void setCalendar_remark(String calendar_remark) {
		this.calendar_remark = calendar_remark;
	}
	public String getCalendar_color() {
		return calendar_color;
	}
	public void setCalendar_color(String calendar_color) {
		this.calendar_color = calendar_color;
	}
	
	
}
