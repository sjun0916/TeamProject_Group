package com.group.calendar.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("calendar_Vo")
public class Calendar_Vo {
	private int calendar_no;
	private int calendar_regid;
	private Date calendar_regdate;
	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	private Date calendar_start;
	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	private Date calendar_end;
	private String calendar_title;
	private String calendar_cont;
	private String calendar_remark;
	private String calendar_color;
	private String calendar_kind;
	private String calendar_team;
	
	public Calendar_Vo(){
		
	}
	public Calendar_Vo(Date calendar_start, Date calendar_end, String calendar_title, String calendar_cont,
			String calendar_remark, String calendar_color, String calendar_kind) {
		super();
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_title = calendar_title;
		this.calendar_cont = calendar_cont;
		this.calendar_remark = calendar_remark;
		this.calendar_color = calendar_color;
		this.calendar_kind = calendar_kind;
		System.out.println("Calendar_VO calendar_kind : "+this.calendar_kind); //confirm
	}
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public int getCalendar_regid() {
		return calendar_regid;
	}
	public void setCalendar_regid(int calendar_regid) {
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
	public String getCalendar_kind() {
		System.out.println("Calendar_VO calendar_kind : "+this.calendar_kind); //confirm
		return this.calendar_kind;
	}
	public void setCalendar_kind(String calendar_kind) {
		this.calendar_kind = calendar_kind;
		System.out.println("Calendar_VO calendar_kind : "+this.calendar_kind); //confirm
	}
	public String getCalendar_team() {
		return calendar_team;
	}
	public void setCalendar_team(String calendar_team) {
		this.calendar_team = calendar_team;
	}
	
	
	public int getCalendarNo() {
		return calendar_no;
	}
	public void setCalendarNo(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public int getCalendarRegid() {
		return calendar_regid;
	}
	public void setCalendarRegid(int calendar_regid) {
		this.calendar_regid = calendar_regid;
	}
	public Date getCalendarRegdate() {
		return calendar_regdate;
	}
	public void setCalendarRegdate(Date calendar_regdate) {
		this.calendar_regdate = calendar_regdate;
	}
	public Date getCalendarStart() {
		return calendar_start;
	}
	public void setCalendarStart(Date calendar_start) {
		this.calendar_start = calendar_start;
		
	}
	public Date getCalendarEnd() {
		return calendar_end;
	}
	public void setCalendarEnd(Date calendar_end) {
		this.calendar_end = calendar_end;
	}
	public String getCalendarTitle() {
		return calendar_title;
	}
	public void setCalendarTitle(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendarCont() {
		return calendar_cont;
	}
	public void setCalendarCont(String calendar_cont) {
		this.calendar_cont = calendar_cont;
	}
	public String getCalendarRemark() {
		return calendar_remark;
	}
	public void setCalendarRemark(String calendar_remark) {
		this.calendar_remark = calendar_remark;
	}
	public String getCalendarColor() {
		return calendar_color;
	}
	public void setCalendarColor(String calendar_color) {
		this.calendar_color = calendar_color;
	}
	public String getCalendarKind() {
		System.out.println("Calendar_VO calendar_kind : "+this.calendar_kind); //confirm
		return this.calendar_kind;
	}
	public void setCalendarKind(String calendar_kind) {
		this.calendar_kind = calendar_kind;
		System.out.println("Calendar_VO calendar_kind : "+this.calendar_kind); //confirm
	}
	public String getCalendarTeam() {
		return calendar_team;
	}
	public void setCalendarTeam(String calendar_team) {
		this.calendar_team = calendar_team;
	}
	
}
