package com.group.approval.vo;

import org.apache.ibatis.type.Alias;

@Alias("ReportVO")
public class ReportVo {
	String report_no;		//시퀀스
	String reg_id;			//authUser 사원번호
	String reg_dep;
	String reg_manager1;
	String reg_manager2;
	String reg_manager3;
	String reg_manager4;
	String reg_manager5;
	String reg_title;
	String reg_cont;
	String reg_state;
	String reg_reason;
	String reg_register;		//SYSDATE
	String reg_update1;
	String reg_update2;
	String reg_update3;
	String reg_update4;
	String reg_update5;
	String reg_type;
	String comment;
	
	public String getReport_no() {
		return report_no;
	}
	public void setReport_no(String report_no) {
		this.report_no = report_no;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dep() {
		return reg_dep;
	}
	public void setReg_dep(String reg_dep) {
		this.reg_dep = reg_dep;
	}
	public String getReg_manager1() {
		return reg_manager1;
	}
	public void setReg_manager1(String reg_manager1) {
		this.reg_manager1 = reg_manager1;
	}
	public String getReg_manager2() {
		return reg_manager2;
	}
	public void setReg_manager2(String reg_manager2) {
		this.reg_manager2 = reg_manager2;
	}
	public String getReg_manager3() {
		return reg_manager3;
	}
	public void setReg_manager3(String reg_manager3) {
		this.reg_manager3 = reg_manager3;
	}
	public String getReg_manager4() {
		return reg_manager4;
	}
	public void setReg_manager4(String reg_manager4) {
		this.reg_manager4 = reg_manager4;
	}
	public String getReg_manager5() {
		return reg_manager5;
	}
	public void setReg_manager5(String reg_manager5) {
		this.reg_manager5 = reg_manager5;
	}
	public String getReg_title() {
		return reg_title;
	}
	public void setReg_title(String reg_title) {
		this.reg_title = reg_title;
	}
	public String getReg_cont() {
		return reg_cont;
	}
	public void setReg_cont(String reg_cont) {
		this.reg_cont = reg_cont;
	}
	public String getReg_state() {
		return reg_state;
	}
	public void setReg_state(String reg_state) {
		this.reg_state = reg_state;
	}
	public String getReg_reason() {
		return reg_reason;
	}
	public void setReg_reason(String reg_reason) {
		this.reg_reason = reg_reason;
	}
	public String getReg_register() {
		return reg_register;
	}
	public void setReg_register(String reg_register) {
		this.reg_register = reg_register;
	}
	public String getReg_update1() {
		return reg_update1;
	}
	public void setReg_update1(String reg_update1) {
		this.reg_update1 = reg_update1;
	}
	public String getReg_update2() {
		return reg_update2;
	}
	public void setReg_update2(String reg_update2) {
		this.reg_update2 = reg_update2;
	}
	public String getReg_update3() {
		return reg_update3;
	}
	public void setReg_update3(String reg_update3) {
		this.reg_update3 = reg_update3;
	}
	public String getReg_update4() {
		return reg_update4;
	}
	public void setReg_update4(String reg_update4) {
		this.reg_update4 = reg_update4;
	}
	public String getReg_update5() {
		return reg_update5;
	}
	public void setReg_update5(String reg_update5) {
		this.reg_update5 = reg_update5;
	}
	public String getReg_type() {
		return reg_type;
	}
	public void setReg_type(String reg_type) {
		this.reg_type = reg_type;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}

