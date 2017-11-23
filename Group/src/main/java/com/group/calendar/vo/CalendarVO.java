package com.group.calendar.vo;

import org.apache.ibatis.type.Alias;

@Alias("calendarVO")
public class CalendarVO {
	private int calNum;	//seqence로 설정됨
	private int employee_no;
	private String startDate;
	private String endDate;
	private String title;
	private String content;
	private int kind;	//1-회사 2-부서 3-개인

	//생성자
	public CalendarVO() {}
	
	//getter() /setter()
	public int getCalNum() {
		return calNum;
	}
	public void setCalNum(int calNum) {
		this.calNum = calNum;
	}
	public int getEmployee_no() {
		return employee_no;
	}
	public void setEmployee_no(int employee_no) {
		this.employee_no = employee_no;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
}
