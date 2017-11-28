package com.group.user.vo;

//부서
public class Department {
	private int dpCode;
	private String dpName;

	public int getDpCode() {
		return dpCode;
	}
	
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}

	public String getDpName() {
		return dpName;
	}
	
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}

	@Override
	public String toString() {
		return "Depart [dpCode=" + dpCode + ", dpType=" + dpName + "]";
	}
}